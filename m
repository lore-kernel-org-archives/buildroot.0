From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 21:30:31 +0200
Subject: [Buildroot] [git commit] czmq: unbreak static linking
In-Reply-To: <20150512210011.4ed7af1d@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 12 May 2015 21:00:11 +0200")
References: <20150512184711.BDF2381DA3@busybox.osuosl.org>
 <20150512210011.4ed7af1d@free-electrons.com>
Message-ID: <87a8x9h9uw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > I continue to remain unhappy with such changes. There are two options
 > here:

I agree that it would be better if we could get this kind of fixes
upstream. I don't know how receptive upstream will be as this doesn't
affect "normal people" though.

 >  * Either using gcc to link with a C++ library is incorrect, and czmq
 >    should be fixed to use g++.

That is arguable correct, but things are a bit more complicated as:

- libzerozmq is written in C++ and uses libstdc++ but exposes a C api
- czmq is a higher level wrapper also written in C
- Test program (czmq_selftest) is a C program linking against libczmq
  (and in term libzeromq)

 >  * Or using gcc to link with a C++ library is correct, and in this
 >    case, libzmq.pc should be fixed to include -lstdc++ in Libs.private.

While this is correct, it is not directly related to this. Czmq doesn't
use its own .pc file to know how to link the selftest program.

Alternatively we can simply mark czmq !BR2_STATIC_LIBS.

-- 
Venlig hilsen,
Peter Korsgaard 
