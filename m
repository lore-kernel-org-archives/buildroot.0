From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 20:44:28 -0300
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <50FDD171.60804@petroprogram.com>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <50FDD171.60804@petroprogram.com>
Message-ID: <50FDD2DC.8050004@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/2013 08:38 PM, Stefan Fr?berg wrote:

> You will probably need --check=crc32 with that xz-compression.
> I have had difficulties booting linux 3.3.1 kernel (don't know about
> later versions)
> with xz-compressed initramfs without that option.

You are 100% correct.
It didn't fail me during testing because buildroot is never using any
compressed cpio archive, thus the previous options (gzip, bzip2) were
never used.
I noticed when checking the bzImage size in a tweaked qemu_x86_defconfig
test run that it never changed much.
New patchset will follow that fixes this and the previous issue.
Regards.
