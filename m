From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 16 Apr 2012 09:51:38 +0200
Subject: [Buildroot] [PATCH] boost: bump to 1.49.0
In-Reply-To: <87lilxbe2g.fsf@macbook.be.48ers.dk>
References: <1334241592-3024-1-git-send-email-yegorslists@googlemail.com>
 <87lilxbe2g.fsf@macbook.be.48ers.dk>
Message-ID: <4F8BCF8A.2090608@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.04.2012 10:21, schrieb Peter Korsgaard:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
> 
>  yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> ---
>  yegorslists>  package/boost/boost.mk |    2 +-
>  yegorslists>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
>  yegorslists> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
>  yegorslists> index 4577f2d..e25e24d 100644
>  yegorslists> --- a/package/boost/boost.mk
>  yegorslists> +++ b/package/boost/boost.mk
>  yegorslists> @@ -4,7 +4,7 @@
>  yegorslists>  #
>  yegorslists>  #############################################################
>  
>  yegorslists> -BOOST_VERSION = 1.47.0
>  yegorslists> +BOOST_VERSION = 1.49.0
> 
> This seems to break the autobuild:
> 
> http://autobuild.buildroot.org/results/15d71a3b118a7f391a434d3de2ea6a645d3f02e8/build-end.log
> 
> Looking at the full log, before 40K cp invocations (!) I see what looks
> like a locale issue:
> 
> In file included from libs/locale/src/posix/codecvt.cpp:13:0:
> libs/locale/src/posix/all_generator.hpp:25:59: error: 'locale_t' was not declare
> d in this scope
> libs/locale/src/posix/all_generator.hpp:25:67: error: template argument 1 is inv
> alid
> libs/locale/src/posix/all_generator.hpp:29:59: error: 'locale_t' was not declare
> d in this scope
> libs/locale/src/posix/all_generator.hpp:29:67: error: template argument 1 is inv
> alid
> libs/locale/src/posix/all_generator.hpp:33:63: error: 'locale_t' was not declare
> d in this scope
> libs/locale/src/posix/all_generator.hpp:33:71: error: template argument 1 is invalid
> libs/locale/src/posix/all_generator.hpp:37:59: error: 'locale_t' was not declared in this scope
> libs/locale/src/posix/all_generator.hpp:37:67: error: template argument 1 is invalid
> 
> Does it work for you? The 1.47.0 worked without locale support, so it
> would be good to get this working without it.

Do you mean, if it works with disabled BR2_TOOLCHAIN_BUILDROOT_LOCALE? Yes, it does.

Best regards,
Yegor
