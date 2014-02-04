From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 10:01:17 +0100
Subject: [Buildroot] [pkg-perl infra V3 02/12] cpan: a home for Perl
 modules
In-Reply-To: <1385198749-6249-3-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140204090116.GC3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in            |    7 +++++++
>  package/Config.in    |    1 +
>  package/cpan/cpan.mk |    1 +
>  3 files changed, 9 insertions(+)
>  create mode 100644 package/cpan/Config.in
>  create mode 100644 package/cpan/cpan.mk
> 
> diff --git a/Config.in b/Config.in
> index d87e0f0..1b4bf99 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -207,6 +207,13 @@ config BR2_DEBIAN_MIRROR
>  
>  endif
>  
> +config BR2_CPAN_MIRROR
> +	string "CPAN mirror"
> +	default "http://search.cpan.org/CPAN"
> +	help
> +	  CPAN has multiple software mirrors scattered around the world.
> +	  The following allows you to select your preferred mirror.

"following" ? I know you duplicated the other entries, but it does not
really make sense. What about:

    CPAN has multiple software mirrors scattered around the world.
    This option allows you to select a mirror.

    The list of mirrors is available at:
        http://search.cpan.org/mirror

> diff --git a/package/cpan/cpan.mk b/package/cpan/cpan.mk
> new file mode 100644
> index 0000000..764a156
> --- /dev/null
> +++ b/package/cpan/cpan.mk
> @@ -0,0 +1 @@
> +include package/cpan/*/*.mk

This breaks since there is no cpan package yet.
Just introiduce this one change when you add the first CPAN package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
