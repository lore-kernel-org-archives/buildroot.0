From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Jul 2015 09:11:44 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
In-Reply-To: <5595B17C.2070704@mind.be> (Arnout Vandecappelle's message of
 "Thu, 2 Jul 2015 23:47:40 +0200")
References: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
 <5595B17C.2070704@mind.be>
Message-ID: <87lhexyatr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
 >> index cfce8da..f8f205e 100644
 >> --- a/package/valgrind/valgrind.mk
 >> +++ b/package/valgrind/valgrind.mk
 >> @@ -11,6 +11,7 @@ VALGRIND_LICENSE = GPLv2 GFDLv1.2
 >> VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 >> VALGRIND_CONF_OPTS = --disable-tls
 >> VALGRIND_AUTORECONF = YES
 >> +VALGRIND_INSTALL_STAGING = YES

 >  I wonder, are there going to be a lot of packages that will autodetect valgrind
 > presence and will now start linking with it?

Do programs need to link against valgrind? I thought it only provided a
header with some magic macros that somehow would direct valgrind to
behave differently, but didn't do anything when not running through
valgrind?

In any case, if the user has enabled valgrind, then he/she presumably
wants to enable valgrind support in all applicable packages, but we
indeed will need to add valgrind as an optional dependency of those.

I don't know how common it is to have explicit valgrind support though,
I guess only a few packages have it.

-- 
Bye, Peter Korsgaard
