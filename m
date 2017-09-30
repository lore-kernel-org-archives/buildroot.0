From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 22:05:26 +0200
Subject: [Buildroot] [PATCH] dump1090: new package
In-Reply-To: <20170930195654.cdjrm5cgxieew2l7@tarshish> (Baruch Siach's
 message of "Sat, 30 Sep 2017 22:56:54 +0300")
References: <20170930183842.17954-1-peter@korsgaard.com>
 <20170930195654.cdjrm5cgxieew2l7@tarshish>
Message-ID: <87k20geyux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Sep 30, 2017 at 08:38:42PM +0200, Peter Korsgaard wrote:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---

 > [...]

 >> diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
 >> new file mode 100644
 >> index 0000000000..28a7568a8c
 >> --- /dev/null
 >> +++ b/package/dump1090/dump1090.mk
 >> @@ -0,0 +1,25 @@
 >> +################################################################################
 >> +#
 >> +# dump1090
 >> +#
 >> +################################################################################
 >> +
 >> +DUMP1090_VERSION = bff92c4ad772a0a8d433f788d39dae97e00e4dbe
 >> +DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))
 >> +DUMP1090_LICENSE = BSD-3-Clause
 >> +# no real license file
 >> +DUMP1090_LICENSE_FILES = anet.h
 >> +DUMP1090_DEPENDENCIES = host-pkgconf librtlsdr
 >> +
 >> +define DUMP1090_BUILD_CMDS
 >> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
 >> +endef
 >> +
 >> +define DUMP1090_INSTALL_TARGET_CMDS
 >> +	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/dump1090
 >> +	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/view1090

 > Should be '$(@D)/view1090'.

Gaah, naturally - Will fix, thanks!

-- 
Bye, Peter Korsgaard
