From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:57:36 +0200
Subject: [Buildroot] [PATCH] package/lensfun: fix static only build
In-Reply-To: <20170331213249.7920-1-romain.naour@gmail.com>
References: <20170331213249.7920-1-romain.naour@gmail.com>
Message-ID: <20170401135736.372ee9f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 23:32:49 +0200, Romain Naour wrote:
> Build lensfun.a for static only build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/63e/63e7700a242c7c28ede0fe0b6a63db288e73e974/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/lensfun/lensfun.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I was a little bit confused at first, because we normally want the
static library either in the BR2_STATIC_LIBS or BR2_SHARED_STATIC_LIBS
case. But lensfun build system only allows to build either the shared
library *OR* the static library, not both, so what you did is I believe
the best solution.

Therefore: applied, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
