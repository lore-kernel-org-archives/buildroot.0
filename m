From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 17:35:15 +0100
Subject: [Buildroot] [PATCH 3/3] manual: Add notes about GitHub and hashes
In-Reply-To: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can't take hash from GitHub, unless the tarball has been uploaded by
the maintainer, otherwise it will generated and may change over time,
which renders hash files, useless.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c145829..28312d6 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -372,6 +372,11 @@ the hashes of the downloaded files for the +libfoo+ package.
 The hashes stored in that file are used to validate the integrity of the
 downloaded files.
 
+If +libfoo+ is from GitHub, we can only accept +.hash+ file if the
+package has a release section and the maintainer has uploaded a release
+tarball. Otherwise, the automated generated tarball may change through
+time, rendering a +.hash+ file invalid.
+
 The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
 
-- 
2.1.1
