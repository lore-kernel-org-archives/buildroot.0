From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 14:58:30 +0100
Subject: [Buildroot] mjpgstreamer build error with ccache and J=0
In-Reply-To: <10AA8E3F675B42669EDF6C02D65AAE63@JohanW7>
References: <10AA8E3F675B42669EDF6C02D65AAE63@JohanW7>
Message-ID: <20150305145830.67207a96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 5 Mar 2015 14:44:38 +0100, Sagaert Johan wrote:

> mjpgstreamer seems to fail bilding when I have ccache on and number of jobs=0
> 
> I cleaned the ccache before building.
> 
> This is the output of make V=1

Can you try the below patch?

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 2385429..2a0c717 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -15,7 +15,7 @@ MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
 define MJPG_STREAMER_BUILD_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
