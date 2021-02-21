From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sun, 21 Feb 2021 08:51:34 +0100
Subject: [Buildroot] [PATCH] package/rustc: allow cargo sub packages to
 download using 'git'
Message-ID: <20210221075134.11739-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Adding this simple command to the general cargo configuration
will allow sub packages (with their own cargo.toml file)
to resolve dependencies using 'git'. Without this,
we only support builtin packages or manually downloaded
packages refered to with a local full path.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/rustc/cargo-config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rustc/cargo-config.in b/package/rustc/cargo-config.in
index 47fad026be..be4c401f97 100644
--- a/package/rustc/cargo-config.in
+++ b/package/rustc/cargo-config.in
@@ -1,2 +1,5 @@
 [target. at RUSTC_TARGET_NAME@]
 linker = "@CROSS_PREFIX at gcc"
+
+[net]
+git-fetch-with-cli = true
-- 
2.20.1
