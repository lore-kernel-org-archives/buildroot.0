From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 09:09:28 +0100
Subject: [Buildroot] [PATCH 1/2] alsa-utils: add udev optional dependency
In-Reply-To: <CAPi7W82yrmtuTncj9+8AxkkgS7K+XN+o6cSrmMaNmOe_e_Kj2A@mail.gmail.com>
References: <20181213214802.7730-1-fontaine.fabrice@gmail.com>
 <87mup867qv.fsf@tkos.co.il>
 <CAPi7W82yrmtuTncj9+8AxkkgS7K+XN+o6cSrmMaNmOe_e_Kj2A@mail.gmail.com>
Message-ID: <20181214090928.6c48a2b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Dec 2018 08:52:18 +0100, Fabrice Fontaine wrote:

> > Is there a build time dependency of alsa-utils on udev? As far as I can
> > see alsa-utils only installs the .rules file, so the order of build
> > should not matter.  
> Indeed, there is no build time dependency however if we remove
> --with-udev-rules-dir workaround, udev dependency will be needed to
> have a reproducible build because if udev.pc is not found, rules will
> be installed in /lib/udev/rules.d and if udev.pc is found, rules will
> be installed in /usr/lib/udev/rules.d.

I think what Baruch said is that you should keep:

+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ALSA_UTILS_CONF_OPTS += --with-udev-rules-dir=/usr/lib/udev/rules.d
+endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
