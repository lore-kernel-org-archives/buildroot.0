From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 19:02:27 +0200
Subject: [Buildroot] [PATCH] iptables: disable static for dynamic builds
In-Reply-To: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021190227.05483ab6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 21 Oct 2014 13:58:14 -0300, Gustavo Zacarias wrote:

> +# Building static causes ugly warnings on some plugins
> +IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
> +	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)

Quick related question: does iptables work properly for purely static
builds?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
