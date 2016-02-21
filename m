From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:23:36 +0100
Subject: [Buildroot] [PATCH 1/7] package/gstreamer1/gstreamer1: add
 optional support for libcap
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182336.20b8066c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 21 Feb 2016 15:48:39 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +GSTREAMER1_CONF_OPTS += --with-ptp-helper-permissions=capabilities
> +GSTREAMER1_DEPENDENCIES += libcap
> +else
> +GSTREAMER1_CONF_OPTS += --with-ptp-helper-permissions=auto
> +endif

I am not entirely sure about this one. When BR2_PACKAGE_LIBCAP=y, are
we sure that the user wants to use capabilities for everything
including this GStreamer feature? There are other possible values for
--with-ptp-helper-permissions. So it would be good to have a commit log
that details a bit more the reasoning, other than just "it might use
libcap, so let's use it".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
