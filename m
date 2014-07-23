From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:39:02 +0200
Subject: [Buildroot] [git commit] system/skeleton: remove spurious group
	'nobody'
Message-ID: <20140723213923.145729D2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=908198e756b4a75c19a31be493eeec66c7bb19d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We define the two groups 'nobody' and 'nogroup' in our skeleton, but
they have the same gid, which is not valid.

This breaks the mkuser script, as noticed by Thomas.

Anyway, the user 'nobody' belongs to the group 'nogroup' in any sane
distribution.

So, just remove the spurious 'nobody' group.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/group |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 11d58ac..41c396b 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -24,6 +24,5 @@ haldaemon:x:68:
 dbus:x:81:
 netdev:x:82:
 ftp:x:83
-nobody:x:99:
 nogroup:x:99:
 users:x:100:
