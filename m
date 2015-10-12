From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:57:36 +0200
Subject: [Buildroot] [v2 1/1] make: disable guile support when static
 linking enabled
In-Reply-To: <1442783430-26199-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442783430-26199-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20151012235736.117283b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Sun, 20 Sep 2015 16:10:30 -0500, Ryan Barnett wrote:
> When building in a static only configuration with guile package
> enabled, the following error happens:
> 
>  gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
>  directory
>    #   include <dlfcn.h>
> 
> The file gc_pthread_redirects.h comes from bdwgc, which gets built
> before make in the autobuild test case you're pointing to. This header
> file is known to incorrectly include <dlfcn.h>, unless GC_NO_DLOPEN is
> specified.
> 
> IF GC_NO_DLOPEN is defined, another issue arises due to libguile and
> libintl both defining locale_charset.
> 
> Thus disable guile support for make.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/make/make.mk | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Applied after tweaking the commit log, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
