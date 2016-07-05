From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:15:08 +0200
Subject: [Buildroot] [PATCH 6/6] alsa-lib: update legal info
In-Reply-To: <1467636386-6759-6-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1467636386-6759-6-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160705091508.335f0d99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 18:16:26 +0530, Rahul Bedarkar wrote:

> +ifneq (,$(findstring shm,$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))))
> +ALSA_LIB_HAS_SHM_PLUGIN = y
> +else ifneq (,$(findstring all,$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))))
> +ALSA_LIB_HAS_SHM_PLUGIN = y
> +endif
> +
> +# aserver tool is built when shm pcm plugin is enabled and licensed under GPLv2+
> +ifeq ($(ALSA_LIB_HAS_SHM_PLUGIN),y)
> +ALSA_LIB_LICENSE += , GPLv2+ (aserver tool)
> +ALSA_LIB_LICENSE_FILES += aserver/COPYING
> +endif

I think this is somewhat too complicated, what about just doing:

ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPLv2+ (aserver)

However, the code in src/topology/, which can get linked into the
library, seems to be licensed under GPLv2+. This would make the whole
library GPLv2+, no? If that's the case, then the license information
should be updated accordingly.

I've pushed a commit that adds the aserver licensing information (since
it's already better than it is), but it would be good to clarify the
src/topology/ situation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
