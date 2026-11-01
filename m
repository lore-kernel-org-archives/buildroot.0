Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19653606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m7sRnFz2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA9E80FF2;
	Sun,  1 Nov 2026 13:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZdF8sLNcmeo; Sun,  1 Nov 2026 13:52:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A29C9810D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541176;
	b=X400sFKApe5W3tocUOYC3Tz67Av4hLHDPfRudPA//WhH6ASWooS0KpcuUr9WruOETnXo
	 fEdNyu4Qw7KuVasWL//eGfSNh5b9DAt24zTUa5ZfuOWMcwszqAPRLjBj5ERau8doEhgqO
	 DfUbLlQNFCFwTjuMxjqqED9A0EKvnlGN7hrXLdyrUsn0vpo//lrq7CTz9pPoBFusOTv4F
	 OTqJOfX3u/hlOT+7pZu1Xu5uDJTYoDdTzHwfUsJzC2RXLAJDmTJkJKhsMn8Pd9G6bIO8N
	 xr8g3RVsB7Ld7tNWN7fHXWdD1zj0uI7QMuOIUBdMIt77NHtkdin47OUHMD+dUh5sYwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GbBQXCZIpfWKXGShXLO44ZE9Ox325LvUNs7zmpeHouA=;
	b=fnL1s7W3A50ASBQZLvx1mcHanzKOqGDM3SC5/qjx2CtL2HV/G5Nkei4mY6FgIbmnSVWO
	 cErEMpnRitRqb/JOYwye14DBtzv9KSUR8pd5IQBi1nav1XZz0MdsnKNxTb3CJmOCc8+oJ
	 NXV2BmR/Q2Zg/moNkPC2+qFl49BABY5uKVXwFJ01r9LD3H4QkenzkwkD4I6xEK43RRn5+
	 rP9GuURrLafLktKbvRUURriBw5OKK8LvcafCBMnA6bn11Bjn0SoT0BkpI+lrLF2bFTwDN
	 D36SCXApljd+f8Tze/fnk3ZO0Q8bvLtIeV+t+qYe7fqFUMKcGgxGw5jI1e85UzuTHNg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541176;
	bh=GbBQXCZIpfWKXGShXLO44ZE9Ox325LvUNs7zmpeHouA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m7sRnFz2kleIKk8TxaxDBpURJcFhZ+SyNoxQnxyiNmnczbqvZgm3m0A6cYHFBPFim
	 h1cTyixgux6WZ2IFeeEwGm9+ikxyUPoAeAvMVOu3mhjoXlOYkmprzgk3z1IM6LFVwa
	 rSBBvGClyZkMmp9bdPrphySszMQAx7/ISOmXYJwpwKdKeVWgPAoPqf7Sf5Tbd3OWG3
	 ZOteV3icWx+ZiCBcn+4gqlybd5FuihUYHlj/9klAqo94TTFcPDbgHL5NgH2CsmOAuZ
	 Kti1OjjBAW7dWjvo9QOQEwmtJk8KZVShAePnnH+diWQXuEtTjmfKMhoRowW4ytinEp
	 8RToI6UqWGPYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29C9810D9;
	Sun,  1 Nov 2026 13:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDECB4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BADE880F39
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1PYqQ8zhDwk for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5374A80F26
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541168;
 b=Rg21RSSWby5QZ2eIOKwL2MOfGg9yIHFF+yH7/9h7dBn9hkGb8KEmylXsJPwuTBY4zYUQ
 dhdwzVywpEfCaJoCFpW+OWBTa12Y1SPuM2rwKgr7TRkwpLknn9ixjOr1n2ihStGOYEgmd
 55uhK11RS/Y6pbolVSJSJfKrz0lF3T53ScJJyfcydXa2f/Bz+q3G+BK0kVUPivQ2jmI5N
 2Hah/X7v1eCXeGGd1HG5n40m8qTdTQdXqjNdeB41RhMrzUBQ6ZrTM/L9CXDgDz2KaKpfY
 yrCCB+dteo+34nBV9A5CQMNKrHP1tpfUdXJAuNAvmtnsDECK1DXaSeqFu9Z3AmyK27Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8CtFnz59qvSO2KwTRCycBQSDJXGJbGnrv6yHWpxdmGA=;
 b=EYI0gTc8tsjBZgVn196QQdAIfk17v9li8ASZTqFzstYlyTe2/OO6u/6lNwoY4cfd7X2x
 hWaLAg7sauraUUcfBegXRq5iwRzVGlQzAIcrJ8xRrkCjdX/TNWTBBBd2u3EiXNu3xyqZD
 5aVANowSCBdJkxraa6Iv6RwBgByyXhzJubT6ulqI7KF53U2MvNnxETV5umCT1AMXArO5M
 wWtJFulbe/xCt/U1/Wm64gka1U5wDmWF1sgzMoq4zYNPaLVt16mf6nk5mdR1zkdQYseny
 23BbUDZIw/VdSsTYRMrCjsqouYKtO/Zk7wr+2ryCJ+i4+HAuMW+REv8JcKhuq20qcsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5374A80F26
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A2709D460; Sun,  1 Nov 2026 13:51:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e3b150cc44d2fa6fee583af40118d44d3e2f52c
X-Git-Newrev: 2f98708e081903e3b08f18d273ac22b6a01f14fc
X-Patchwork-Hint: ignore
Message-Id: <20261101135119.2A2709D460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: bump version to 1.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f98708e081903e3b08f18d273ac22b6a01f14fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/opencontainers/runc/releases/tag/v1.4.0
https://github.com/opencontainers/runc/releases/tag/v1.4.1
https://github.com/opencontainers/runc/releases/tag/v1.4.2
https://github.com/opencontainers/runc/releases/tag/v1.4.3

https://github.com/opencontainers/runc/releases/tag/v1.5.0
"The runc 1.3.z release branch will now only receive high severity
CVE fixes, and will no longer be supported in less than 6 months (end
of October 2026)."

https://github.com/opencontainers/runc/releases/tag/v1.5.1
https://github.com/opencontainers/runc/releases/tag/v1.5.2

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Is-error-checking-functions-with-their-er.patch | 375 ---------------------
 package/runc/runc.hash                             |   2 +-
 package/runc/runc.mk                               |   2 +-
 3 files changed, 2 insertions(+), 377 deletions(-)

diff --git a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch b/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
deleted file mode 100644
index 6664b62191..0000000000
--- a/package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch
+++ /dev/null
@@ -1,375 +0,0 @@
-From 87932aa3d01294886b71f9566f3bf881cf769c66 Mon Sep 17 00:00:00 2001
-From: Curd Becker <me@curd-becker.de>
-Date: Mon, 17 Nov 2025 00:28:05 +0100
-Subject: [PATCH] Replace os.Is* error checking functions with their errors.Is
- counterpart
-
-Signed-off-by: Curd Becker <me@curd-becker.de>
-(cherry picked from commit 536e183451b7988316fdc37eecd7afd8570dc19b)
-Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
-(cherry picked from commit 323a54ef0d91a20f7d5be4308e5e65a98886bf4b)
-
-Since the runc security bump to version 1.3.5 [1], the TestOci fail due
-to missing user namespace support in the kernel:
-
-    proc/self/setgroups: no such file or directory
-
-The test was working well with runc 1.3.0. The regression is caused by
-this commit [2] from the 1.3.3 security release.
-
-The regression is fixed by a refactoring from the 1.4.1 release [3].
-
-Backport this commit on top of runc 1.3.5 (fixing some conflicts).
-
-Upstream: https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b
-
-[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e013e2df84fb36985261d7b3c6e6af06afd40f93
-[2] https://github.com/opencontainers/runc/commit/7762edc82c36ba69a4ea88b86483fcdcac93f5a2
-[3] https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b
-[Romain:
-  rebase on 1.3.5
-  add comments about runc 1.3.5 regression
-]
-Conflicts:
-  libcontainer/configs/validate/validator_test.go
-  libcontainer/container_linux.go
-  libcontainer/intelrdt/intelrdt.go
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-[Bernd: rebased for version 1.3.6]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libcontainer/configs/validate/validator.go      |  6 +++---
- libcontainer/configs/validate/validator_test.go |  7 ++++---
- libcontainer/criu_linux.go                      | 10 +++++-----
- libcontainer/devices/device_unix.go             |  2 +-
- libcontainer/factory_linux.go                   |  4 ++--
- libcontainer/init_linux.go                      |  4 ++--
- libcontainer/integration/exec_test.go           |  6 +++---
- libcontainer/notify_linux.go                    |  2 +-
- libcontainer/process_linux.go                   |  2 +-
- libcontainer/rootfs_linux.go                    |  8 ++++----
- libcontainer/specconv/spec_linux_test.go        |  5 +++--
- libcontainer/state_linux.go                     |  3 ++-
- spec.go                                         |  4 ++--
- 13 files changed, 33 insertions(+), 30 deletions(-)
-
-diff --git a/libcontainer/configs/validate/validator.go b/libcontainer/configs/validate/validator.go
-index e0052900..3b77617b 100644
---- a/libcontainer/configs/validate/validator.go
-+++ b/libcontainer/configs/validate/validator.go
-@@ -104,7 +104,7 @@ func security(config *configs.Config) error {
- 
- func namespaces(config *configs.Config) error {
- 	if config.Namespaces.Contains(configs.NEWUSER) {
--		if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
-+		if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
- 			return errors.New("user namespaces aren't enabled in the kernel")
- 		}
- 		hasPath := config.Namespaces.PathOf(configs.NEWUSER) != ""
-@@ -122,13 +122,13 @@ func namespaces(config *configs.Config) error {
- 	}
- 
- 	if config.Namespaces.Contains(configs.NEWCGROUP) {
--		if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
-+		if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
- 			return errors.New("cgroup namespaces aren't enabled in the kernel")
- 		}
- 	}
- 
- 	if config.Namespaces.Contains(configs.NEWTIME) {
--		if _, err := os.Stat("/proc/self/timens_offsets"); os.IsNotExist(err) {
-+		if _, err := os.Stat("/proc/self/timens_offsets"); errors.Is(err, os.ErrNotExist) {
- 			return errors.New("time namespaces aren't enabled in the kernel")
- 		}
- 		hasPath := config.Namespaces.PathOf(configs.NEWTIME) != ""
-diff --git a/libcontainer/configs/validate/validator_test.go b/libcontainer/configs/validate/validator_test.go
-index d157feea..41412ba4 100644
---- a/libcontainer/configs/validate/validator_test.go
-+++ b/libcontainer/configs/validate/validator_test.go
-@@ -1,6 +1,7 @@
- package validate
- 
- import (
-+	"errors"
- 	"os"
- 	"path/filepath"
- 	"testing"
-@@ -171,7 +172,7 @@ func TestValidateSecurityWithoutNEWNS(t *testing.T) {
- }
- 
- func TestValidateUserNamespace(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires userns.")
- 	}
- 	config := &configs.Config{
-@@ -205,7 +206,7 @@ func TestValidateUsernsMappingWithoutNamespace(t *testing.T) {
- }
- 
- func TestValidateTimeNamespace(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/time"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/time"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires timens.")
- 	}
- 	config := &configs.Config{
-@@ -224,7 +225,7 @@ func TestValidateTimeNamespace(t *testing.T) {
- }
- 
- func TestValidateTimeNamespaceWithBothPathAndTimeOffset(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/time"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/time"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires timens.")
- 	}
- 	config := &configs.Config{
-diff --git a/libcontainer/criu_linux.go b/libcontainer/criu_linux.go
-index 53a0202a..ddf95445 100644
---- a/libcontainer/criu_linux.go
-+++ b/libcontainer/criu_linux.go
-@@ -123,7 +123,7 @@ func (c *Container) addMaskPaths(req *criurpc.CriuReq) error {
- 	for _, path := range c.config.MaskPaths {
- 		fi, err := os.Stat(fmt.Sprintf("/proc/%d/root/%s", c.initProcess.pid(), path))
- 		if err != nil {
--			if os.IsNotExist(err) {
-+			if errors.Is(err, os.ErrNotExist) {
- 				continue
- 			}
- 			return err
-@@ -304,7 +304,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
- 
- 	// Since a container can be C/R'ed multiple times,
- 	// the checkpoint directory may already exist.
--	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !os.IsExist(err) {
-+	if err := os.Mkdir(criuOpts.ImagesDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
- 		return err
- 	}
- 
-@@ -339,7 +339,7 @@ func (c *Container) Checkpoint(criuOpts *CriuOpts) error {
- 
- 	// if criuOpts.WorkDirectory is not set, criu default is used.
- 	if criuOpts.WorkDirectory != "" {
--		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
-+		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
- 			return err
- 		}
- 		workDir, err := os.Open(criuOpts.WorkDirectory)
-@@ -698,7 +698,7 @@ func (c *Container) Restore(process *Process, criuOpts *CriuOpts) error {
- 	if criuOpts.WorkDirectory != "" {
- 		// Since a container can be C/R'ed multiple times,
- 		// the work directory may already exist.
--		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !os.IsExist(err) {
-+		if err := os.Mkdir(criuOpts.WorkDirectory, 0o700); err != nil && !errors.Is(err, os.ErrExist) {
- 			return err
- 		}
- 		workDir, err := os.Open(criuOpts.WorkDirectory)
-@@ -1149,7 +1149,7 @@ func (c *Container) criuNotifications(resp *criurpc.CriuResp, process *Process,
- 			return err
- 		}
- 		if err := os.Remove(filepath.Join(c.stateDir, "checkpoint")); err != nil {
--			if !os.IsNotExist(err) {
-+			if !errors.Is(err, os.ErrNotExist) {
- 				logrus.Error(err)
- 			}
- 		}
-diff --git a/libcontainer/devices/device_unix.go b/libcontainer/devices/device_unix.go
-index c533eb1c..409e58e9 100644
---- a/libcontainer/devices/device_unix.go
-+++ b/libcontainer/devices/device_unix.go
-@@ -98,7 +98,7 @@ func GetDevices(path string) ([]*Device, error) {
- 			if errors.Is(err, ErrNotADevice) {
- 				continue
- 			}
--			if os.IsNotExist(err) {
-+			if errors.Is(err, os.ErrNotExist) {
- 				continue
- 			}
- 			return nil, err
-diff --git a/libcontainer/factory_linux.go b/libcontainer/factory_linux.go
-index 94b55eaa..d8a2d8e3 100644
---- a/libcontainer/factory_linux.go
-+++ b/libcontainer/factory_linux.go
-@@ -51,7 +51,7 @@ func Create(root, id string, config *configs.Config) (*Container, error) {
- 	}
- 	if _, err := os.Stat(stateDir); err == nil {
- 		return nil, ErrExist
--	} else if !os.IsNotExist(err) {
-+	} else if !errors.Is(err, os.ErrNotExist) {
- 		return nil, err
- 	}
- 
-@@ -154,7 +154,7 @@ func loadState(root string) (*State, error) {
- 	}
- 	f, err := os.Open(stateFilePath)
- 	if err != nil {
--		if os.IsNotExist(err) {
-+		if errors.Is(err, os.ErrNotExist) {
- 			return nil, ErrNotExist
- 		}
- 		return nil, err
-diff --git a/libcontainer/init_linux.go b/libcontainer/init_linux.go
-index 40529200..25c135f3 100644
---- a/libcontainer/init_linux.go
-+++ b/libcontainer/init_linux.go
-@@ -311,7 +311,7 @@ func finalizeNamespace(config *initConfig) error {
- 		switch {
- 		case err == nil:
- 			doChdir = false
--		case os.IsPermission(err):
-+		case errors.Is(err, os.ErrPermission):
- 			// If we hit an EPERM, we should attempt again after setting up user.
- 			// This will allow us to successfully chdir if the container user has access
- 			// to the directory, but the user running runc does not.
-@@ -477,7 +477,7 @@ func setupUser(config *initConfig) error {
- 		setgroups, err = io.ReadAll(setgroupsFile)
- 		_ = setgroupsFile.Close()
- 	}
--	if err != nil && !os.IsNotExist(err) {
-+	if err != nil && !errors.Is(err, os.ErrNotExist) {
- 		return err
- 	}
- 
-diff --git a/libcontainer/integration/exec_test.go b/libcontainer/integration/exec_test.go
-index df99da26..14006922 100644
---- a/libcontainer/integration/exec_test.go
-+++ b/libcontainer/integration/exec_test.go
-@@ -1097,7 +1097,7 @@ func TestHook(t *testing.T) {
- 
- 	for _, hook := range []string{"prestart", "createRuntime", "poststart"} {
- 		fi, err := os.Stat(filepath.Join(config.Rootfs, hook))
--		if err == nil || !os.IsNotExist(err) {
-+		if err == nil || !errors.Is(err, os.ErrNotExist) {
- 			t.Fatalf("expected file '%s to not exists, but it does", fi.Name())
- 		}
- 	}
-@@ -1645,7 +1645,7 @@ func TestTmpfsCopyUp(t *testing.T) {
- }
- 
- func TestCGROUPPrivate(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires cgroupns.")
- 	}
- 	if testing.Short() {
-@@ -1665,7 +1665,7 @@ func TestCGROUPPrivate(t *testing.T) {
- }
- 
- func TestCGROUPHost(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/cgroup"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/cgroup"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires cgroupns.")
- 	}
- 	if testing.Short() {
-diff --git a/libcontainer/notify_linux.go b/libcontainer/notify_linux.go
-index a8762842..77e23157 100644
---- a/libcontainer/notify_linux.go
-+++ b/libcontainer/notify_linux.go
-@@ -51,7 +51,7 @@ func registerMemoryEvent(cgDir string, evName string, arg string) (<-chan struct
- 			}
- 			// When a cgroup is destroyed, an event is sent to eventfd.
- 			// So if the control path is gone, return instead of notifying.
--			if _, err := os.Lstat(eventControlPath); os.IsNotExist(err) {
-+			if _, err := os.Lstat(eventControlPath); errors.Is(err, os.ErrNotExist) {
- 				return
- 			}
- 			ch <- struct{}{}
-diff --git a/libcontainer/process_linux.go b/libcontainer/process_linux.go
-index baf3706c..6f10a6c2 100644
---- a/libcontainer/process_linux.go
-+++ b/libcontainer/process_linux.go
-@@ -940,7 +940,7 @@ func getPipeFds(pid int) ([]string, error) {
- 			// Ignore permission errors, for rootless containers and other
- 			// non-dumpable processes. if we can't get the fd for a particular
- 			// file, there's not much we can do.
--			if os.IsPermission(err) {
-+			if errors.Is(err, os.ErrPermission) {
- 				continue
- 			}
- 			return fds, err
-diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
-index 31d05174..abc372f3 100644
---- a/libcontainer/rootfs_linux.go
-+++ b/libcontainer/rootfs_linux.go
-@@ -625,7 +625,7 @@ func mountToRootfs(c *mountConfig, m mountEntry) error {
- 			return err
- 		}
- 		if fi, err := os.Lstat(dest); err != nil {
--			if !os.IsNotExist(err) {
-+			if !errors.Is(err, os.ErrNotExist) {
- 				return err
- 			}
- 		} else if !fi.IsDir() {
-diff --git a/libcontainer/specconv/spec_linux_test.go b/libcontainer/specconv/spec_linux_test.go
-index 66359f79..88156516 100644
---- a/libcontainer/specconv/spec_linux_test.go
-+++ b/libcontainer/specconv/spec_linux_test.go
-@@ -1,6 +1,7 @@
- package specconv
- 
- import (
-+	"errors"
- 	"os"
- 	"strings"
- 	"testing"
-@@ -609,7 +610,7 @@ func TestDupNamespaces(t *testing.T) {
- }
- 
- func TestUserNamespaceMappingAndPath(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires userns.")
- 	}
- 
-@@ -643,7 +644,7 @@ func TestUserNamespaceMappingAndPath(t *testing.T) {
- }
- 
- func TestNonZeroEUIDCompatibleSpecconvValidate(t *testing.T) {
--	if _, err := os.Stat("/proc/self/ns/user"); os.IsNotExist(err) {
-+	if _, err := os.Stat("/proc/self/ns/user"); errors.Is(err, os.ErrNotExist) {
- 		t.Skip("Test requires userns.")
- 	}
- 
-diff --git a/libcontainer/state_linux.go b/libcontainer/state_linux.go
-index 2b7b8b5b..1f758e2a 100644
---- a/libcontainer/state_linux.go
-+++ b/libcontainer/state_linux.go
-@@ -1,6 +1,7 @@
- package libcontainer
- 
- import (
-+	"errors"
- 	"fmt"
- 	"os"
- 	"path/filepath"
-@@ -213,7 +214,7 @@ func (r *restoredState) transition(s containerState) error {
- 
- func (r *restoredState) destroy() error {
- 	if _, err := os.Stat(filepath.Join(r.c.stateDir, "checkpoint")); err != nil {
--		if !os.IsNotExist(err) {
-+		if !errors.Is(err, os.ErrNotExist) {
- 			return err
- 		}
- 	}
-diff --git a/spec.go b/spec.go
-index d03d644e..15e933eb 100644
---- a/spec.go
-+++ b/spec.go
-@@ -91,7 +91,7 @@ created by an unprivileged user.
- 			if err == nil {
- 				return fmt.Errorf("File %s exists. Remove it first", name)
- 			}
--			if !os.IsNotExist(err) {
-+			if !errors.Is(err, os.ErrNotExist) {
- 				return err
- 			}
- 			return nil
-@@ -117,7 +117,7 @@ created by an unprivileged user.
- func loadSpec(cPath string) (spec *specs.Spec, err error) {
- 	cf, err := os.Open(cPath)
- 	if err != nil {
--		if os.IsNotExist(err) {
-+		if errors.Is(err, os.ErrNotExist) {
- 			return nil, fmt.Errorf("JSON specification file %s not found", cPath)
- 		}
- 		return nil, err
--- 
-2.54.0
-
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 67511d2939..b66d06a55f 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8816e8d4181d13012d16733e837425f5f67df57dfac28bc58a68f7dfcd54291b  runc-1.3.6-go2.tar.gz
+sha256  b5af44864a830c7032cf4a72efa0c6d44f701873d9507b127be31ad4d1d42ff3  runc-1.5.2-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index e0c93baeb9..4cfb656c81 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.3.6
+RUNC_VERSION = 1.5.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
