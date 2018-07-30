From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 23:46:43 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180730155153.24091-4-m.patzlaff@pilz.de>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
Message-ID: <20180730234643.34315d11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcel,

On Mon, 30 Jul 2018 17:51:53 +0200, Marcel Patzlaff wrote:
> This patch adds the new target above which implements the update routine as
> detailled in the head of this patch series.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>

Thanks for working on this complex topic, as Arnout said.

On my side, I find the semantic of "let's update the _last_ fragment"
to be a bit weird and complex to understand. Why the last one, and not
any other ?

I'm not sure it's possible to have something that updates fragments
with a sensible semantic.

However, what would be useful would be a way to dump the difference
between the current configuration, and what the combination of the
defconfig+fragments provide.

I.e, you start Buildroot with omap2plus_defconfig + some specific
fragments as the kernel configuration.

You run "make linux-show-config-diff", which returns empty.

Then you tweak the configuration with "make linux-menuconfig", and run
"make linux-show-config-diff", which shows you the lines that you need
to put in one of your fragments to preserve the configuration tweaks
you have done.

Of course, the name "linux-show-config-diff" is just made up here, and
some more thought is needed to find a good name. But overall, I believe
the semantic would be much clearer, and doesn't make any assumption on
whether we have one or several fragments, and whether the last fragment
or any other fragment needs to be updated.

What do you think about this? Would this also fill your needs?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
