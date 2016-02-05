From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 5 Feb 2016 14:27:35 +0100
Subject: [Buildroot] [PATCH] uclibc: fix MIPS builds with disabled
	threads
In-Reply-To: <20160205063435.GA22677@waldemar-brodkorb.de>
References: <20160205063435.GA22677@waldemar-brodkorb.de>
Message-ID: <56B4A347.4060902@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On 05/02/16 07:34, Waldemar Brodkorb wrote:
> There was a regression found while building for MIPS
> with disabled threads. Upstream patch fixed it.
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Without the patch:

   AS libc/string/mips/memset.os
libc/string/mips/memset.S:24:21: fatal error: regdef.h: No such file or 
directory
  # include <regdef.h>
                      ^
compilation terminated.

With the patch:

$ file output/build/uclibc-1.0.12/.stamp_target_installed
output/build/uclibc-1.0.12/.stamp_target_installed: empty

Regards,

Vincent.
