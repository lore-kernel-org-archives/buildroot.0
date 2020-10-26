From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:35:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltrace: bump ltrace to more
 recent git repo with latest commit
In-Reply-To: <20201023134329.1810-1-mauro.meneghin@youview.com>
References: <20201023134329.1810-1-mauro.meneghin@youview.com>
Message-ID: <20201026223513.096b2b69@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Oct 2020 14:43:29 +0100
Mauro Meneghin <mauro.meneghin@youview.com> wrote:

> I've updated LTRACE_SITE to point to https://github.com/dkogan/ltrace
> of Dima Kogan that includes some bug fixes, in particular the following
> commit to avoid a crash:
>   192e0a6 void struct members are now ignored
> 
> The previous ltrace version gave me a crash on a ARMv7 device, showing
> this error:
>   "Assertion `field_info->type != ARGTYPE_VOID' failed."
> 
> Using this commit ltrace shows a '<void>' return value in such cases,
> but at least avoids the crash.
> 
> Signed-off-by: Mauro Meneghin <mauro.meneghin@youview.com>

Thanks for your patch. I have rewritten a bit the commit log to not use
first person sentences.

> -LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
> -#LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
> +# This github version has some extra fixes on top of https://ltrace.org/
> +# in particular the following commit to avoid a crash:
> +#   192e0a6 void struct members are now ignored
> +LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
> +LTRACE_SITE = git://github.com/dkogan/ltrace.git

And changed that to use the "github" macro we have in Buildroot.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
