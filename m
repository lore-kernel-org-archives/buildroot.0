From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Sep 2011 23:13:32 +0200
Subject: [Buildroot] [PATCH 1/2] samba: bump to version 3.5.10
In-Reply-To: <1315815061-9225-2-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 12 Sep 2011 10:11:00 +0200")
References: <8739g2g667.fsf@macbook.be.48ers.dk>
 <1315815061-9225-1-git-send-email-s.neumann@raumfeld.com>
 <1315815061-9225-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87zki95urn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
  Sven> ---
 Sven> +SAMBA_VERSION:=3.5.10
 Sven> +SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 Sven> +SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
 Sven> -SAMBA_VERSION = 3.3.15
 Sven> -SAMBA_SOURCE = samba-$(SAMBA_VERSION).tar.gz
 Sven> -SAMBA_SITE = http://samba.org/samba/ftp/stable/

We prefer the ' =' form rather than ':=', so please don't change
this. More importantly, atleast mount.cifs doesn't seem to build here:

Compiling ../client/mount.cifs.c
../client/mount.cifs.c:42:19: error: fstab.h: No such file or directory
In file included from ../client/mount.cifs.c:62:
./include/config.h:3351:1: warning: "_GNU_SOURCE" redefined
../client/mount.cifs.c:20:1: warning: this is the location of the previous definition
../client/mount.cifs.c: In function 'check_fstab':
../client/mount.cifs.c:266: error: '_PATH_FSTAB' undeclared (first use in this function)

-- 
Bye, Peter Korsgaard
