From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 17:11:57 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
In-Reply-To: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 30 Jan 2016 23:51:33 +0100")
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87mvrkcsvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The issue is discussed here:
 > http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/127196

 > I consider this patch an ugly hack but I could compile ~900 packages
 > without a gettext-related error, so I put this patch up for discussion.

 > Fixes
 > http://autobuild.buildroot.net/results/911/9115ddb411ec15eb8bfa1d4f03a804f48e77ff76/
 > and many similar errors

 > To test use the defconfig mentioned above, then

 > make clean
 > make dos2unix (build will succeed either with or without this patch)

 > make clean
 > make gettext
 > make dos2unix (build fails because gettext replaced musl's libintl.h)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hi,

I now spent some quality time (!) with gettext.m4 and figured out what
we really going on here with musl and libintl.h, and I've pushed a
simpler / more complete patch fixing the issue.

I have therefore marked this patch as superseeded.

I've also reverted the madplay fix now that it is handled globally in
TARGET_CONFIGURE_ARGS.

-- 
Bye, Peter Korsgaard
