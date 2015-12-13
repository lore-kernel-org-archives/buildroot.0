From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 18:20:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/read-edid: Fix compiler
 check, c++ is not needed
In-Reply-To: <1450019762-21731-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450019762-21731-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213172047.GD3679@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-12-13 16:16 +0100, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/8c1/8c11e463b68121fe0331acf9f8a42a1d3fef40c7//
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: read-edid does not need c++, added new patch suggested by Thomas
> 
>  package/read-edid/0002-Fix-compiler-check.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/read-edid/0002-Fix-compiler-check.patch
> 
> diff --git a/package/read-edid/0002-Fix-compiler-check.patch b/package/read-edid/0002-Fix-compiler-check.patch
> new file mode 100644
> index 0000000..6c5f58c
> --- /dev/null
> +++ b/package/read-edid/0002-Fix-compiler-check.patch
> @@ -0,0 +1,19 @@
> +Fix compiler check
> +
> +By default CMake looks for c++ which the project does not need.
> +
> +Patch by Thomas:
> +http://lists.busybox.net/pipermail/buildroot/2015-December/146865.html
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr read-edid-3.0.2.org/CMakeLists.txt read-edid-3.0.2/CMakeLists.txt
> +--- read-edid-3.0.2.org/CMakeLists.txt	2014-02-05 17:27:26.000000000 +0100
> ++++ read-edid-3.0.2/CMakeLists.txt	2015-12-13 16:08:43.000000000 +0100
> +@@ -1,5 +1,5 @@
> + cmake_minimum_required (VERSION 2.6)
> +-project (read-edid)
> ++project (read-edid C)
> + 
> + option(I2CBUILD "Build I2C get-edid implementation" ON)
> + option(CLASSICBUILD "Build VBE get-edid implementation" ON)
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
