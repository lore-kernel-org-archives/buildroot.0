From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:37:17 +0100
Subject: [Buildroot] [PATCH v2 2/3] config: make it possible to specify
 which config file to use for 'make defconfig'
In-Reply-To: <1330866196-5360-2-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
 <1330866196-5360-2-git-send-email-arnout@mind.be>
Message-ID: <20120305103717.5125e3c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  4 Mar 2012 14:03:15 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> So that this works:
> 
>  % make defconfig DEFCONFIG=~/busybox-defconfig
> 
> Right now we have to do:
> 
>  % cp ~/busybox-defconfig configs/busybox_defconfig
>  % make busybox_defconfig
> 
> That would dirty the buildroot tree and requires it to be writable.
> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Please change "busybox" to "buildroot" in the commit log. Otherwise,
it's confusing since one might think you're talking about the Busybox
configuration file.

> +	@$(COMMON_CONFIG_ENV) $< --defconfig$(patsubst %,=%,$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)

I'm not sure I understand why patsubst is used here. Something like:

	$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG))

would look more natural to me. Unless I'm missing something, of course.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
