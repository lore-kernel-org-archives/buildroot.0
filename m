From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 21:31:40 +0200
Subject: [Buildroot] [PATCH] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <20170619150626.31273-1-dmitrii@synopsys.com>
References: <20170616142541.51df47c6@windsurf.lan>
 <20170619150626.31273-1-dmitrii@synopsys.com>
Message-ID: <20170619213140.731daabb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 18:06:26 +0300, Dmitrii Kolesnichenko wrote:
> Add patch to fix following error:
> | ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> |   if (len < (uintptr_t)xdrs->x_base) {
> |              ^~~~~~~~~
> 
> It includes stdint.h to provide uintptr_t.
> 
> This patch has been submitted upstream:
> https://sourceforge.net/p/libtirpc/mailman/libtirpc-devel/
> 
> Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>

Thanks, but this commit log and patch description still don't explain
with which version of glibc you're seeing the problem. Indeed, this
error has not been caught by our autobuilders, so one may wonder why
this additional patch is needed.

Can you add such an explanation in the commit description?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
