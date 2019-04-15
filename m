From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:44:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libglib2: bump to version
 2.60.0
In-Reply-To: <20190415180351.67142-2-aduskett@gmail.com>
References: <20190415180351.67142-1-aduskett@gmail.com>
 <20190415180351.67142-2-aduskett@gmail.com>
Message-ID: <c7359d05-81ec-e3a2-f812-cef521f23f6d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 20:03, aduskett at gmail.com wrote:
> diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> new file mode 100644
> index 0000000000..1138ef1640
> --- /dev/null
> +++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> @@ -0,0 +1,28 @@
> +From 9e0f11a4981737f98bac93a22b6f2ff1a3887b63 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Tue, 9 Apr 2019 13:03:51 -0400
> +Subject: [PATCH] Add '-Wno-format-nonliteral' to compiler arguments.
> +
> +This warning is a false positive on older versions of gcc.
> +See https://gitlab.gnome.org/GNOME/glib/issues/1744 for more details.
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 3c615b7..7cae4e8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -357,6 +357,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Wno-cast-function-type',
> +     # Due to function casts through (void*) we cannot support -Wpedantic:
> +     # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
> ++    '-Wno-format-nonliteral',

 Didn't I say in a previous iteration that this should go before the comment?
The comment is about the no-pedantic so you shouldn't put something in-between.

 Regards,
 Arnout

> +     '-Wno-pedantic',
> +     '-Werror=declaration-after-statement',
> +     '-Werror=format=2',
