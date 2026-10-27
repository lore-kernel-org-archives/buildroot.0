Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A89606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hH+mRMAq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Ls8LPh+M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513DF60687;
	Tue, 27 Oct 2026 05:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJkGRifFlyNy; Tue, 27 Oct 2026 05:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4D8E606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079720;
	b=UyaV8KP6EiCH1jvK0FrjhhXoCPeHoju+nYQ9Qrskrh9+sF3vnmJRRMGrjMckbwc6lS8X
	 wdWS5gzmTbt6SP/RKBlVxmdOMz6egIk+lLy+twKHX1WL/gTJMCH8D5TDra3EBOk2h9IT+
	 CgkH0Ce1mHrimvVRg33caRv3uwMHpMST7B3EsXPf/0P4UdALPN6+c37qz28ivThSGIFBD
	 gOQmF2ThsIOoYxSpLd+h8xj7KUG09GY45kZzKtCvqIE9VBv+dFVbUfeIMfZTXfXseEy9V
	 X2Ze7oRl3LXuYOgat4W/7xsyj7GxMTITO4bPnUHbBGos+U4CmNnJIZYE8LdIkJ0N04g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/1kTOKA5MnfauyCzbaWkHJsET8muPWoCCkHP7jX1TxY=;
	b=XYej2ft/Ivf+anAI1Ee8h0QPrMeD5Dm7db82K7DELJB1pfz1/9whxQAYLVVxBPKlaIHq
	 mBfqewt1XK0zWTqYz1cMBELipkq1jpKEOGjSNGeJuvQ7/Er9mqeTqE5yxK8Z1agSUAI3v
	 t3T4EZ8cLgjqqgSChA3AgvCk/cJmxhbZQzSCh+aVAYexR/HoYC9PbuYwD4PjTHYU8nIOa
	 BkiCTF7VdOQDNJbWLJtRtDagaXmMep3QuB645KKcclmb75O0pyq2r1RzMxl+gvl55fFE8
	 c9XrTRFub3watay/MVg1SpyYAfy2B7A3rq2gQg0svYv1kZTcI2zdRudBABgo82VYXwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079720;
	bh=/1kTOKA5MnfauyCzbaWkHJsET8muPWoCCkHP7jX1TxY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hH+mRMAqXc09HxwTGkPWz5N2ABVx4uB3rJa9PaLp+YUUVMS8br910VZjP2AQauTad
	 S6lALWqjCgq5attOhY0VUeAg5e7rbdzE6wPpViVyozTTn3Vd6NQS42DpSUmGe6wsl1
	 7He5f8J/fuMiv8v/8oEPirQI99uqAFYRST57O3tquvfs4ktLkAKyRfA9UI47+9oJav
	 a2kHc0bNNl8qzdhACyEzIkXEFTh8Vpchez4y6hILHpl3w7bFWVxF0A74EUA7W/ESlI
	 4VtLi5RpD+j0rFAff5Quw4FuxCTeOxsodEqs+cRDILTGRpZldR1Wc/UiFRAupN6Yll
	 EA9MMU8arHZsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D8E606A0;
	Tue, 27 Oct 2026 05:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D990A279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB4E880C09
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM-7Y7m_egvx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:41:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FF9280BE0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079718;
 b=Er3bTydRpAhJIRMcc4VhbZ2/vnSxBOk0bqn+PGzEzdZir6SCQElGuEUVgoX+sSRA8jD9
 VrEXTSgNVDCx0uHVhWplrlD0KZKmiFXKKWFJ/HGvy2lp9M566X9AljpjiXLp0c14HjK2Q
 q8wsqB5cdRJTI3XugoS0KkEYia0d0ZdFpKEtMH61YdgmGLoDbIKpFbCbCYvV5KeeTJUOs
 q4HAyRVMR7Tm8ujCqI8pp6w7jA2gFpDZzse0J/xeLMbyRwEkIIPhcYOyIJk6vZK6VVLPv
 Mjqj6ywi7RfC2qeyOadoe0ZG5/Lq0ZSt6rybHXk8kH4jbpckpk2vBOwxsPKHFflG1qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079718;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9nYo/4humzkphIM5kM0F9UWclIR+f7E9vWPYksUJjHE=;
 b=dLyjSKS5P2BmGx++hHXMXVg+IBfJEK3VnT9XcgNjvgzZYrdGvgD6jRGksn2h0jUm4Ign
 z1dt1IUzRo2AXMCsSC/i8DISKPqtK1P3rkeRVcLD7NXeFXLGaOTttoHXow6b3Dyl6Sxun
 69qT+c3XWcKnOXPl1+c50r143yhii6vwdbTgygN89u1j7cU1yAuYdVJrwd0+rJLtYHT4K
 DKbO7TzKYNsKzj27fGa1+sgqwpNS+jkpjG3a4zPVQdW+DhdJ6bXx93TLQNusx5YpwOGBF
 9sxURJtjsvvRAOGAzniurt+p6qCx6O7FV4D7uLDIqope7bGHONXZsSkncUluBMx7qsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ls8LPh+M; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ls8LPh+M
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF9280BE0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079662;
 bh=9nYo/4humzkphIM5kM0F9UWclIR+f7E9vWPYksUJjHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ls8LPh+MS19eeN+s0cWRcixltD14LTxPCfNF6SDB01ZwsUQxbSiRfzrgD3xlASoZe
 fyyRcW4Ya1D8QqZSIi8+pxK1AAJie1dW+7DkmJQmM2ayHM8T0Ds1Xuge57I3w7KBXL
 6eRS6R35AsLqFbxI28zhPB1909Fe3OBovNtvO5I7J+8uFaQ/114gVTFe0ne4JRU2fR
 AKIzmPgmSfEjUBZUe97YKOjf2UgjjLkCh+mPo+HSE15S6SYEL8aosZWOxtw9PgiQZs
 xne2TJ7fbFZmVlt2bSDEroLqUdxT3YPNFhN4RQm55Xcakm67MyLOsVswGfM519fW6k
 SwiBUGodiHNaw==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 EF0FKYVsQ/Wq5iUIzx6BKp+oiV7VuqCi8el6v4FD92WYrVeFGxpOTeRX1MUtkT+UC9LCwJZXu46
 eqfFPvAZQkNuiNDxHshDU+hMbUmZNYDPfpZxwce7VQtqPZlNTABs5fOQMuNiErAbl6aLbuMBDxA
 a45dFOVFuCiF/Q2Xyip1o2scBaLWg4HZw4oFlSMyAW4zf5xRUICjEtrFnlVMHYlzfacV2iVY1ID
 78KktDx8HoDgz7G+2yvNOxI9x4Gw2eac2JJNR6dsdzlldYTTsUk0h8pTdaWR+PFeVpezXqJbITT
 D/k0LJgG5VrfH46aYLvZCN77FFtPPnS0h3FSMz+r5ecIDSln+xTr7lgct9+tlsWd0pXJ3wT2+Me
 Jq1ZJy86UolsRQggTstrGzyKUq4D1Rxz8G51xWu+qVSVZsLy/NVzNGzMRO17HTbfk409WuSmBsu
 VBOLxyXlnk9POTB36zwpEeFtOnxKG+Ahm/shWEKp0eE5p+TiB6oBShpm6MXVYT/YVWg2b8lYx8g
 G7T9hN+tcETaMN6ysuQuKdUUfIzjPUfOVCAUgcHQvSHmjVlc9P++AtPk+wVosEcr+Izxl8souD3
 vXES
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 181E3A4C6E20;
 Tue, 27 Oct 2026 06:41:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvI-0000000078y-1W9e;
 Tue, 27 Oct 2026 05:40:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Tue, 27 Oct 2026 06:40:34 +0100
Message-ID: <20261027054034.4556-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027054034.4556-1-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 6/6] package/runc: bump version to 1.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
 ...ror-checking-functions-with-their-er.patch | 375 ------------------
 package/runc/runc.hash                        |   2 +-
 package/runc/runc.mk                          |   2 +-
 3 files changed, 2 insertions(+), 377 deletions(-)
 delete mode 100644 package/runc/0001-Replace-os.Is-error-checking-functions-with-their-er.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
