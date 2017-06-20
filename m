From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 20 Jun 2017 10:47:44 +0000
Subject: [Buildroot] [PATCH v3] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <20170620085146.8558-1-dmitrii@synopsys.com>
References: <20170620085146.8558-1-dmitrii@synopsys.com>
Message-ID: <1497955663.5974.31.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitrii,

On Tue, 2017-06-20 at 11:51 +0300, Dmitrii Kolesnichenko wrote:
> Add patch to fix following error:
> > 
> > ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> > ? if (len < (uintptr_t)xdrs->x_base) {
> > ?????????????^~~~~~~~~
> 
> This error occurs with the latest glibc master version, but doesn't occur with
> version 2.25.

If we're talking about development branch but not a tag it makes
sense to mention commit you're using (in upstream glibc but not any
arc-specific). That way people may understand better where were you
while seeing that problem.

> 
> Patch includes stdint.h to provide uintptr_t.
> 
> It has been submitted upstream:
> https://sourceforge.net/p/libtirpc/mailman/libtirpc-devel/

It worth pointing to a particular message or even better to a commit if it exists.
In your case the patch is here?https://sourceforge.net/p/libtirpc/mailman/message/35850276/
And interesting enough there were no replies since the patch was posted a month ago,
so I would propose to ping libtirpc maintainer to make sure the patch gets accepted sometime soon.

-Alexey
