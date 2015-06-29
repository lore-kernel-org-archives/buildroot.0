From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:16:13 +0200
Subject: [Buildroot] [PATCH 03/11] package/rpi-firmware: add option to
 install vcdbg
In-Reply-To: <20150629165240.GA3669@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
 <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
 <20150629031948.GS3250@tarshish> <20150629165240.GA3669@free.fr>
Message-ID: <20150629221613.44f8b6be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 29 Jun 2015 18:52:40 +0200, Yann E. MORIN wrote:

> On 2015-06-29 06:19 +0300, Baruch Siach spake thusly:
> > On Mon, Jun 29, 2015 at 12:25:12AM +0200, Yann E. MORIN wrote:
> > > +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> > > +	bool "vcdbg"
> > > +	depends on BR2_PACKAGE_RPI_USERLAND
> > 
> > There must be a good reason for doing 'depends' instead of 'select' here. Can 
> > you add a comment explaining that?
> 
> OK, I can add a comment.
> 
> Here's the reason: vcdbg is a debug utility, and I don't see selecting
> the whole of rpi-userland just for the one or two libraries that vcdbg
> xfr.org/requires.

Well, still, I believe a 'select' is more appropriate here. I don't
think we generally introduce a "depends on" because the dependency is a
little big. We really only do it when the dependency is quite obvious:
X.org, Python, etc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
