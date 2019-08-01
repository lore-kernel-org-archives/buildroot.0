From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:02:39 +0200
Subject: [Buildroot] [PATCH 1/1] qemu: fix host virtfs option
In-Reply-To: <20190801092701.8766-1-vincent.stehle@arm.com>
References: <20190801092701.8766-1-vincent.stehle@arm.com>
Message-ID: <20190801180239.262e5f6e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

On Thu,  1 Aug 2019 11:27:01 +0200
Vincent Stehl? <vincent.stehle@arm.com> wrote:

> Fix the build of host-qemu with virtfs enabled: fix a typo in makefile
> conditional and add a dependency on host-libcap.
> 
> The virtfs configuration option was added by commit e0f49e648401
> ("package/qemu: add option to enable virtual filesystem in host qemu").
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> 
> 
> Hi,
> 
> I build-tested this with a number of architectures[1], with VIRTFS=y/n and
> this looks fine.
>   During testing I remarked that VIRTFS=n is somewhat "weak", as it does
> not forcibly disable virtfs. This means qemu can still auto-detect libcap
> and libattr, and decide to auto-enable virtfs. I think this does not harm,
> but we could also add an explicit --disable-virtfs if preferred. Do not
> hesitate to let me know if I should respin with this change.

Yes, we like to explicitly disable features, when possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
