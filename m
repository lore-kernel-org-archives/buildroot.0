From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Mon, 12 Dec 2016 11:43:21 -0000
Subject: [Buildroot] Using 2016.11-rc2: external packages and
	BR2_EXTERNAL ?
In-Reply-To: <20161212120602.3f16376b@free-electrons.com>
References: <23ce01d25454$c528d7e0$4f7a87a0$@chordia.co.uk>
 <20161212120602.3f16376b@free-electrons.com>
Message-ID: <249201d2546c$f090ac60$d1b20520$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

> With the support for multi-br2-external in 2016.11, things have changed a
bit,
> and BR2_EXTERNAL no longer exists. It's name
> BR2_EXTERNAL_<name_of_your_external>.

Thanks. I'm aware of the multi change. 

One problem is that this now makes it difficult to share packages. I'm
currently building for 3 different targets that share a common set of
packages. I think it would make sense to keep BR2_EXTERNAL as _well_ as the
'external' version to handle this case?

I did try modifying support/scripts/br_external as below but it does not
have the expected effect.

Or is there another/better way to do this? Any suggestions?

MTIA

Jerry.

---------------------------------snip-------------------------------
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 055dc08..ea23399 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -147,6 +147,9 @@ do_mk() {
         printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}"
"${br2_ext}"
         printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}"
"${br2_desc}"
     done
+
+       # keep so we know the name of 'this' external
+       printf 'export BR2_EXTERNAL = %s\n' "${BR2_EXTERNAL}"
 }
 
 # Generate the kconfig snippet for the br2-external tree.
