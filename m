From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 10:23:38 +0100
Subject: [Buildroot] [PATCH] uclibc: patch 0.9.31 for avr32,
 to add __kernel_long_t and __kernel_ulong_t data types
In-Reply-To: <CAAXf6LUGq3dj4G_wK5udynxcCakN3JJX2o-Dxef-EzJYnvpoqw@mail.gmail.com>
References: <1384505965-19957-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LUGq3dj4G_wK5udynxcCakN3JJX2o-Dxef-EzJYnvpoqw@mail.gmail.com>
Message-ID: <20131115102338.47ffb0d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Nov 2013 10:03:44 +0100, Thomas De Schampheleire wrote:

> A few buildroot developer days ago, we said we'd like to get rid of
> architecture-specific patching. IIRC avr32 was the only architecture
> having such patches. Is it possible to make such patches 'common' in
> the sense that they are always named .patch and thus applied for all
> architectures?
> If the contents should really only be applied to avr32, is it a
> possibility to use some #ifdef inside the patch?

In the specific case of this patch, it modifies only avr32-specific
header files, so I don't quite see why it needs to be
named .patch.avr32 instead of just .patch.

Especially since anyway 0.9.31 can only be enabled for the AVR32
architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
