From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 11:13:15 +0100
Subject: [Buildroot] buildroot directive for acyion after configuring
In-Reply-To: <AANLkTi=iLXet_5auTP_mp1KzsY9wr=FOQVRNVZk+Q0dg@mail.gmail.com>
References: <AANLkTi=iLXet_5auTP_mp1KzsY9wr=FOQVRNVZk+Q0dg@mail.gmail.com>
Message-ID: <20110315111315.5d5a48f5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Mar 2011 02:55:20 -0700
bao bui <buiqbao@gmail.com> wrote:

> I am cross compiling ghost script. Before the configure process, I
> can apply my patch by adding the POST_EXTRACT_HOOKS directive as
> following
> 
> define ESPGS_PATCH_CROSS_COMPILE
>     toolchain/patch-kernel.sh $(ESPGS_DIR) package/espgs/ \*.patch
> endef
> 
> ESPGS_POST_EXTRACT_HOOKS += ESPGS_PATCH_CROSS_COMPILE

You don't need to do that, the package infrastructure already applies
the patches named <pkg>-*.patch from the packages/<pkg>/ directory.

> But after configuring, I want to modify the Makefile which is just
> generated. What directive can I add to the .mk file

You can add a post-configure hook, exactly like the post-extract hook
you used.

> PS: I can not modify the configure and the Makefile.in in this case

Why ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
