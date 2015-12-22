From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 23:06:25 +0100
Subject: [Buildroot] [PATCH 1/1] linux: avoid multiple dtb append on
 uImages
In-Reply-To: <1440823702-13736-1-git-send-email-derosier@gmail.com>
References: <1440823702-13736-1-git-send-email-derosier@gmail.com>
Message-ID: <20151222230625.13807c38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Aug 2015 21:48:22 -0700, derosier at gmail.com wrote:
> From: Steve deRosier <steve.derosier@lairdtech.com>
> 
> If using appended dtbs on uImages, a 'make linux-rebuild' will end up just
> adding the new dtb after the previous dtb if all you did was modify the
> device tree without a modification that would regenerate the zImage. This
> results in a surprising effect when you boot your device: your DT changes
> don't take effect because linux just loads the first dtb.
> 
> This patch fixes this little edge case by using an intermediate file for the
> append work if using BR2_LINUX_KERNEL_APPEND_UIMAGE. Otherwise it must
> retain the zImage naming, so the situation is unchanged for the case where
> this flag is not set.
> 
> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>

FWIW, this bug was finally fixed by
https://git.busybox.net/buildroot/commit/linux?id=055e6162bba7edb1db78458e089e151abde625b6.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
