From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Mar 2014 12:50:46 +0100
Subject: [Buildroot] [PATCH 1/1] Added support for configuration of
 boost binary names layout
In-Reply-To: <1394705581-23659-1-git-send-email-uwe_kindler@web.de>
References: <1394705581-23659-1-git-send-email-uwe_kindler@web.de>
Message-ID: <CAAXf6LUoi-ytoRGZopK9M8=-ea44NdoU4R00Cx-c3Y-n2z=YzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 13, 2014 at 11:13 AM, Uwe Kindler <uwe_kindler@web.de> wrote:
>
> Signed-off-by: Uwe Kindler <uwe_kindler@web.de>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/boost/Config.in |   34 ++++++++++++++++++++++++++++++++++
>  package/boost/boost.mk  |    7 ++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 68c3909..57dd5fc 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -16,6 +16,40 @@ config BR2_PACKAGE_BOOST
>
>  if BR2_PACKAGE_BOOST
>
> +choice
> +       prompt "Layout"
> +       default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +       help
> +         Selects the layout of boost binary names
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +       bool "system"
> +       help
> +         Binaries names do not include the Boost version number or the name and

There is some inconsistency between the various help texts:
boost binary names
binaries names (should be 'binary names')
names of boost binaries

I think you should choose one and use it consistently.
I have no strong opinion but 'boost binary names' seems fine to me.


> +         version number of the compiler.
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> +       bool "tagged"
> +       help
> +         Names of boost binaries include the encoded build properties such as
> +         variant and threading, but do not including compiler name and version, or

do not include

> +         Boost version. This option is useful if you build several variants of
> +         Boost, using the same compiler.

There is also some inconsistency between 'boost' and 'Boost'
capitalization. Also here I think you should choose one consistently.

Best regards,
Thomas
