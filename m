From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:22:17 +0100
Subject: [Buildroot] [PATCH 2/4] boot/syslinux: bump version to 6.03
In-Reply-To: <1421710198-20898-2-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
 <1421710198-20898-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150126232217.04b2fec1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 20 Jan 2015 00:29:56 +0100, Romain Naour wrote:
> Remove gnu-efi dependency since it's directly included in
> syslinux sources since 6.03 release. Also remove the patch
> for find-gnu-efi.sh script which was removed.

The script has been renamed to
output/build/syslinux-6.03/efi/check-gnu-efi.sh. And its contents seems
to hint that syslinux can use an external gnu-efi installation, which
would be the preferred solution in Buildroot. Can you investigate this?
Of course, if there is no upstream supported way of using an external
gnu-efi installation, then leave things as is in your current patch.

Also, if the gnu-efi dependency really needs to be removed, you also
need to remove the "select" in syslinux Config.in file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
