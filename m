From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:31:58 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: extend the list of unsafe
 paths
Message-ID: <20200621203158.14520-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some legacy systems, the X11 headers and libs are in /usr/X11R66/include
and /usr/X11R66/lib, and of course, some packages are trying to be smart
and use those paths (even when they do not exist).

Add those to the list of unsafe paths to check in the toolchain wrapper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-wrapper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8cfc963ccd..39e9f0850f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -129,6 +129,8 @@ static const struct str_len_s unsafe_paths[] = {
 	STR_LEN(/usr/lib),
 	STR_LEN(/usr/local/include),
 	STR_LEN(/usr/local/lib),
+	STR_LEN(/usr/X11R6/include),
+	STR_LEN(/usr/X11R6/lib),
 	{ NULL, 0 },
 };
 
-- 
2.20.1
