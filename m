From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:06:21 +0200
Subject: [Buildroot] [PATCH 2/2] libgtk3: create icon-theme.cache for
 icon themes
In-Reply-To: <1461236443-16177-2-git-send-email-gustavo@zacarias.com.ar>
References: <1461236443-16177-1-git-send-email-gustavo@zacarias.com.ar>
 <1461236443-16177-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160421220621.6b5b2505@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 08:00:43 -0300, Gustavo Zacarias wrote:

> +# Create icon-theme.cache for each of the icon directories/themes
> +# It's not strictly necessary but speeds up lookups
> +define LIBGTK3_UPDATE_ICON_CACHE
> +	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
> +		-exec $(HOST_DIR)/usr/bin/gtk-update-icon-cache {} \;
> +endef
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
> +endif

I've moved the definition of the hook inside the condition, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
