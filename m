From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Nov 2009 17:23:44 +0100
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <1259078918-15070-1-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Tue\, 24 Nov 2009 17\:08\:38 +0100")
References: <87my2bdihl.fsf@macbook.be.48ers.dk>
	<1259078918-15070-1-git-send-email-daniel@caiaq.de>
Message-ID: <87fx83dh7z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> +config BR2_PACKAGE_SSHFS
 Daniel> +	bool "sshfs (FUSE)"
 Daniel> +	depends on BR2_PACKAGE_LIBFUSE && BR2_PACKAGE_LIBGLIB2 && BR2_PACKAGE_OPENSSH

It's nice to keep lines < 80 chars. I would prefer 3 seperate 'depends on'
lines.

 Daniel> +	help
 Daniel> +	  FUSE makes it possible to implement a filesystem in a userspace
 Daniel> +	  program. Features include: simple yet comprehensive API, secure
 Daniel> +	  mounting by non-root users, support for 2.4 and 2.6 Linux
 Daniel> +	  kernels, multi-threaded operation. etc...

This sounds like a description of fuse itself, and not of sshfs?

 Daniel> +SSHFS_VERSION:=2.2
 Daniel> +SSHFS_SOURCE:=sshfs-fuse-$(SSHFS_VERSION).tar.gz
 Daniel> +SSHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
 Daniel> +SSHFS_AUTORECONF:=NO
 Daniel> +SSHFS_INSTALL_STAGING:=NO
 Daniel> +SSHFS_INSTALL_TARGET:=YES
 Daniel> +
 Daniel> +SSHFS_DEPENDENCIES = libglib2

You're forgetting libfuse

Otherwise it looks good, thanks!

-- 
Bye, Peter Korsgaard
