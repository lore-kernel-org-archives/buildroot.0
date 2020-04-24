From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:39:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: depend
 on headers < 5.6
In-Reply-To: <20200410213414.60355-1-james.hilliard1@gmail.com>
References: <20200410213414.60355-1-james.hilliard1@gmail.com>
Message-ID: <20200424143907.2bbed23c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 15:34:14 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since wireguard is built into kernels 5.6 and later we can't build
> wireguard-linux-compat on them, so we need to depend on
> !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied to master.

> +comment "wireguard-linux-compat cannot be used with kernels that have native wireguard support"
> +	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6

I believe this comment was not really useful. Indeed, if you have Linux
greater or equal than 5.6, you can use the built-in wireguard support,
there's no need for an exernal module. So I dropped this comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
