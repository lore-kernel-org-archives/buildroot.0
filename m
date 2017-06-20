From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:10:05 +0200
Subject: [Buildroot] [PATCH v4] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <20170620165531.24067-1-dmitrii@synopsys.com>
References: <1497955663.5974.31.camel@synopsys.com>
 <20170620165531.24067-1-dmitrii@synopsys.com>
Message-ID: <20170620221005.2c4e6904@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 19:55:31 +0300, Dmitrii Kolesnichenko wrote:
> Add patch to fix following error:
> | ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> |   if (len < (uintptr_t)xdrs->x_base) {
> |              ^~~~~~~~~
> 
> This error occurs with the latest glibc master version (during the testing I had
> glibc commit 92bd70fb85bce57ac47ba5d8af008736832c955a), but doesn't occur with
> version 2.25.
> 
> Patch includes stdint.h to provide uintptr_t.
> 
> It has been submitted upstream:
> https://sourceforge.net/p/libtirpc/mailman/message/35850276/
> 
> Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
> ---
>  ...ild-error-due-to-missing-stdint.h-include.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch

Applied to master, thanks. However, I reformatted the patch using Git,
because upstream libtirpc uses git. It would be nice to do so for your
next patches to Buildroot packages. Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
