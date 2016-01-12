From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:50:22 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: needs a toolchain with
	posix_spawn support
In-Reply-To: <20160112213943.60b8fc12@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 12 Jan 2016 21:39:43 +0100")
References: <1452516753-1555-1-git-send-email-joris.lijssens@gmail.com>
 <20160112213943.60b8fc12@free-electrons.com>
Message-ID: <871t9m8qup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > I know that the vlc package is doing the same for its spawn.h
 > dependency, but I don't like this: the comment says that you need a
 > "uclibc snapshot or uclibc-ng toolchain", but in practice, if you use
 > an external toolchain that uses uClibc-ng, you still won't be able to
 > enable the rabbitmq-c package because BR2_UCLIBC_VERSION_NG is a symbol
 > that is specific to the internal toolchain backend.

 > So I see a few options here:

 >  1/ We do like the blktrace package is doing (for the same reason),
 >     which is allowing the package only on glibc and musl
 >     configurations. This is a bit sad because modern uClibc version are
 >     perfectly capable of handling this package.

 >  2/ We assume that all uClibc versions are now sufficiently recent and
 >     we allow the package with uClibc, with a special exception for the
 >     Blackfin toolchain (which was the reason of the failure).

 > (If we chose either (1) or (2), then we should align vlc and blktrace
 > on the chosen solution)

 > Peter, Yann, what do you think ?

Hmm, difficult. We have only defaulted to uClibc-NG since the 2015.08
release, so that's not that long ago (and people can build uClibc based
external toolchains outside Buildroot), but on the other hand you are
basically on your own if you use a custom uClibc based toolchain that
isn't in sync with how we build them - So I would say, go for option 2.

Yann, do you agree?

-- 
Venlig hilsen,
Peter Korsgaard 
