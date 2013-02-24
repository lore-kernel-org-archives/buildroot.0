From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 04:42:12 +0100
Subject: [Buildroot] [PATCH] new package: gnome-keyring
In-Reply-To: <201302212305.27963.yann.morin.1998@free.fr>
References: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
 <201302212305.27963.yann.morin.1998@free.fr>
Message-ID: <20130224044212.06c85151@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 21 Feb 2013 23:05:27 +0100, Yann E. MORIN wrote:

> > +GNOME_KEYRING_INSTALL_STAGING = YES
> > +GNOME_KEYRING_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> 
> This should point to the host-variant of libgcrypt-config.

Hu? No, gnome-keyring is being built for the target here, and we
install the <foo>-config scripts in $(STAGING_DIR), even though they
are ultimately executed on the host.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
