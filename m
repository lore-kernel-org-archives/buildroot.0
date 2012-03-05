From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 5 Mar 2012 23:58:04 +0200
Subject: [Buildroot] [PATCH v2 2/3] config: make it possible to specify
 which config file to use for 'make defconfig'
In-Reply-To: <1330866196-5360-2-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
 <1330866196-5360-2-git-send-email-arnout@mind.be>
Message-ID: <CAMP44s28xPOm540ePAMXSyLxEOBFzKJyJEkA7+44KpNcJPMXxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 4, 2012 at 3:03 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Is this really from you?

> So that this works:
>
> ?% make defconfig DEFCONFIG=~/busybox-defconfig

> - ? ? ? @$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
> + ? ? ? @$(COMMON_CONFIG_ENV) $< --defconfig$(patsubst %,=%,$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)

Looks like an inconsistency there. AFAICS, it would be 'make defconfig
BR2_DEFCONFIG=foo'.

Cheers.

-- 
Felipe Contreras
