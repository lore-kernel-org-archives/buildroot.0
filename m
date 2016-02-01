From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 23:42:07 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
In-Reply-To: <dtt4ocxf5l.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Mon, 01 Feb 2016 22:05:17 +0100")
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 <87mvrkcsvm.fsf@dell.be.48ers.dk>
 <dtt4ocxf5l.ln2@ID-313208.user.individual.net>
Message-ID: <87lh749hog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 > Am Mon, 01 Feb 2016 17:11:57 +0100 schrieb Peter Korsgaard:
 >> I now spent some quality time (!) with gettext.m4 and figured out what
 >> we really going on here with musl and libintl.h, and I've pushed a
 >> simpler / more complete patch fixing the issue.
 >> 
 >> I have therefore marked this patch as superseeded.
 >> 
 >> I've also reverted the madplay fix now that it is handled globally in
 >> TARGET_CONFIGURE_ARGS.

 > Hi Peter,

 > there is still a problem left, binutils contains its own intl library 
 > with a GNU libintl.h, similar to the one provided by gettext. It changes 
 > function names in libbfd.so, this leads to a link error at least with 
 > dropwatch:

Thanks. The problem is really that the binutils build system runs
configure in the sub directories from make, and we only pass
TARGET_CONFIGURE_ARGS in the environment of the configure step and not
the make step.

I'll send a fix shortly.

-- 
Bye, Peter Korsgaard
