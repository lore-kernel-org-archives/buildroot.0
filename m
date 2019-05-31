From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:19:25 +0200
Subject: [Buildroot] [PATCH v4] package/dosfstools: introduce custom
 install routine
In-Reply-To: <20190531194159.2566-1-mmayer@broadcom.com>
References: <20190531194159.2566-1-mmayer@broadcom.com>
Message-ID: <20190531221925.754b3cda@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 May 2019 12:41:59 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> We can't use dosfstools' install target, because it'll install *all*
> binaries, even the disabled ones. Also, we can't just delete dosfstools
> binaries from the target directory after installing them, because other
> packages (specifically Busybox) may provide tools of the same name, and
> we may end up deleting those instead.
> 
> To avoid any issues, we create our own install routines, which only
> copy the enabled binaries into the target location.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

I've applied to master, after doing one change, see below.

> +define DOSFSTOOLS_INSTALL_FSCK_FAT
> +	$(INSTALL) -D -m 0755 $(@D)/src/fsck.fat $(TARGET_DIR)/sbin

The destination path should be a full destination path, which includes
the file name. I fixed that in the three places.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
