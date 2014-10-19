From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 15:20:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: download from svn
In-Reply-To: <1413721134-23010-1-git-send-email-kaszak@gmail.com>
References: <1413721134-23010-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141019132003.GV4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-10-19 14:18 +0200, Karoly Kasza spake thusly:
> www.cdrkit.org looks dead, the cdrkit archive always downloads from the
> buildroot.org mirror. This patch points the downloader back to the
> original svn release.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/cdrkit/cdrkit.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
> index 8ec0b8b..b2f0459 100644
> --- a/package/cdrkit/cdrkit.mk
> +++ b/package/cdrkit/cdrkit.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CDRKIT_VERSION = 1.1.11
> -CDRKIT_SITE = http://www.cdrkit.org/releases
> +CDRKIT_SITE = svn://svn.debian.org/debburn/cdrkit/tags/release_1.1.11/
> +CDRKIT_VERSION = 854

NAK. Here's why:

I would prefer we keep a resource that is accessible via the standard
http protocol, as the svn protocol is often blocked by enterprise
firewalls.

So, unless there are very interesting and important changes in the
Debian svn tree, we should switch to using a tarball from the Debian
archives, at:

    http://snapshot.debian.org/

Regards,
Yann E. MORIN.

>  CDRKIT_DEPENDENCIES = libcap bzip2 zlib
>  CDRKIT_LICENSE = GPLv2
>  CDRKIT_LICENSE_FILES = COPYING
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
