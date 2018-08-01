From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 17:10:10 +0200
Subject: [Buildroot] [PATCH 2/4] minicom: add pre-configure hook to call
 autogen.sh
In-Reply-To: <4c0a7347-7dc9-bedb-4fc9-a888b864e8e8@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
 <20180801125721.34654-3-giulio.benetti@micronovasrl.com>
 <20180801164852.7afe9c99@windsurf>
 <4c0a7347-7dc9-bedb-4fc9-a888b864e8e8@micronovasrl.com>
Message-ID: <20180801171010.50380477@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Aug 2018 17:05:08 +0200, Giulio Benetti wrote:

> It complains about m4 directory missing.
> Maybe I could create a workaround for that?

Example:

# Autoreconf requires an existing m4 directory
define BLUEZ_ALSA_MKDIR_M4
        mkdir -p $(@D)/m4
endef
BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
