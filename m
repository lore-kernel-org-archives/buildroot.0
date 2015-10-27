From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Oct 2015 13:47:58 +0000
Subject: [Buildroot] [PATCH v2] rfkill: new package
In-Reply-To: <1445950874-9848-1-git-send-email-sv99@inbox.ru>
References: <1445950874-9848-1-git-send-email-sv99@inbox.ru>
Message-ID: <562F808E.6010805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

your patch now looks much better. I have some comments about minor details.

The first one, you didn't marked your previous patch as superseded in
Patchwork.

On 10/27/2015 01:01 PM, Viacheslav Volkov wrote:
> Add rfkill package.
> 
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> ---
I was expecting a changelog here. Please read:

http://buildroot.org/manual.html#submitting-patches

Scroll down until "21.5.2. Patch revision changelog".

>  package/Config.in          |  1 +
>  package/rfkill/Config.in   |  7 +++++++
>  package/rfkill/rfkill.hash |  2 ++
>  package/rfkill/rfkill.mk   | 20 ++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/rfkill/Config.in
>  create mode 100644 package/rfkill/rfkill.hash
>  create mode 100644 package/rfkill/rfkill.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 10ff94e..9933514 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -403,6 +403,7 @@ endif
>  	source "package/pps-tools/Config.in"
>  	source "package/pulseview/Config.in"
>  	source "package/read-edid/Config.in"
> +	source "package/rfkill/Config.in"
>  	source "package/rng-tools/Config.in"
>  	source "package/rpi-userland/Config.in"
>  	source "package/rtl8188eu/Config.in"
> diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
> new file mode 100644
> index 0000000..b7a676e
> --- /dev/null
> +++ b/package/rfkill/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RFKILL
> +	bool "rfkill"
> +	help
> +	  rfkill is a small userspace tool to query the state of the rfkill

That line is not wrapped to 72 characters length if we consider the tab
as 8 characters wide. The trailing "rfkill" word should be placed in the
next line.

> +	  switches.
> +
> +	  https://wireless.wiki.kernel.org/en/users/documentation/rfkill

Add a trailing slash (/) to that URL.

Regards,

Vincent.
