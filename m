From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2014 23:25:14 +0100
Subject: [Buildroot] [PATCH v3] pyrex: new package
In-Reply-To: <1394920830-12708-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1394920830-12708-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20140315222514.GC3396@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2014-03-15 17:00 -0500, mlweber1 at rockwellcollins.com spake thusly:
> From: Matt Weber <mlweber1@rockwellcollins.com>
> 
> Pyrex is a language that allows you to mix python and C code in a
> single .pyx description file.  This file is then rendered into C
> code by the pyrexc host tool.  That C file then can be used within
> an application build or as part of the normal distutils build
> process used to build a Python extension module.

Great description! Thanks! :-)

> In my use case,
> I was using buildroot to build a python extension module.
> 
> I will be submitting the pypcap package as the application that uses
> this tool to generate an extension module for the libpcap library.

The two sentences above do not really belong to a commit log. Personal
experience may go after a --- line, if needed, as do plans about a
future submission.
 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
> Changes v2 -> v3:
>    - Moved menu entry under host utilities menu (Suggested by Yann)
>    - Updated description and included a description above (Suggested by Yann)
> 
> Changes v1 -> v2:
>    - Converted to a host only pkg as this pkg provides generated
>      C code that an application would use from a sysroot
>      (not on target).  (Suggested by Thomas)
> ---
>  package/Config.in.host               |    1 +
>  package/python-pyrex/Config.in.host  |   10 ++++++++++
>  package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/python-pyrex/Config.in.host
>  create mode 100644 package/python-pyrex/python-pyrex.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index ac6091f..b8706cd 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -12,6 +12,7 @@ source "package/mtools/Config.in.host"
>  source "package/omap-u-boot-utils/Config.in.host"
>  source "package/openocd/Config.in.host"
>  source "package/parted/Config.in.host"
> +source "package/python-pyrex/Config.in.host"
>  source "package/sam-ba/Config.in.host"
>  source "package/squashfs/Config.in.host"
>  source "package/sunxi-tools/Config.in.host"
> diff --git a/package/python-pyrex/Config.in.host b/package/python-pyrex/Config.in.host
> new file mode 100644
> index 0000000..4edeb38
> --- /dev/null
> +++ b/package/python-pyrex/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_PYTHON_PYREX
> +	bool "python-pyrex"

Like for all other host utils we expose in that sub-menu, the prompt
should start with 'host ' as I said in my previous mail. So that should
be:
    bool "host python-pyrex"

Otherwise, looks good. :-)

Care to re-send with that fixed (unless Peter beats you to it when he
applies it) ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
