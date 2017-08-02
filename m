From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:42:36 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix assertion in 2.29
 xtensa ld
In-Reply-To: <1501699199-3006-1-git-send-email-jcmvbkbc@gmail.com>
References: <1501699199-3006-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170802214236.4449b66d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 11:39:59 -0700, Max Filippov wrote:
> Section sorting code in xtensa ld was incorrectly cleaned up in release
> 2.29, resulting in the following assertion when --sort-section,alignment
> option is used:
> 
>   BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965
> 
> Backport the fix that restores original section sorting.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...a-ld-restore-old-section-sorting-behavior.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
