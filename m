From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:42:05 +0200
Subject: [Buildroot] [PATCH 1/3] pc_x86_64_bios_defconfig: increase ext2
 filesystem size
In-Reply-To: <20170414212606.13819-1-arnout@mind.be>
References: <20170414212606.13819-1-arnout@mind.be>
Message-ID: <20170415104205.6aef1b2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 23:26:04 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
> size, the default size is now set to 60MB. However, this is too small
> for pc_x86_64_bios_defconfig. Indeed, the ext2 filesystem contains the
> kernel (4MB), the wireless modules (4MB), all firmware for wireless
> modules (40MB), and the wifi userspace (9MB) and the udev hwdb (5MB)
> which brings the total to 70MB.
> 
> Increase the filesystem size to 120000K, which is a nice and round
> number and leaves enough space for overhead on a 128MB flash drive.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  configs/pc_x86_64_bios_defconfig | 1 +
>  1 file changed, 1 insertion(+)

I've applied all three to master, thanks! For PATCH 2/3, it is somewhat
surprising that the Mali blob takes as much as 90 MB, but that's a
separate issue.

If you could resync the Gitlab mirror so that tomorrow morning build of
all defconfigs uses the latest updates, it would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
