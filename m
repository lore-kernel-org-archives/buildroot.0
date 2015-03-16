From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 15:51:27 +0100
Subject: [Buildroot] [PATCH 3/7 v6] package/fftw: add ARM optimisations
In-Reply-To: <20150316143204.GC4271@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
 <930765fdc259da928cc44c19eb191f71d5132eef.1426513949.git.yann.morin.1998@free.fr>
 <20150316153050.68ab2d76@x230.trabucayre.com>
 <20150316143204.GC4271@free.fr>
Message-ID: <20150316155127.38096559@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 16 Mar 2015 15:32:04 +0100, Yann E. MORIN wrote:

> That's what I initially tried, but it did not work, as fftw compiles
> parts of its code without specifying -mfpu=neon, and thus it falls to
> the value specified by Buildroot, and the compilation breaks.

In this case, pass -mfpu=neon explicitly, like we do in mplayer and
vo-aacenc. Using NEON as the general purpose FPU is quite unlikely,
since using NEON for FPU is not IEEE 754. So most likely people will
use VFPv3/4 as the FPU, but may be interested in using NEON for
specific things.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
