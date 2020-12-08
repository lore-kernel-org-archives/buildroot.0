From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Dec 2020 11:55:38 +0100
Subject: [Buildroot] [PATCH 2/5] support/scripts/gen-bootlin-toolchains:
 riscv32 use a pre-2.33 glibc version without RPC support
In-Reply-To: <11768ed6-2527-fa14-a39e-161012088d46@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-2-romain.naour@gmail.com>
 <20201207225015.57f53daa@windsurf.home>
 <11768ed6-2527-fa14-a39e-161012088d46@gmail.com>
Message-ID: <20201208115538.7c902ea6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Dec 2020 23:30:42 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> > I am not convinced by this approach, as it doesn't work when glibc 2.33
> > gets used for other platforms than RISC-V 32. Instead, what we need to do is:
> > 
> >  (1) Fix how toolchains.bootlin.com generates its fragments to no
> >      longer assume that glibc == RPC available.  
> 
> Agree, but what about existing fragments ? They doesn't provide information
> about RPC support. We need to patch them to add
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y like in the next patch.

I would obviously fix the existing fragments. I already fixed fragments
to address other issues in the past.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
