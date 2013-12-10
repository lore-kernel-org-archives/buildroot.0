From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Dec 2013 22:13:11 +0100
Subject: [Buildroot] [PATCH] boost: fixup host variant dependencies
In-Reply-To: <1386684657-15391-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386684657-15391-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LW7wDZE0E14u3u5uXTca7B57tL5LbVnw7HgLHoK4RApgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2013 at 3:10 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Define an empty HOST_BOOST_DEPENDENCIES to avoid inheriting
> BOOST_DEPENDENCIES.
> Also ditch redundant empty definitions for BOOST_DEPENDENCIES and
> BOOST_FLAGS.
>
> Fixes:
> http://autobuild.buildroot.net/results/9c6/9c64dd473a8096bb6343d746544997e333053e8b/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/boost/boost.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index b97d12b..d6d10e1 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -13,9 +13,7 @@ BOOST_INSTALL_STAGING = YES
>  TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
>  HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
>
> -BOOST_DEPENDENCIES =
> -
> -BOOST_FLAGS =
> +HOST_BOOST_DEPENDENCIES =
>
>  # keep host variant as minimal as possible
>  HOST_BOOST_FLAGS = --without-icu \

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
