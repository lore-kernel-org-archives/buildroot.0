From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 23 Sep 2014 11:05:59 +0000
Subject: [Buildroot] [PATCH 0/2] Make sure WCHAR is enabled if native
 binutils will be build
In-Reply-To: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
References: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1411470358.8968.2.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-08-19 at 02:03 +0400, Alexey Brodkin wrote:
> binutils starting at least from 2.23 when build for target require uClibc
> configured with UCLIBC_HAS_WCHAR otherwise:
> ==========
> libtool: link: [...] -o as-new [...]
> read.o: In function `read_symbol_name':
> read.c:(.text+0x3634): undefined reference to `mbstowcs'
> collect2: error: ld returned 1 exit status
> ==========
> because "mbstowcs" won't be compiled in.
> 
> That's why we need to make sure WCHAR is enabled in toolchain for all
> packages that require native binutils.
> 
> Alexey Brodkin (2):
>   binutils: troubleshoot native binutils building (add WCHAR dependency)
>   packages: add WCHAR dependency for packages that select native
>     binutils
> 
>  package/binutils/Config.in  | 1 +
>  package/dropwatch/Config.in | 1 +
>  package/oprofile/Config.in  | 1 +
>  3 files changed, 3 insertions(+)
> 

Looks like this series got lost among other patches.
Do you mind to revisit following patches?
1) http://patchwork.ozlabs.org/patch/381143/
2) http://patchwork.ozlabs.org/patch/381144/

-Alexey
