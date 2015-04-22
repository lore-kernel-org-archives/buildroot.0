From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:48:32 +0200
Subject: [Buildroot] [PATCHv4] toolchain: fix installing gconv libs with
 multi-arch toolchain
In-Reply-To: <1429635352-14756-1-git-send-email-yann.morin.1998@free.fr>
References: <1429635352-14756-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150422224832.49055e84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 18:55:52 +0200, Yann E. MORIN wrote:
> For a multi-arch toolchain, gconv modules are in a sub-directory named
> after the machine gcc targets. This is the case, for example, for the
> Linaro ARM 2014.09 toolchain, which has the gconv modules in (relative
> to the sysroot):
>     /usr/lib/arm-linux-gnueabihf/gconv
> 
> while the Sourcery CodeBench ARM 2014.05 (non-multi-arch) has them in:
>     /usr/lib/gconv
> 
> So, to catter for both cases, search both paths. We want to favour the
> machine-specific gconv modules over potentially existing "generic" ones,
> so we first search that (if it exists) and fallback to looking in the
> generic location.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v3 -> v4:
>   - nothing, just rebased on top of master

I've applied, even though I'm not terribly happy with the huge amount
of complex shell code being added. This gconv stuff is already calling
a shell script to recreate the gconv-modules file. Maybe we should just
move all this logic to a separate shell script, in which we could use
functions and so on?

I've tried to think a bit about writing all of this in make, but it
isn't trivial at all.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
