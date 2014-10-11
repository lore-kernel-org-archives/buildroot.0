From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Oct 2014 19:25:41 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add build option to disable utmpx
 update code
In-Reply-To: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
References: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141011192541.26978885@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Tue, 16 Sep 2014 15:17:30 +0200, Maarten ter Huurne wrote:
> This was modeled after a similar option for Dropbear.
> 
> The utmpx code is automatically disabled when compiling with musl,
> to avoid a build error due to WTMPX_FILE being undefined. Note that
> musl has an empty utmpx implementation, so no functionality is lost
> by not calling it.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Since the patch is not only a feature addition, but also fixing a build
issue when using the musl C library:

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

One minor nit below, that can be fixed by Peter when applying:

> +ifneq ($(BR2_PACKAGE_VSFTPD_UTMPX),y)

Positive logic would be better here:

ifeq ($(BR2_PACKAGE_VSFTPD_UTMPX),)

> +VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_DISABLE_UTMPX
> +endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
