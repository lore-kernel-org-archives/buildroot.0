From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jun 2012 16:57:41 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <CABJxTWEP8Y3bBzQQ29y3ZYyOUEUXY5jnC45SU2Xx8ZoF0kMgJA@mail.gmail.com>
References: <CABJxTWEP8Y3bBzQQ29y3ZYyOUEUXY5jnC45SU2Xx8ZoF0kMgJA@mail.gmail.com>
Message-ID: <20120601165741.04be3924@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 1 Jun 2012 16:35:31 +0200,
Kiril Maler <kiril.maler@gmail.com> a ?crit :

> +++ b/package/sftpserver/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_SFTPSERVER
> +	bool "sftpserver"
> +	depends on BR2_PACKAGE_DROPBEAR
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  sftp-server only from openssh suite. It allows mounting
> +	  the rootfs of embedded board through sshfs, for example
> +	  sshfs root at 192.168.2.1:/ /mnt/board-rootfs
> +
> +	  Unmount with 'fusermount -u -z /mnt/board-rootfs'

> +OPENSSH_VERSION = 5.9p1
> +SFTPSERVER_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
> +SFTPSERVER_SOURCE=openssh-$(OPENSSH_VERSION).tar.gz
> +SFTPSERVER_VERSION=openssh-$(OPENSSH_VERSION)

We already have a package for openssh. Since this is also using the
same source tarball, I think it should rather be integrated as options
to the openssh package.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
