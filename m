From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:43:36 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] utils/get-developers: fix
 python 3.x compatibility
Message-ID: <20181021124226.7C6F088107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de8e95f0b25ee7092029e2d0be2fed224e8b5118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

This fixes a syntax error introduced in bcf2ed5cc3.

Output before the patch:
    $ ./utils/get-developers outgoing/*
        File "./utils/get-developers", line 97
            print dev
                    ^
        SyntaxError: Missing parentheses in call to 'print'. Did you mean
        print(dev)?

Output after the patch:
    $ ./utils/get-developers outgoing/*
    git send-email --to buildroot at buildroot.org

Signed-off-by: Gr??goire Delattre <gregoire.delattre@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8320ad3341b9242eaf82df7a4d4c1a367991ec3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/get-developers b/utils/get-developers
index 9135b41662..ce882e6699 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -94,7 +94,7 @@ def __main__():
 
         if args.email:
             for dev in matching_devs:
-                print dev
+                print(dev)
         else:
             result = "--to buildroot at buildroot.org"
             for dev in matching_devs:
