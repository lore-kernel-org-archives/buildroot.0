From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 1 Aug 2018 17:13:38 +0200
Subject: [Buildroot] [PATCH 2/4] minicom: add pre-configure hook to call
 autogen.sh
In-Reply-To: <20180801171010.50380477@windsurf>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
 <20180801125721.34654-3-giulio.benetti@micronovasrl.com>
 <20180801164852.7afe9c99@windsurf>
 <4c0a7347-7dc9-bedb-4fc9-a888b864e8e8@micronovasrl.com>
 <20180801171010.50380477@windsurf>
Message-ID: <9dd10d27-ee6d-69ed-d728-ab589f6cc7b1@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 01/08/2018 17:10, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 1 Aug 2018 17:05:08 +0200, Giulio Benetti wrote:
> 
>> It complains about m4 directory missing.
>> Maybe I could create a workaround for that?
> 
> Example:
> 
> # Autoreconf requires an existing m4 directory
> define BLUEZ_ALSA_MKDIR_M4
>          mkdir -p $(@D)/m4
> endef
> BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4

Ah, yes, I've noticed it, but I thought it was "more right" using 
autogen.sh as in gpm package.
So I follow ALSA package model.

Thank you.

Giulio
