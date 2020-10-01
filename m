From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Oct 2020 10:05:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: fix build of
 gdbserver-only on the ARC gdb version
In-Reply-To: <20200930205203.GW11621@scaer>
References: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
 <20200930205203.GW11621@scaer>
Message-ID: <20201001100526.103bcfab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Sep 2020 22:52:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I was wondering if that should not instead be defined in Config.in, and
> have the various gdb versions select it.
> 
> But it turns out that we do not have a version choice for the target
> variant of gdb; it's really onlythe arc fork, and then gdb-10 when we
> bump it, that have it.
> 
> So, it is easier to handle from gdb.mk, indeed.

Yes, our mess of having a version selection when host-gdb is enabled,
but not when host-gdb is disabled makes that a bit difficult to achieve.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
