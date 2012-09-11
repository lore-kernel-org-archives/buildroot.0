From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Sep 2012 16:32:55 +0200
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
Message-ID: <20120911163255.07c42a02@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat,  8 Sep 2012 00:21:04 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> -LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex
> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex berkeleydb

Looking at the code, the dependency indeed looks necessary. But isn't
it possible to rework a bit linux-pam to make this dependency optional
(and then submit this upstream)? Of course, if you don't care about
making this dependency optional, then just keep it as it is.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
