Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCB606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hAJdBosm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fVngD22G
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30625605EF;
	Sun, 25 Oct 2026 22:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V4FYRZK2QCR; Sun, 25 Oct 2026 22:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A304E60645
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966473;
	b=XCccmwF6fDeq9dw0G00Y9T2UjwgH1+UFWtXbtQRtWImKNXpmQyVhMgzdhUZ2fv8I3/Tk
	 u53FkjGSS1RWxt5Lzn0aC/w8ZYGALVHIU8pdgXRZTVe5wsMsoB2HqqmVC/X1SS30yEeWQ
	 s4KNniy0/o++fPd9r6nkFqVjwicREGi9tw2rhUi5NeJI6Y+87xGBrEI7laa+Kc/w5kLZp
	 +OovRtmXPUJs0ArFskEPvETLqSOVi3jNH2hoc24BfM+elPAqxI3OEdMS0MdqAbWHOTSHE
	 oMh216NR0f1kJETCmnKLGLbtHk7Buy6cz82T0XTdietxhKmST+iLKUMijVxRggNCZmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966473;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/1kTOKA5MnfauyCzbaWkHJsET8muPWoCCkHP7jX1TxY=;
	b=lQ93jaVBr2PThiVaoT/pjS6duBCQ/kGkPRehzx5iX6GhwjXySKsV333Rw9wDWnwvnEe2
	 FoIlpDJCZG6Hv2iXVKjaR2qELly5TdntxxBmG8CiUn74d0LTcabVBagr1+zFmCurm7zlc
	 sOApqDL0r9fJCsfsxqZ2a51MJNCcC+A9fs1Gj2sr2DetNy+JMI/1oozMTuGsUiiaARIly
	 wrvEkHswhwMFTLYk9j7ZaxFaZlfG2PHP7ThxrY8Vh45LeH15k0TSr7/MVOwVJrAl2EWaq
	 sQg1U1lidmFeqSmQvqF0hElMhvDSvj6FmS3DDR3RYais3IJt9Tc2TFS/okvX2Kj6RnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966473;
	bh=/1kTOKA5MnfauyCzbaWkHJsET8muPWoCCkHP7jX1TxY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAJdBosmCjROu3AFoOrp6gLMreKrpD5fp98fCQeskDT9fcYK4rN3tOymV6s9L1Ewj
	 EvJ/ObCsnJpRFaKnOxYC2mJYn/RrkdBN3kE3eZoMmyPfqfxWNs+At92JmQuY3aVFNS
	 5Et7hZx/1/3MDW9MUOntGnS6xM8q6ITKsL4fsHc6SPgE5BNWwOPyTIUaVzQburZDcA
	 wuPIm58BCT/EkLK9/xCKsMWY/l/IYFxnqGPhxIKytKHDH9tWp26vKhfe7fvnBVjifQ
	 82l6uN0vnaO+emNgH4nA2pXC/AhAjb48A8aQDNcTtri08EHR8qMQPSX2c/jKa5drKY
	 igrik9P2kL3Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A304E60645;
	Sun, 25 Oct 2026 22:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9941B334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F66F40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7xM8uPSZlQD for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BFF1140050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966471;
 b=IiaMhdoRErwu4F9T7S7NSrLbwMEDZaFBTCqyVbjXhU+zUTSfyhPywwpcv2sNpwFicLxB
 3bb6MMLHTBQHn8EXsZj0hziIMwA3504VQYNLZtWgbxteRNHoe8Sb0rIIji7AtcpDzUqRQ
 SDGbl9094LqB+n29ZdRClmy8X6azYBkcq0vdF/yYN8bJsV0gkQyhOvQqgnm9x13XcJ6k8
 WyeOPQYS7g2PLRmVLUeLn7z4MR+Jh2YArSaMog0AWbTKLnPrf1BDS07an0sQquKx+hICn
 4jqWlX8NEkIc27uF11dhWGuzqIMnptwOWdzcIw4twWno1sTtAk3WK2PFKegyXDCW/JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966471;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9nYo/4humzkphIM5kM0F9UWclIR+f7E9vWPYksUJjHE=;
 b=lN58rEFTVTK53YFMFL/jETdEnHdzXY8Ri4P4LibOKV8ruyxBXS0C8hsA0qwPneC4qmIP
 3a2RevaZevNUuEkhG3djeQeSxHz/Lg/optXL8OKDt+Thj18f5Uh5QLC5Zzs/nY3zTQoge
 U69Ul76RDkcxsJMD5pSSjvuiYzwaYD85BpiAfY4rlpHbcgJXqWYOhXo4u9nPE+utaDCW3
 o8Ysna4qCWTepRU2wxoa2NDi+CZDnDM35Ci3vLIoQBya0lnl2eGeIDAE0pes6WCcP2jgs
 H5skKaiiww3fe1V7xplyTGVWGilzkUYZGAyZRWBZSRdmfBpx75CXOD5RKK45Yn2Quuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fVngD22G; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fVngD22G
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFF1140050
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966087;
 bh=9nYo/4humzkphIM5kM0F9UWclIR+f7E9vWPYksUJjHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fVngD22GlE7vKEaEiBbJ8ehTkmCRzHBBxEo1qFV2Yukdkcgib7UhAedo6C+8UoNqD
 mSIlU6nQkOIY9Mkiea7clpmgJ/D9PSAWTysJL3sHgsM5wS1GI2bfEjJBeJ49/gWqNh
 LsFWsLrOIMaMD6A63SwcUKD7QDp9qq9Zh+4/WJr5UH1npr0sfgG+eBYdFjTjehIUGI
 hScNwatdQfH4Lorl/eG0StI4MYiPS4feMSdUJF3gIzcamQxawxqX3AjqvdK7rN1Jt5
 lX+xhNyTGqRLzroWdZZDm0v9jXLc2KLI416/RPYRjdLLC43J5AGBuKbI0v4vpqO0kj
 R07iyTmCyyt7Q==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 tD8iVaQz7Rf4uN7Ok0oQ00FPl9OnU5I81HbBLYMVVy/n+RvDvw7vCBccp5TEmvHFw/lkn9yY1tD
 ET25yebp5BFL3g9ccX/kjpFCfXkYHBbEwRGWFPBK+K5DrUKhSJ3e7QYQRCyjr1S6iBbBszJVrSR
 Ho9S1BGQIvLPM360JHwGOIc82LZH4F9YxE1NXYSuT2yZa9fqbWXmiytpDEp2dNK0k1AdLDLo3aa
 PNy+a/Rn17EQtJG/wLnp7RoUqTeuf5li9DGcuDk9zF4xl17TDZgb7eSZxdi4H6kHWbCaplqVXLF
 CwfM3rzHBEav2Mku87csVgje8ik4Kpi+omyHejLgoxCv6kc66+dZocAF+jPU+/yMG6p/yZ6eo7r
 q2fo0J33w/tRk2cTn99DdDGl3kgxrX+lpAVxlWIVal5ezQ7J2zLl9c7AHHBKUJJi4d0r6WdL5bY
 meV+/2YRvj+/Lc2siJ0gxIAxUItBJusATVWaMA56WPiaH7I9XNehOGLQDMYqrZIH/x0wpOxkRlA
 bGolw1mJhxWNAgv36Iiav6tSXCGnW9PCdL5dOUkz4eq/rfxS1v3UXV/EgQXlZ9ZSSFvoTNIPJOC
 TrlEVOgSwGYrOITRt1lc7blOaJmihak=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B8CAA4C6AC3;
 Sun, 25 Oct 2026 23:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NF-000000001fP-1LzE;
 Sun, 25 Oct 2026 22:07:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 25 Oct 2026 23:07:23 +0100
Message-ID: <20261025220723.1332924-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 34/34] package/runc: bump version to 1.5.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
