From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:02:20 +0200
Subject: [Buildroot] [git commit] boa: boa.conf: run under the nogroup group
Message-ID: <20160826090905.4F8A181D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f708c1cd55c2e7dbbc4cc3e78a8322817d9819c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default boa.conf we install specifies that boa should run under the
nobody group, but we don't have such a group in our default skeleton (and
boa doesn't add it), causing boa to fail to start:

[01/Jan/1970:00:00:10 +0000] No such group: nobody

Instead use the nogroup group, which is presumably what was meant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boa/boa.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boa/boa.conf b/package/boa/boa.conf
index f51c237..e940296 100644
--- a/package/boa/boa.conf
+++ b/package/boa/boa.conf
@@ -46,7 +46,7 @@ Port 80
 # Group: The group name or GID the server should run as.
 
 User nobody
-Group nobody
+Group nogroup
 
 # ServerAdmin: The email address where server problems should be sent.
 # Note: this is not currently used, except as an environment variable
