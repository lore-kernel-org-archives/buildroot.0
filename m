From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Mar 2014 14:05:58 +0100
Subject: [Buildroot] [PATCH 1/2] Added support for configuration of
 boost binary names layout
In-Reply-To: <1394713598-3337-1-git-send-email-uwe_kindler@web.de>
References: <1394713598-3337-1-git-send-email-uwe_kindler@web.de>
Message-ID: <CAAXf6LXMfjHrDa9P90roew4zjRmyDTWWeHd5dJ__QjSSFx1vjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Uwe,

On Thu, Mar 13, 2014 at 1:26 PM, Uwe Kindler <uwe_kindler@web.de> wrote:
>
> Signed-off-by: Uwe Kindler <uwe_kindler@web.de>
>
> ---
>  package/boost/Config.in |   34 ++++++++++++++++++++++++++++++++++
>  package/boost/boost.mk  |    7 ++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)


Your second version of this patch is titled "PATCH 1/2" which seems to
indicate that this is the first patch in a series of 2. Instead, you
should mark the patch as "PATCH v2".

Also, when sending a v2/v3/..., please include a list of changes
(revision changelog) so reviewers know what you have changed and can
focus on that.  See
http://nightly.buildroot.org/manual.html#submitting-patches

See also below for one more comment...

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
> +         Selects the layout of Boost binary names
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +       bool "system"
> +       help
> +         Boost binary names do not include the Boost version number or the name and
> +         version number of the compiler.
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> +       bool "tagged"
> +       help
> +         Boost binary names include the encoded build properties such as
> +         variant and threading, but do not including compiler name and version, or

I think you did not see my comment in the previous mail. It should be
"do not include compiler ..."
instead of
"do not including compiler ..."

Best regards,
Thomas
