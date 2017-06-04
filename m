From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:38:39 +0200
Subject: [Buildroot] [PATCH] package/libiconv: bump to 1.15
In-Reply-To: <20170603214744.20344-1-romain.naour@gmail.com>
References: <20170603214744.20344-1-romain.naour@gmail.com>
Message-ID: <20170604093839.64f6011d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 23:47:44 +0200, Romain Naour wrote:
> libiconv doesn't build with gcc 6 due to a macro in stdio.h using gets()
> which has been removed with the C11 standard.
> 
> _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> 
> With libiconv 1.15, this macro is protected by
> 
>  #if HAVE_RAW_DECL_GETS && !defined __cplusplus
>  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>  #endif
> 
> Fixes:
> http://autobuild.buildroot.net/results/61b/61bbfc839f99feb043d3456f107429d6e5319258
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/libiconv/libiconv.hash | 2 +-
>  package/libiconv/libiconv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
