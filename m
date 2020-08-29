From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 16:10:02 +0200
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains: be
 less verbose
Message-ID: <20200902161638.837167FEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1bf9bedd54cf850c0770bc60dd52dd265743ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the debug-level print as noticed by Titouan.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
---
 support/scripts/gen-bootlin-toolchains | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index a5e4b1a99b..ac1a19b3c0 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -378,7 +378,6 @@ def get_toolchains():
         url = os.path.join(BASE_URL, arch, "available_toolchains")
         page = requests.get(url).text
         fnames = sorted(re.findall(r'<td><a href="(\w[^"]+)"', page))
-        print(fnames)
         # This dict will allow us to keep only the latest version for
         # each toolchain.
         tmp = dict()
