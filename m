From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 08:52:47 +0200
Subject: [Buildroot] [PATCH 11/36] package/qemu: new package
In-Reply-To: <1344815664-28138-11-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-11-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201208130852.47290.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 13 August 2012 01:53:59 Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in      |    1 +
>  package/qemu/Config.in |   24 ++++++++++++
>  package/qemu/qemu.mk   |   98 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+), 0 deletions(-)
>  create mode 100644 package/qemu/Config.in
>  create mode 100644 package/qemu/qemu.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3109591..eb02983 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -504,6 +504,7 @@ menu "Miscellaneous"
>  source "package/collectd/Config.in"
>  source "package/empty/Config.in"
>  source "package/mobile-broadband-provider-info/Config.in"
> +source "package/qemu/Config.in"
>  source "package/shared-mime-info/Config.in"
>  source "package/sound-theme-borealis/Config.in"
>  source "package/sound-theme-freedesktop/Config.in"
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> new file mode 100644
> index 0000000..a77d863
> --- /dev/null
> +++ b/package/qemu/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_QEMU
> +	bool "QEMU"
> +	depends on BR2_PACKAGE_PYTHON       # We only need host-python,
> +	                                    # but there's no way to say so.

And I forgot to add this dependency in the .mk. I'll repush this series
later with this change.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
