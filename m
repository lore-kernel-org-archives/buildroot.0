From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 17:56:11 +0200
Subject: [Buildroot] [PATCH 08/27] package/boost: allow building on
 microblaze
In-Reply-To: <20190614210346.121013-9-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-9-giulio.benetti@micronovasrl.com>
Message-ID: <20190619175611.085941ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jun 2019 23:03:27 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package boost builds correctly on Microblaze with Gcc 4.9/5/6/7/8/9 so
> add 'default y if BR2_microblaze' to
> BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 4e6bbff6df..783e86dc09 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -78,6 +78,7 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
>  	default y if BR2_mipsel
>  	default y if BR2_powerpc
>  	default y if BR2_x86_64
> +	default y if BR2_microblaze

The commit title is misleading: it's not boost that you allow to build
on Microblaze (this is already possible), but the "context" module of
boost.

However, reading the page
https://www.boost.org/doc/libs/1_70_0/libs/context/doc/html/context/architectures.html,
it doesn't seem like Microblaze is part of the supported architectures.

Below the table, there is a note that says "If the architecture is not
supported but the platform provides ucontext_t, Boost.Context should be
compiled with BOOST_USE_UCONTEXT and b2 property
context-impl=ucontext.".

But we're not passing BOOST_USE_UCONTEXT nor context-impl=ucontext. Is
this happening automatically somehow ?

So overall, I think this needs more research/verification, and I'm not
sure it's really worth the effort. Whoever cares enough about
Microblaze and needs the boost-context module can always work on this.
What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
