Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343ADC5DF79
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5E080DBB;
	Sun, 16 Aug 2026 22:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDLColVessRR; Sun, 16 Aug 2026 22:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D3380DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918837;
	bh=9WHNUAD3S4TyGhlwtgfj5s4NjckYqiaFuYySqEZmbXY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAWIlzTpZtcfwNEN6wZtoE+FjujT0FdTl7P/eOhUu8Md8+DibqCOCSm1nHLvwoa30
	 Xow7xSOGTUNChwmtuKjlP4HHoCohTBzdpPYXkKlH3w0jT6zgG/uuPA/xm+nrXap5dw
	 rKC0++FUTkOX9VMYXUtk06CeuyM1GjRyLveuT4cTLmolrFVO1oaUpViql0ZpZT+ftn
	 EMAPsoSFG3HjJxrYwyJPB171ZtgRAIMweqm2JLirdCHjfcmXdkmdTmnltUKpR5ng/8
	 cGHs8cQCrnfo1p/aiPfJwDhYUIjZ8vO+muKUDeyz4F/CT+iBR796m0B0TAzQ2Asg7f
	 BLfmJbjIcL5zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D3380DA4;
	Sun, 16 Aug 2026 22:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2DA823F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A101F6061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJZHybnOv6rl for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D071360629
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D071360629
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983CA8DB15; Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 00:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9376a0655a3796b20868477dbcbf0f5883523b7
X-Git-Newrev: e3b0f85b30c23b8bfa5261a1aeb840137cfbca79
X-Patchwork-Hint: ignore
Message-Id: <20260816221939.983CA8DB15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: security bump version to
 1.3.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3b0f85b30c23b8bfa5261a1aeb840137cfbca79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/opencontainers/runc/releases/tag/v1.3.6

Fixes CVE-2026-41579.

Rebased patch due to upstream commits
https://github.com/opencontainers/runc/commit/a8e53f2c6d6d25cb3dd643cc514f118aab44b097
https://github.com/opencontainers/runc/commit/42cfcbe4533a094cbffd23d17dc355bbb25938a1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Is-error-checking-functions-with-their-er.patch | 31 +++-------------------
 package/runc/runc.hash                             |  2 +-
 package/runc/runc.mk                               |  2 +-
 3 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
index 4e103099f9..6664b62191 100644
--- a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
+++ b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
@@ -35,6 +35,8 @@ Conflicts:
   libcontainer/container_linux.go
   libcontainer/intelrdt/intelrdt.go
 Signed-off-by: Romain Naour <romain.naour@smile.fr>
+[Bernd: rebased for version 1.3.6]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  libcontainer/configs/validate/validator.go      |  6 +++---
  libcontainer/configs/validate/validator_test.go |  7 ++++---
@@ -286,16 +288,7 @@ diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
 index 31d05174..abc372f3 100644
 --- a/libcontainer/rootfs_linux.go
 +++ b/libcontainer/rootfs_linux.go
-@@ -361,7 +361,7 @@ func mountCgroupV1(m mountEntry, c *mountConfig) error {
- 			// symlink(2) is very dumb, it will just shove the path into
- 			// the link and doesn't do any checks or relative path
- 			// conversion. Also, don't error out if the cgroup already exists.
--			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !os.IsExist(err) {
-+			if err := os.Symlink(mc, filepath.Join(c.root, m.Destination, ss)); err != nil && !errors.Is(err, os.ErrExist) {
- 				return err
- 			}
- 		}
-@@ -613,7 +613,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
+@@ -625,7 +625,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
  			return err
  		}
  		if fi, err := os.Lstat(dest); err != nil {
@@ -304,24 +297,6 @@ index 31d05174..abc372f3 100644
  				return err
  			}
  		} else if !fi.IsDir() {
-@@ -910,7 +910,7 @@ func setupDevSymlinks(rootfs string) error {
- 			src = link[0]
- 			dst = filepath.Join(rootfs, link[1])
- 		)
--		if err := os.Symlink(src, dst); err != nil && !os.IsExist(err) {
-+		if err := os.Symlink(src, dst); err != nil && !errors.Is(err, os.ErrExist) {
- 			return err
- 		}
- 	}
-@@ -1132,7 +1132,7 @@ func setReadonly() error {
- 
- func setupPtmx(config *configs.Config) error {
- 	ptmx := filepath.Join(config.Rootfs, "dev/ptmx")
--	if err := os.Remove(ptmx); err != nil && !os.IsNotExist(err) {
-+	if err := os.Remove(ptmx); err != nil && !errors.Is(err, os.ErrNotExist) {
- 		return err
- 	}
- 	if err := os.Symlink("pts/ptmx", ptmx); err != nil {
 diff --git a/libcontainer/specconv/spec_linux_test.go b/libcontainer/specconv/spec_linux_test.go
 index 66359f79..88156516 100644
 --- a/libcontainer/specconv/spec_linux_test.go
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d3132b1008..67511d2939 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72620f9b0e62d8da80c0c08a6265ab10d24330c544115c30713ba1429bde706d  runc-1.3.5-go2.tar.gz
+sha256  8816e8d4181d13012d16733e837425f5f67df57dfac28bc58a68f7dfcd54291b  runc-1.3.6-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 10ff98c9d7..e0c93baeb9 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.3.5
+RUNC_VERSION = 1.3.6
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
