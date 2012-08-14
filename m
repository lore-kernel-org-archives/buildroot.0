From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:07:39 +0200
Subject: [Buildroot] [PATCH 17/20] xinetd: add support to use RPC
 support from libtirpc
In-Reply-To: <201208121758.52937.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <d88a9e06effd725dd2b9e08e8a702db3709f5211.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121758.52937.yann.morin.1998@free.fr>
Message-ID: <20120814150739.17e04329@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 17:58:52 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > +ifeq ($(BR2_RPC_SUPPORT_AVAILABLE),y)
> 
> What if the toolchain has RPC support? Surely, you do not want to link
> against libtirpc, yes?

Argh, yes, you're correct. I need to distinguish three cases here:

 * No RPC support at all
 * RPC support in the toolchain
 * RPC support through libtirpc

I'll fix that, thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
