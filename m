From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:23:48 +0100
Subject: [Buildroot] [PATCH v1] docs/manual/quickstart: Mention sysroot
 dir.
In-Reply-To: <20191115121022.27662-1-michael.drake@codethink.co.uk>
References: <20191115121022.27662-1-michael.drake@codethink.co.uk>
Message-ID: <20191115212348.5a1a2fa3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for your contribution!

On Fri, 15 Nov 2019 12:10:22 +0000
Michael Drake <michael.drake@codethink.co.uk> wrote:

> Mention that staging/ is a symlink to the host/$(GNU_TARGET_NAME)/sysroot
> directory.

We need your Signed-off-by line here, to be able to apply your patch. However ...

> ---
>  docs/manual/quickstart.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
> index 74158ae249..d9bbc2527b 100644
> --- a/docs/manual/quickstart.txt
> +++ b/docs/manual/quickstart.txt
> @@ -95,7 +95,8 @@ This directory contains several subdirectories:
>    files, unstripped binaries and libraries that make it far too big
>    for an embedded system. These development files are used to compile
>    libraries and applications for the target that depend on other
> -  libraries.
> +  libraries. +staging/+ is actually a symlink to the toolchain's target
> +  sysroot directory inside +host/+.

... I think this section needs a much better overhaul. We want to
extend the description of the "host" directory to mention that it
contains both the tools built for the host *and* the sysroot of the
compiler (possibly reusing the wording of the current staging
directory). And this "host" directory should be documented before
"staging".

And then, the description for staging should be simplified to just say
it's a backward compatibility symlink pointing to the target toolchain
sysroot in host/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
