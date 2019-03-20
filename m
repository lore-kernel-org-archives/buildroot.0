From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:06:29 +0100
Subject: [Buildroot] [git commit] system/skeleton: remove password
 expiration from shadow
Message-ID: <20190320220327.47BF2814A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8d11c7e55d8dfe395774c04a7a35b949aa6d97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fields in /etc/shadow were set as follows:

root::10933:0:99999:7:::

This sets the date of last password change to Jan 1, 2000, the minimum
password age to 0 days, the maximum password age to near-infinity, and a
warning period of 7 days. In practice, this means the password never
expires. So all of this is quite useless.

On the other hand, mkusers creates lines without all of these options.
It just sets ::::: which disables password expiration completely.

To make things consistent, do the same for the skeleton entries.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 system/skeleton/etc/shadow | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
index 06778f13f9..37de977cba 100644
--- a/system/skeleton/etc/shadow
+++ b/system/skeleton/etc/shadow
@@ -1,9 +1,9 @@
-root::10933:0:99999:7:::
-daemon:*:10933:0:99999:7:::
-bin:*:10933:0:99999:7:::
-sys:*:10933:0:99999:7:::
-sync:*:10933:0:99999:7:::
-mail:*:10933:0:99999:7:::
-www-data:*:10933:0:99999:7:::
-operator:*:10933:0:99999:7:::
-nobody:*:10933:0:99999:7:::
+root::::::::
+daemon:*:::::::
+bin:*:::::::
+sys:*:::::::
+sync:*:::::::
+mail:*:::::::
+www-data:*:::::::
+operator:*:::::::
+nobody:*:::::::
