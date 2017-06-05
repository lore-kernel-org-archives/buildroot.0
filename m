From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:33:34 +0200
Subject: [Buildroot] [PATCH next 1/2] lvm2: add host package
In-Reply-To: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
References: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
Message-ID: <20170605153334.3cbccffe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 14:40:14 +0100, Vicente Olivert Riera wrote:

> +HOST_LVM2_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install

This is wrong. Host installation should basically *never* use DESTDIR,
but prefix instead. Since our autotools-package infrastructure already
passes --prefix=$(HOST_DIR)/usr, you shouldn't have to override to
override the HOST_LVM2_INSTALL_OPTS.

But, this patch is in fact not needed. I'll reply on PATCH 2/2 why.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
