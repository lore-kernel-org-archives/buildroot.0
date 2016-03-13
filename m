From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 21:20:59 +0100
Subject: [Buildroot] [PATCH] slang: make install-static do
	install-pkgconfig
In-Reply-To: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
References: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160313202059.GB3488@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2016-03-13 06:06 +0300, Max Filippov spake thusly:
> mc's configure can't find S-Lang because static S-Lang build doesn't
> install pkgconfig file into staging. Adding install-pkgconfig to
> install-static dependencies fixes that.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
> index ee306a1..b0f8779 100644
> --- a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
> +++ b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
> @@ -39,7 +39,8 @@ diff -rup a/autoconf/Makefile.in b/autoconf/Makefile.in
>   	cd slsh; $(MAKE) all
>  @@ -73,10 +76,11 @@ clean:
>   	cd demo; $(MAKE) clean
> - install-static:
> +-install-static:
> ++install-static: install-pkgconfig
>   	cd src; $(MAKE) install-static
>  +	cd slsh; $(MAKE) install-static
>   install-pkgconfig: slang.pc
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
