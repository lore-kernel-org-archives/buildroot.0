From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 22:43:43 +0200
Subject: [Buildroot] [PATCH 3 of 7] pkg-virtual: simplify definition of
 FOO_VERSION to 'virtual'
In-Reply-To: <bce8edd889a7bc696824.1399822727@argentina>
References: <patchbomb.1399822724@argentina>
 <bce8edd889a7bc696824.1399822727@argentina>
Message-ID: <20140511204343.GG3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
> As mentioned in the e-mail accompanying the introduction of the pkg-virtual
> infrastructure [1], the definition of FOO_VERSION is 'strange'.
> 
> After the cleanup of single/double dollar signs in inner-generic-package,
> the special construction in pkg-virtual is no longer needed and can be
> simplified.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Provided the preceding patches are applied (as-is or after being
reworked, of course):

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> [1] http://lists.busybox.net/pipermail/buildroot/2014-April/093670.html
> 
> ---
>  package/pkg-virtual.mk |  3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> --- a/package/pkg-virtual.mk
> +++ b/package/pkg-virtual.mk
> @@ -45,8 +45,7 @@ endif
>  $(2)_SOURCE =
>  
>  # Fake a version string, so it looks nicer in the build log
> -$(3)_VERSION = virtual
> -HOST_$(3)_VERSION = virtual
> +$(2)_VERSION = virtual
>  
>  # This must be repeated from inner-generic-package, otherwise we get an empty
>  # _DEPENDENCIES

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
