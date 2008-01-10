From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 10 Jan 2008 21:42:23 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20080110092906.BFE9B12C57C@busybox.net>
References: <20080110092906.BFE9B12C57C@busybox.net>
Message-ID: <20080110104222.GA31267@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 10, 2008 at 01:29:06AM -0800, ulf at uclibc.org wrote:
> Log:
> Use host ldconfig, if external toolchain is used
> 
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +TARGET_LDCONFIG=/sbin/ldconfig
> +else
>  TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
> +endif

How can that be right? What does it fix?

The cross-ldconfig analyses the cross-libraries to produce a
ld.so.cache suitable for the target. 

uclibc provies a suitable ldconfig and buildroot is already 
building me an armeb-uclibc-ldconfig here so everything works fine.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
