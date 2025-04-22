Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F60C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367E560D69;
	Tue, 22 Apr 2025 10:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4o3mvl9bTwP; Tue, 22 Apr 2025 10:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E6D60C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E6D60C2D;
	Tue, 22 Apr 2025 10:25:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8209E1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 686CE4047A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXoAG-aFbd17 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FE5140264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE5140264
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FE5140264
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:25:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.113.168]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGrE-1ucQ9m33dO-00JVrW; Tue, 22
 Apr 2025 12:25:12 +0200
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 22 Apr 2025 12:24:51 +0200
Message-ID: <20250422102451.3987515-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3dBP9ZTCaFlSuPcKADn27ncSFQo+zFhLHJXNVvS3qpjCAXXKq6K
 uxcsjcTAS36iAP5hb+5q8P4zn79DInNh/7d+bhdvbEzrK39t+TQtHiGsbysOwZ7qDzs+MIz
 K0iFeVGrXhIYSAfKyOXot6+KGNityn2O5qWWCF4AjbR0+CalE0Abu9WaaUJJ4AzO9bHF6J6
 7W2ICk8Se5Wo2zOUNZJlA==
UI-OutboundReport: notjunk:1;M01:P0:bYlf1klbdWI=;RvAPOhQ/1wpebe4Kvy8USKikzIt
 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
 zOVWEaxCtjvmpD1Y37hF8skQkEcvHACBzU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1745317512; x=1745922312; i=fiona.klute@gmx.de;
 bh=4cMoJiUn8mFtguRqS7xFlXGj+uFrY7XmpzLRIiEGks0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DuW7VoXnP5ne4hPTSWq37kDmeg/2HnwdnFNlB4MjmgvG2naxaRWxHPL3Qx5Uut4k
 dNsYyOOLhUOnKN3dmWkwIkaOke1kdA7sO0OB0uCQolCfzAJLE1Z+N+Es4tIsF2nAk
 AR8DNJc/mbdeZrGb6Uto5s3Eyea7uE1qYddt5z+IeRMdv0pGXw5jDXSoIf0Aw4WQE
 B+cyI7y+uRkkiMFynyEKm7lOejtDQMBqUN3Omv/xXXrymStbuOL6mTrlaKyoz/6GI
 scSoLvM2j6tn8GkHZokZo8JXp+yjaKLAbivEqKVwrnrCy804Nmhku/jhxJD3PNkXV
 lGG6ftAunl7vuaDI+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DuW7VoXn
Subject: [Buildroot] [PATCH 1/1] support/download: replace deprecated
 .cargo/config
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

With the current vendoring process, any Cargo build emits the
following warning:

warning: `.../.cargo/config` is deprecated in favor of `config.toml`

.cargo/config.toml was introduced in 1.39 [1], so there shouldn't be
backwards compatibility issues in Buildroot. However, because the
generated config file becomes part of the vendored archive, this
changes the hashes of all Cargo-based packages.

[1] https://doc.rust-lang.org/cargo/reference/config.html#hierarchical-structure

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
With the pending Rust 1.86 update requiring a -cargo3 archive version
anyway [1], this seems like a good time to switch the config file away
from the deprecated version (otherwise we'd need another archive
version bump). This patch should be applied together with that series
before regenerating the generated archive hashes.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250422074738.821755-4-elmehdi.younes@smile.fr/

 support/download/cargo-post-process | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 12198051a4..b0e59ad74d 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -31,14 +31,14 @@ post_process_unpack "${base_name}" "${output}"
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
-# Create the local .cargo/config with vendor info
+# Create the local .cargo/config.toml with vendor info
 mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
     --manifest-path "${manifest}" \
     --locked VENDOR \
-    > .cargo/config
+    > .cargo/config.toml
 
 # "cargo vendor' outputs on stderr a message directing to add some data
 # to the project's .cargo/config.toml, data that it outputs on stdout.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
