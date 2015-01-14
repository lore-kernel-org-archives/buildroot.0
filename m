From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 11:01:30 +0100
Subject: [Buildroot] [PATCH] lightning: Require a BR toolchain for
 disassembler support
In-Reply-To: <1421227116-22976-1-git-send-email-paul@crapouillou.net>
References: <1421227116-22976-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150114110130.65e95c58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Wed, 14 Jan 2015 10:18:36 +0100, Paul Cercueil wrote:
> Disassembler support in Lightning requires libopcodes to be installed.
> We cannot assume that an external toolchain will provide it. As such,
> we now require a Buildroot toolchain for this option to be enabled.
> 
> This fixes the following build issue:
> http://autobuild.buildroot.net/results/ed7/ed7abf07f5f870ac332ed909f3cd1d92a2b8d75c/
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/lightning/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

This doesn't make sense. The libopcodes library is part of the target
binutils, which can be enabled regardless of whether an internal
(Buildroot) or external toolchain is used.

When I merged the Lightning package, I did some testing including of
the disassembler support, with a ARM external toolchain, and it was
building fine.

So, this patch is not the proper solution, I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
