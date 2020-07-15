From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:27:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] core/br2-external: report
 better error messages
Message-ID: <20200715192515.4DA32873CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bf0794bc3a1cb0bf7d026ccffa3eff41b1adcd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The error is misleading: it reports that no name was provided,
when in fact the external.desc file is missing.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>p
Reviewed-by: Romain Naour <romain.naour@gmail.com>
(cherry picked from commit c62e78a85b7bfb51d3eee1596d56d292b0986c3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index fdea5aa251..ededd2d900 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -75,7 +75,7 @@ do_validate_one() {
         error "'%s': permission denied\n" "${br2_ext}"
     fi
     if [ ! -f "${br2_ext}/external.desc" ]; then
-        error "'%s': does not have a name (in 'external.desc'). See %s\n" \
+        error "'%s': does not have an 'external.desc'. See %s\n" \
             "${br2_ext}" "${MANUAL_URL}"
     fi
     br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
