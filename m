From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:45:55 +0200
Subject: [Buildroot] [PATCH 1/1] webp: allow to enable demux
In-Reply-To: <20160601033811.6031-4-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160601033811.6031-4-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160603144555.20ed233a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 12:38:11 +0900, Akihiko Odaki wrote:

> +config BR2_PACKAGE_WEBP_DEMUX
> +	bool "webpdemux"
> +	depends on BR2_PACKAGE_WEBP

We normally use a if BR2_PACKAGE_WEBP ... endif block.

> +	help
> +	  "Demux" is a part of WebPMux for extraction and manipulation of an
> +	  extended format WebP file, which can have features like color profile,
> +	  metadata and animation.

Some lines are slightly too long here, they should not be longer than
72 characters.

> +ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
> +WEBP_CONF_OPTS += --enable-libwebpdemux
> +endif

And it should be disabled explicitly in an "else" clause.

I've fixed up those minor nits in a follow-up commit (I normally fix up
the original commit, but I pushed it mistakenly).

Thanks for your contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
