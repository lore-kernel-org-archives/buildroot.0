From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:42:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: fix build failure due to
 gcc bug 93847
In-Reply-To: <20200227211549.GG8743@scaer> (Yann E. MORIN's message of "Thu,
 27 Feb 2020 22:15:49 +0100")
References: <20200220154004.126384-1-giulio.benetti@benettiengineering.com>
 <20200220154004.126384-2-giulio.benetti@benettiengineering.com>
 <871rqh56r3.fsf@dell.be.48ers.dk> <20200227211549.GG8743@scaer>
Message-ID: <87imjrlnaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> This fails for a (hypothetical) toolchain affected by both issues,
 >> perhaps something like this would be better?
 >> 
 >> ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)

 > Or we can keep positive logic and use the available make utilities:

 >     ifeq ($(or $(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847)),y)

We could, but I already applied the change and we use similar logic in a
number of places:

package/armbian-firmware/armbian-firmware.mk:ifneq ($(ARMBIAN_FIRMWARE_FILES)$(ARMBIAN_FIRMWARE_DIRS),)
package/avahi/avahi.mk:ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
package/freerdp/freerdp.mk:ifneq ($(BR2_PACKAGE_FREERDP_CLIENT_X11)$(BR2_PACKAGE_FREERDP_CLIENT_WL),)

-- 
Bye, Peter Korsgaard
