From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 18:48:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix musl build
In-Reply-To: <1454158223-10088-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454158223-10088-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207184808.567ac03b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 13:50:23 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/535/5357953e763a1ac4f17332abac54ce2946629a41/
> http://autobuild.buildroot.net/results/cbd/cbd8f4ccde45e157e97ca9ef3035fd9e108e10ab/
> http://autobuild.buildroot.net/results/cbf/cbfc14d5c7a61e997ff091983e586195e85a4316/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kbd/0002-musl-headers-error.patch          | 122 +++++++++++++++++++++
>  .../kbd/0003-fix-struct_winsize-collision.patch    |  18 +++
>  2 files changed, 140 insertions(+)
>  create mode 100644 package/kbd/0002-musl-headers-error.patch
>  create mode 100644 package/kbd/0003-fix-struct_winsize-collision.patch

This was much more complicated than it needs to be: bumping to the
latest version 2.0.3 is easier and fixes the musl build issue. It still
requires the libintl patch, and backporting an already upstream patch
to remove the check dependency. But it's still easier.

See:

  https://git.busybox.net/buildroot/commit/?id=056c9d28c43c6d665d193635a2f1a03998a852b6

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
