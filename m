From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 22:32:13 +0200
Subject: [Buildroot] [PATCH v2 0/2] Include makefiles from
 GLOBAL_PATCH_DIR
In-Reply-To: <20191109185512.24139-1-jeremy.rosen@smile.fr>
References: <20191109185512.24139-1-jeremy.rosen@smile.fr>
Message-ID: <20200905203213.GA14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-09 19:55 +0100, J?r?my Rosen spake thusly:
> V2:
> * fix includes happening multiple times on host+target packages
> * change name of included makefiles from .mk to .smk (see commit for
>   details)
> 
> Note that the first patch might be usefull independently of the (more
> controversial) second patch. 
> 
> I am opened to changing the .smk to any pattern you suggest
> I am not sure where to fit this in the documentation. suggestions
> welcomed

As was discussed when we met in Lyon, and elsewhere on the list (sorry,
I can't dig the thread now), we already outlined a better solution,
which is to provide a generic way for a package to be extended or even
completely overriden from a br2-external tree.

I know it's been quite a long time, but I hope you do remember that
discussion, and hopefully you can also dig the thread on the list...

I've now marked that series as rejected.

Thanks.

> J?r?my Rosen (2):
>   allow .smk files as includes in packages
>   Include makefiles from GLOBAL_PATCH_DIR
> 
>  package/pkg-autotools.mk     |  1 +
>  package/pkg-cmake.mk         |  1 +
>  package/pkg-generic.mk       |  8 ++++++--
>  package/pkg-golang.mk        |  1 +
>  package/pkg-kconfig.mk       |  1 +
>  package/pkg-kernel-module.mk |  1 +
>  package/pkg-luarocks.mk      |  1 +
>  package/pkg-meson.mk         |  1 +
>  package/pkg-perl.mk          |  1 +
>  package/pkg-python.mk        |  1 +
>  package/pkg-rebar.mk         |  1 +
>  package/pkg-utils.mk         | 21 ++++++++++++++++++++-
>  package/pkg-virtual.mk       |  1 +
>  package/pkg-waf.mk           |  1 +
>  14 files changed, 38 insertions(+), 3 deletions(-)
> 
> -- 
> 2.24.0.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
