From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 10:03:03 +0200
Subject: [Buildroot] [PATCH 0 of 7] Introduction of kconfig-package
	infrastructure
In-Reply-To: <1639508646.21112604.1406789875618.JavaMail.root@openwide.fr>
References: <patchbomb.1406224167@localhost>
 <1639508646.21112604.1406789875618.JavaMail.root@openwide.fr>
Message-ID: <CAAXf6LWQWWkXt-MaUwQkhYORMOxXCEgWy14epVieZBcBteCEBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

On Thu, Jul 31, 2014 at 8:57 AM, Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:
>
> Quick question... is it possible to relocate the .config file
> elsewhere using env variables ? I am still on my quest to move
> all project specific files (i.e configuration files) out of the
> buildroot directory to be able to build a buildroot project
> without touching the main buildroot directory...

Do you really mean the .config file (the destination file) or do you
mean the file that contains the starting configuration, and that may
be updated with foo-update-config ?

For the latter, individual packages provide config options for this,
for example uclibc and busybox do. You can specify UCLIBC_CONFIG_FILE
on the command line to overwrite it, similarly for
BUSYBOX_CONFIG_FILE.

Best regards,
Thomas
