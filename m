From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 17:03:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Fix static build
In-Reply-To: <0q01bcxqlc.ln2@ID-313208.user.individual.net>
References: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
 <20150826152055.1a997b1f@free-electrons.com>
 <0q01bcxqlc.ln2@ID-313208.user.individual.net>
Message-ID: <20150826170326.73847068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 26 Aug 2015 16:58:40 +0200, Bernd Kuhls wrote:

> tvheadend requires to sign a "Contributor License Agreement" when 
> contributing code:
> https://tvheadend.org/projects/tvheadend/wiki/Contributors
> 
> Since you suggested the patch in question I can not sign such a CLA:
> "You affirm that you have the right to provide the contribution (i.e. 
> it's your own work)." ;)
> 
> How to proceed?

I, Thomas Petazzoni, hereby grants Bernd Kuhls the right to submit the
following trivial and stupid piece of code to the tvheadend project
under his own name, and take the entire credit for the submission.

diff --git a/Makefile b/Makefile
index 037e2fa..1b28c8d 100644
--- a/Makefile
+++ b/Makefile
@@ -38,9 +38,9 @@ CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
 CFLAGS  += -D_FILE_OFFSET_BITS=64
 CFLAGS  += -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
 ifeq ($(CONFIG_ANDROID),yes)
-LDFLAGS += -ldl -lm
+LDFLAGS += -lm
 else
-LDFLAGS += -ldl -lpthread -lm
+LDFLAGS += -lpthread -lm
 endif
 ifeq ($(CONFIG_LIBICONV),yes)
 LDFLAGS += -liconv

Good enough for you? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
