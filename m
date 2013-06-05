From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 23:56:52 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <20130605172207.7251ce79@skate> (Thomas Petazzoni's message of
 "Wed, 5 Jun 2013 17:22:07 +0200")
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
 <8738swej95.fsf@dell.be.48ers.dk> <20130605172207.7251ce79@skate>
Message-ID: <87bo7kb4rf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> In fact, I hadn't realized that libtool was building each and
 Thomas> every .c file twice, once without -fPIC for the static library,
 Thomas> and once with -fPIC for the shared library.

 Thomas> I believe we have three choices:

Yes, like we discussed on IRC I think we need to end up with 3 options:

- Build only shared libraries (default)
- Build only static libraries (BR2_PREFER_STATIC_LIB)
- Build both, and prefer shared libraries (what we have today)

-- 
Bye, Peter Korsgaard
