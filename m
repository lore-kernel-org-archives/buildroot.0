From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jan 2013 09:52:06 +0100
Subject: [Buildroot] [PATCH] New package: cache-calibrator
In-Reply-To: <1359448315-22100-1-git-send-email-sho@relinux.de>
References: <1359448315-22100-1-git-send-email-sho@relinux.de>
Message-ID: <20130129095206.068ce804@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Tue, 29 Jan 2013 09:31:55 +0100, Stephan Hoffmann wrote:

> +CACHE_CALIBRATOR_SOURCE = calibrator.c
> +CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
> +CACHE_CALIBRATOR_EXTRACT_CMDS = cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(D)

I'd prefer to see this below, right before the BUILD_CMDS, as follows:

define CACHE_CALIBRATOR_EXTRACT_CMDS
	cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(@D)
endef

Even though it doesn't change anything, we generally try to use:

VARIABLE = value

for things that are just "values". And:

define VARIABLE_CMDS
	...
endef

for variables that contain commands.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
