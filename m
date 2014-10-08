From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 10:13:02 +0200
Subject: [Buildroot] [PATCH v4 1/2] x264: new package
In-Reply-To: <1412526597-31347-1-git-send-email-0intro@gmail.com>
References: <1412526597-31347-1-git-send-email-0intro@gmail.com>
Message-ID: <20141008101302.4a55429a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David du Colombier,

On Sun,  5 Oct 2014 18:29:56 +0200, David du Colombier wrote:

> +ifeq ($(BR2_i386)$(BR2_x86_64),y)
> +	FFMPEG_DEPENDENCIES += host-yasm
> +else
> +	X264_CONF_OPTS += --disable-asm
> +endif

Well, I still believe this is suboptimal since there is some assembly
code for ARM that is available, but only for ARMv6+. But oh well, it
can always be implemented as a followup improvement.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
