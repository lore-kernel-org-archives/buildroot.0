From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 12:26:16 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: add COPY_OLD_LICENSE_FILE fix to
 rsync hook
In-Reply-To: <1451356050-6300-1-git-send-email-nunes.erico@gmail.com>
References: <1451356050-6300-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20151229122616.2ddd9ad0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Tue, 29 Dec 2015 00:27:30 -0200, Erico Nunes wrote:
> make legal-info breaks when using an older u-boot version in local.mk
> with OVERRIDE_SRCDIR, due to the reorganization of license files which
> happened in u-boot v2013.10.
> This issue had already been fixed in Buildroot for the regular use of
> old u-boot versions (non-local.mk).
> This patch adds the same fix to UBOOT_POST_RSYNC_HOOKS so that it also
> covers the local.mk case.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)

I am not super happy with having to duplicate all extract and patch
hooks as rsync hooks. The theory is that if you use a
<pkg>_OVERRIDE_SRCDIR, you should know what you're doing, and your
source tree should match the expectations of Buildroot.

But oh well, it kind of makes sense to help in this case, so I've
applied your patch. Still there is an open discussion on where to draw
the line for those post rsync hooks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
