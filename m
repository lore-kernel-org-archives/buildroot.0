From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:28:20 +0100
Subject: [Buildroot] [git commit master 1/1] sshfs: select openssh
 instead of depending
In-Reply-To: <20110117202412.A4D0289008@busybox.osuosl.org>
References: <20110117202412.A4D0289008@busybox.osuosl.org>
Message-ID: <20110124172820.13b2e781@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Again not related to this change, but spotted during review.

On Mon, 17 Jan 2011 21:23:00 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

If we:

>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_OPENSSH

Then presumably we should:

>  SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)

SSHFS_DEPENDENCIES = \
	libglib2 libfuse openssh \
	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
	$(if $(BR2_ENABLE_LOCALE),,libiconv)

(i.e add openssh and libiconv in the dependencies)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
