From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 23 Nov 2016 15:50:42 +0000
Subject: [Buildroot] [PATCH] gcc: the special workaround for ARC is no
 longer required
In-Reply-To: <20161123112016.GA29549@waldemar-brodkorb.de>
References: <20161123112016.GA29549@waldemar-brodkorb.de>
Message-ID: <1479916183.3931.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Wed, 2016-11-23 at 12:20 +0100, Waldemar Brodkorb wrote:
> It seems with the change to gcc 6.x based toolchain this
> workaround is no longer required. Tested with an arc hs toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Nice catch!

Indeed since?https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/80a9c1591ccce130ced8ee4581efacd55ba0a81e
there's no libgmon building for ARC in gcc.

But unfortunately that's one of very few patches that were not yet merged
in upstream gcc. That said if anybody attempts to build toolchain for ARC
right out of upstream GCC the code in question will be required.

But given the fact we're not ready to switch to upstream GCC ATM
your change is very much appreciated so

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
