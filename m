From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:14:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/gcc: Initialize st in
 elf_is_symlink
In-Reply-To: <20190318015933.3478-1-james.hilliard1@gmail.com>
References: <20190318015933.3478-1-james.hilliard1@gmail.com>
Message-ID: <20190318221417.74c1a981@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Mon, 18 Mar 2019 09:59:33 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Fixes:
> ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function ?elf_is_symlink?:
> ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    return S_ISLNK (st.st_mode);
>                      ^
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...race-Initialize-st-in-elf_is_symlink.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/gcc/8.3.0/0001-libbacktrace-Initialize-st-in-elf_is_symlink.patch

The patch has been rejected upstream, so I'm not really keen on merging
this. In addition, you're not giving enough details on the conditions
under which this issue was found. Which configuration ? Which host gcc
version ? etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
