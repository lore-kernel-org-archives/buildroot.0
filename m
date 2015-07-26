From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:20:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] toolchain-external wrapper: don't
 pass march/mcpu if mtune is on cmdline
In-Reply-To: <1437907987-5821-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437907987-5821-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726152050.0b11fbc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 26 Jul 2015 12:53:07 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Before commit 5715d2dcf48a39c16a3f3e41c97109613fed121d, the external
> toolchain wrapper would not pass its own march/mcpu/mtune flags to the real
> compiler if at least one of them was passed on the wrapper command-line.
> 
> The mentioned commit intended to remove the passing of an mtune parameter
> coming from Buildroot, which was always empty after some other refactoring,
> but the changes have the side-effect that march/mcpu is now also passed when
> mtune is already given on the command-line. In that case, only mtune should
> be passed to the real compiler.
> 
> Restore part of the original toolchain wrapper code to check the presence of
> mtune on the command-line.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
> v2: do not unnecessarily increase EXCLUSIVE_ARGS (Yann)

Applied, thanks. I'm wondering if there will be any nasty side effect
of this, but oh well, let's see what happens :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
