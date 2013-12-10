From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Dec 2013 22:19:03 +0100
Subject: [Buildroot] [RFC PATCH] Add a time zones repository
In-Reply-To: <1386605561-7244-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1386605561-7244-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAAXf6LVz7_n3mxFEkiTtAWCNzSvhkH4D7wR38+2uA3k+AStFJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 9, 2013 at 5:12 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> This adds a time zones repository as /etc/TZ so that uclibc users can
> have an easy way to select their timezone. This is based on the current
> list from openwrt which seems up to date.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  system/Config.in |   9 +
>  system/TZ        | 793 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  system/system.mk |   8 +
>  3 files changed, 810 insertions(+)
>  create mode 100644 system/TZ
>
> diff --git a/system/Config.in b/system/Config.in
> index 54c196c69e9d..9421c36e651b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -332,4 +332,13 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
>           directory / images directory. The arguments in this option will be
>           passed *after* those.
>
> +config BR2_TIMEZONE
> +       bool "Install timezones"
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC

Is this really for all C libraries that are not glibc, or is it rather
for uClibc?
In other words: have you checked the situation for the musl C library?


Additionally, maybe you could add a comment (in system/TZ, and maybe
also in the Config.in help text) explaining that you should uncomment
one of the items to select the timezone?

Best regards,
Thomas
