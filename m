From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jul 2015 21:52:53 +0300
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
	musl
In-Reply-To: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150720185253.GR13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Mon, Jul 20, 2015 at 07:35:46PM +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/33e/33ef25e4707a5b81083204e0f064570c11d88af6/

Please spare a few words on what this patch is doing.

Also, your sign-off is missing.

> ---
>  package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch | 76 +++++++++++++++++++++++++
>  package/acpid/0004-fix-warnings.patch           | 38 +++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
>  create mode 100644 package/acpid/0004-fix-warnings.patch
> 
> diff --git a/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
> new file mode 100644
> index 0000000..7d81b3c
> --- /dev/null
> +++ b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
> @@ -0,0 +1,76 @@
> +Add missing TEMP_FAILURE_RETRY.
> +
> +Some external toolchains using strange C libraries (eg MUSL) do not define
> +this macro.

What is the upstream status of this patch?

> +
> +Signed-off-by : Brendan Heading <brendanheading@gmail.com>

[snip]

> diff --git a/package/acpid/0004-fix-warnings.patch b/package/acpid/0004-fix-warnings.patch
> new file mode 100644
> index 0000000..3c6a89d
> --- /dev/null
> +++ b/package/acpid/0004-fix-warnings.patch

Does this patch fix build failure or correctness? Buildroot generally doesn't 
carry warning fix only patches.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
