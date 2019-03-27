From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 17:55:03 +0100
Subject: [Buildroot] [PATCH 1/3] package/s6-linux-init: Build also for
 the host
In-Reply-To: <20190216212835.25503-2-vadim4j@gmail.com>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-2-vadim4j@gmail.com>
Message-ID: <20190327175503.5be2fb03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

I am not familiar with s6, so sorry if I'm asking silly questions in
this review.

On Sat, 16 Feb 2019 23:28:33 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Add strict dependency for host-s6-linux-init to use s6-linux-init-maker
> on the host during the rootfs generation.

I think the wording is not great here: "strict dependency" does not
mean anything in the typical Buildroot speak. I think you wanted to say
"We add host-s6-linux-init as a dependency of the target s6-linux-init,
so that the latter can use the s6-linux-init-maker program as part of
its build process".

However, I think adding this dependency should belong to PATCH 2/3,
where s6-linux-init is actually changed to use s6-linux-init-maker.
Indeed, as I understand it, it's only starting with PATCH 2/3 that
s6-linux-init will need this program. Is this correct ?

If it is, then PATCH 1/3 should only change s6-linux-init.mk to add the
host variant of s6-linux-init.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
