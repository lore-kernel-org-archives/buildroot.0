From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:40:08 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: update pkg-kconfig doc
 about <pkg>-diff-config
In-Reply-To: <20190805064301.3261-1-m.patzlaff@pilz.de>
References: <20190805064301.3261-1-m.patzlaff@pilz.de>
Message-ID: <20190805224008.3dc38916@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Aug 2019 08:43:01 +0200
Marcel Patzlaff <m.patzlaff@pilz.de> wrote:

> Briefly states what the output of this target is about.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  docs/manual/adding-packages-kconfig.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
> index 982c1229ea..fa0bfd2b29 100644
> --- a/docs/manual/adding-packages-kconfig.txt
> +++ b/docs/manual/adding-packages-kconfig.txt
> @@ -43,6 +43,11 @@ This snippet creates the following make targets:
>    options that differ from the default values. It is not possible to
>    use this target when fragment files are set.
>  
> +* +foo-diff-config+, which outputs differences between the current
> +  configuration and the one obtained by merging the defconfig with all set
> +  configuration fragment files. The output is useful to identify entries

In fact the configuration may not come from a defconfig + fragments, it
may also come from a full configuration file.

> +  that are not yet in any configuration fragment file.

I've slightly reworded this, and applied.

One thing that bothers me a bit is that these make targets are really
useful to the Buildroot user, but their documentation is buried inside
the kconfig-package infrastructure documentation, which is unlikely to
be read. But this is not your fault, other kconfig-specific make
targets were documented here. It just shows that our documentation is
not as well-structured as it should be.

Another thing: could you write a test case in support/testing/ for this
pkg-diff-config feature ? Indeed, it is not a feature tested
automatically by our autobuilders, so it would be nice to exercise it
through an explicit test in support/testing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
