From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:21:53 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <1482241596-31688-12-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
Message-ID: <fb053310-8bb7-17f7-c63b-b4bca25fbced@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jerome,

 Please wrap your commit messages at 72 columns (vim wrap will do that for you :-).

On 20-12-16 14:46, J?r?me Pouiller wrote:
> libtool include support for cross-compilation since v1.5. In order to enable it,
                 ^s

> we have to pass `--with-sysroot' to `configure' script. With this option,
                                     ^the

> autoconf fill `$lt_sysroot' and libtool will search libraries in `$lt_sysroot'
               ^s                                                 ^the

> subtree.
> 
> Note Yocto force `$lt_sysroot' even if --with-sysroot is not provided:
      ^:          ^s
>   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch

 What a horrible hack is that patch, turning 'yes' into 'no'...

> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout

> ---
>  package/pkg-autotools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index f7b8488..bb20eec 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -192,6 +192,7 @@ define $(2)_CONFIGURE_CMDS
>  		--sysconfdir=/etc \
>  		--localstatedir=/var \
>  		--program-prefix="" \
> +		--with-sysroot \
>  		--disable-gtk-doc \
>  		--disable-gtk-doc-html \
>  		--disable-doc \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
