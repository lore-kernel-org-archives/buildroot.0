From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:31:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: adds target install of
 systemd unit files
In-Reply-To: <20201231154332.13ef7654@windsurf>
References: <20201215163610.12070-1-edmundo.ferreira@esa.int>
 <20201231154332.13ef7654@windsurf>
Message-ID: <20201231173109.7d874dc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Dec 2020 15:43:32 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hum, I've applied, but reading again distro/systemd/Makefile.am, it
> seems like manually copying those files is not needed. If you pass
> --enable-systemd, which we already do when BR2_PACKAGE_SYSTEMD=y. Isn't
> that working ?

I found why: we had a custom OPENVPN_INSTALL_TARGET_CMDS instead of
relying on the default "make install" behavior of the autotools-package
infra. So, I made a follow-up commit that drops this as well as the
custom systemd installation stuff, as "make install" does it all
properly.

See:

  https://git.buildroot.org/buildroot/commit/?id=30bc58d3766b240017120a25d843da0a2c5cf501

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
