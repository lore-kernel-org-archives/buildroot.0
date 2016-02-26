From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 23:45:35 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing monodoc leaking path
In-Reply-To: <1456438127-15919-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1456438127-15919-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <56D0D58F.30605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 23:08, Angelo Compagnucci wrote:
> This patch fixes a leak in host compiler path for monodoc.
> This bug is solved upstream but the fix is not included
> in the latest stable release.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> ---
>  ...-monodoc-Fixing-wrong-monodoc-search-path.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
> 
> diff --git a/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch b/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
> new file mode 100644
> index 0000000..58fa323
> --- /dev/null
> +++ b/package/mono/0008-monodoc-Fixing-wrong-monodoc-search-path.patch
> @@ -0,0 +1,29 @@
> +From 18bba65adf58d54645398de26eac24081d48f793 Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +Date: Thu, 25 Feb 2016 22:19:31 +0100
> +Subject: [PATCH] mcs/class/monodoc/Makefile: Fixing wrong monodoc search path
> +
> +mono_libdir actually leaks host compiler path, fixing
> +by hardcoding correct path for our usecase.
> +
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +---
> + mcs/class/monodoc/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mcs/class/monodoc/Makefile b/mcs/class/monodoc/Makefile
> +index 3ebba80..ddc2098 100644
> +--- a/mcs/class/monodoc/Makefile
> ++++ b/mcs/class/monodoc/Makefile
> +@@ -135,7 +135,7 @@ test-local: setup-doc-sources
> + dist-local: Monodoc.Ecma/EcmaUrlParser.cs
> + 
> + $(the_lib).config: Makefile monodoc.dll.config.in
> +-	sed 's, at monodoc_refdir@,$(mono_libdir)/monodoc,g' monodoc.dll.config.in > $@
> ++	sed 's, at monodoc_refdir@,/usr/lib/monodoc,g' monodoc.dll.config.in > $@
> + 
> + Monodoc.Ecma/EcmaUrlParser.cs: Monodoc.Ecma/EcmaUrlParser.jay $(topdir)/jay/skeleton.cs jay.sh
> + 	$(topdir)/$(thisdir)/jay.sh $(topdir) $< $@ $(JAY_FLAGS)
> +-- 
> +1.9.1
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
