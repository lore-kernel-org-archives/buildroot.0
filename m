From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Mon, 26 Oct 2015 13:49:30 +0100
Subject: [Buildroot] [git commit] x265: new package
In-Reply-To: <20151025213049.17FF27FACD@busybox.osuosl.org>
References: <20151025213049.17FF27FACD@busybox.osuosl.org>
Message-ID: <CAHCOiUR7k3dquucMLQb+HiLuYmpCnyeTSygv+xV2VS0PHp=sdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Oct 25, 2015 at 10:30 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=b261a01323352f6b6b19dffff5ee336be581de86
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> x265 is a H.265 / HEVC video encoder application library, designed to encode
> video or images into an H.265 / HEVC encoded bitstream.
>
> http://x265.org
>
> [Peter: use positive logic for CLI option]
> Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...
> +
> +ifeq ($(BR2_PACKAGE_X265_CLI),y)
> +X265_CONF_OPTS += -DENABLE_CLI=true
> +else
> +X265_CONF_OPTS += -DENABLE_CLI=else
> +endif

This might be a bit too positive :-) (always resolves to true)

Gr,
Thijs
