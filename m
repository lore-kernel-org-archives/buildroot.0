From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:55:20 +0200
Subject: [Buildroot] [PATCH] mesa3d: specify llvm-prefix
In-Reply-To: <551A7CE6.2070701@zacarias.com.ar>
References: <1427757360-20575-1-git-send-email-gustavo@zacarias.com.ar>
 <20150331112525.5db42fa3@free-electrons.com>
 <551A7CE6.2070701@zacarias.com.ar>
Message-ID: <20150331135520.1e5d2744@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 07:54:30 -0300, Gustavo Zacarias wrote:
> On 03/31/2015 06:25 AM, Thomas Petazzoni wrote:
> >> +# Avoid automatic search of llvm-config
> >> +MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
> > 
> > Shouldn't we instead test if LLVM is available, explicitly disable LLVM
> > support if not, and enable it if LLVM is available?
> 
> We don't have a llvm package in BR, so testing is a non-option.

Well what I meant is that since we don't have a LLVM option right now,
we should display LLVM support completely.

And we do have patches in patchwork to add LLVM.

> There's no explicit option to disable llvm support, hence this is as
> close as it gets without patching.
> (--without-gallium-drivers comes close, but it takes down a whole bunch
> of other stuff as well).

Ok. Applied then, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
