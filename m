From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:00:15 +0200
Subject: [Buildroot] [PATCH] package/f2fs-tools: fsck should use correct
 returncodes
In-Reply-To: <20200805094229.287492-1-nolange79@gmail.com>
References: <20200805094229.287492-1-nolange79@gmail.com>
Message-ID: <20200805150015.7153868a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Aug 2020 11:42:28 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> fsck.f2fs does not implement the returncodes from the fsck interface.
> This is particularly bad if systemd is used with a root f2fs partition,
> as it will interpret the rc as order to reboot.
> 
> for thread & pending upstream fix see:
> https://sourceforge.net/p/linux-f2fs/mailman/message/37078057/
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...002-f2fs_return_correct_return_value.patch | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 package/f2fs-tools/0002-f2fs_return_correct_return_value.patch
> 
> diff --git a/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch b/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch
> new file mode 100644
> index 0000000000..bcaf7d657e
> --- /dev/null
> +++ b/package/f2fs-tools/0002-f2fs_return_correct_return_value.patch
> @@ -0,0 +1,127 @@
> +fsck.f2fs does not implement the returncodes from the fsck interface.
> +This is particularly bad if systemd is used with a root f2fs partition,
> +as it will interpret the rc as order to reboot.
> +
> +see: https://sourceforge.net/p/linux-f2fs/mailman/message/37078057/
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>

Could you use the proper Git formatted patch that was posted at
https://sourceforge.net/p/linux-f2fs/mailman/message/37078057/,
preserving the authorship, etc. ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
