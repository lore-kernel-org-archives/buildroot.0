From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:28:08 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper.c: extend the
 list of unsafe paths
Message-ID: <20200622203734.2AF68841E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07d37d226c7e8808bd5b68d94265e3ce47b3ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some legacy systems, the X11 headers and libs are in /usr/X11R66/include
and /usr/X11R66/lib, and of course, some packages are trying to be smart
and use those paths (even when they do not exist).

Add those to the list of unsafe paths to check in the toolchain wrapper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
