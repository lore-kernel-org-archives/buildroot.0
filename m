From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 22:48:19 +0100
Subject: [Buildroot] [PATCH 04/80 v1] package/angularjs: simplify
 modules selection
In-Reply-To: <0ff063277872269c4b86770a44755cd68e232680.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <0ff063277872269c4b86770a44755cd68e232680.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <20160118224819.3957df62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 16 Jan 2016 23:36:56 +0100, Yann E. MORIN wrote:
> Remove the superfluous config option, and make all modules default to
> 'y', which provides exactly the same functionality.
> 
> simplify (and slightly beautify) the handling of modules in the .mk:
> since the modules' symbols are always meaningful now, we can get rid of
> the else-clause, and always build the list of modules using the Kconfig
> options.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---

You have an empty line at the end of many commit logs.

I agree with the principle of the patch, but sometimes is odd:


> +# This list mirrors the list of available modules from Config.in.
> +# Keep this list in sync and in the same (alphabetical) order as the
> +# one in Config.in. However, always keep 'angular' first in the list.

You say "angular" must be first in the list...

> +ANGULARJS_MODULES = \
> +	animate \
> +	aria \
> +	cookies \
> +	messages \
> +	message-format \
> +	resource \
> +	route \
> +	sanitize \
> +	touch

But there is no "angular" in this list.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
