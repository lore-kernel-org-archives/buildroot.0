From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 16:02:05 +0100
Subject: [Buildroot] [PATCH 2/2] iucode-tools: new package
In-Reply-To: <1391505958-17221-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 4 Feb 2014 10:25:58 +0100")
References: <1391505958-17221-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1391505958-17221-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <871tzi6hw2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > iucode_tool is a program to manipulate Intel? X86 and X86-64 processor
 > microcode collections, and to use the kernel facilities to upgrade the
 > microcode on Intel system processors.
 > It was originally sent by Richard Braun <rbraun@sceen.net>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Richard Braun <rbraun@sceen.net>
 > ---
 >  package/Config.in                  |  1 +
 >  package/iucode-tool/Config.in      |  8 ++++++++
 >  package/iucode-tool/S00iucode-tool | 23 +++++++++++++++++++++++
 >  package/iucode-tool/iucode-tool.mk | 19 +++++++++++++++++++
 >  4 files changed, 51 insertions(+)
 >  create mode 100644 package/iucode-tool/Config.in
 >  create mode 100644 package/iucode-tool/S00iucode-tool
 >  create mode 100644 package/iucode-tool/iucode-tool.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index e452c1e..ee2a68e 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -304,6 +304,7 @@ source "package/input-tools/Config.in"
 >  source "package/intel-microcode/Config.in"
 >  source "package/iostat/Config.in"
 >  source "package/irda-utils/Config.in"
 > +source "package/iucode-tool/Config.in"
 >  source "package/kbd/Config.in"
 >  source "package/lcdproc/Config.in"
 >  source "package/lm-sensors/Config.in"
 > diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
 > new file mode 100644
 > index 0000000..a9670ce
 > --- /dev/null
 > +++ b/package/iucode-tool/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_IUCODE_TOOL
 > +	bool "iucode-tool"
 > +	depends on BR2_x86_64 || BR2_i386
 > +	select BR2_PACKAGE_INTEL_MICROCODE
 > +	help
 > +	  Intel processor microcode tool
 > +
 > +	  http://packages.debian.org/source/sid/iucode-tool

I've dropped the 'sid' part of the upstream URL and committed, thanks.

-- 
Bye, Peter Korsgaard
