Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB201C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAF88116F;
	Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO2ZP9eXX2QR; Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFBF8116A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFFBF8116A;
	Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4B5E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF5F40737
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kaiv7D0Zr0o for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7608A4071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7608A4071E
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7608A4071E
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 311741140203;
 Wed, 18 Jun 2025 14:20:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 18 Jun 2025 14:20:58 -0400
X-ME-Sender: <xms:iQNTaKkPHexaprfjfl69h36BPuKksHzKTDgjY0OrVy8iQ82FsvPtMQ>
 <xme:iQNTaB2dM-p67nfK-So9XERjNbho9YTlyL5fMXz-ykxwWNtFjUPQTGIgEJ6_nBWuu
 TfgSUYBQj3SCXWdJF4>
X-ME-Received: <xmr:iQNTaIpLPgu4mWDLZgeUjFSHhJL1-TCvfcYAxx72B4gZ4JC4Ynm7od7cDkI4zR85ksZL7RJ5ctVLSSuT8x7LD0S-LndlTyTDqIGwOKsJJhglvGRku8eZAfqWuiDeD5rJF2ikldmyh5Z2VGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehh
 ihesshgvnhiiihhllhgrrdhioh
X-ME-Proxy: <xmx:igNTaOmRf1Up-A-qb8lEndc6S20PXalkGmB1zCyMM9k2HjtQ0LV2Vw>
 <xmx:igNTaI06eNH_-y96i2VeHLzJyZ2VHA5WQeAeg7YiSc0dZzB9P9X2Xg>
 <xmx:igNTaFs4rvV33WM58PYksacn5rUwonfIT3xH1iDVYYSIGnGFP0SVkw>
 <xmx:igNTaEVSUXKarZZ2y0AaJNXOrwTsavOO2wewyk4RUKXaihoUyG0vGg>
 <xmx:igNTaPjuX4rR88CF6YOGMwQiZFq_yrqaiWF99d_NW0AjiyAwvvbgtDZm>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:57 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:36 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-11-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Pc4gIH206fNNRn7+6OtHpfmCaQb/QBoA8TSEUlNcumk=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5sqNP49LNO9YfpVh38yy+kMPyxhWfLrhummSaT7fy
 gBDuQ9hHaUsDGIcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRWysYGU4KBF4R1nrb3+L1
 bk3EiY83595pOPsg88q6vfIvbjJ5SHIy/BX6lq7uJXeiOmXm9fgfIjEXu6+E6UeFmJ+fyhlQO1n
 3PxcA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270858;
 x=1750357258; bh=Ft6VOcYUTh+RZThIEK+xdFXL+poi2ijkC0RUgi+VFeE=; b=
 1HP6f8oVc0Mv9B5enwnzSXJPFHUoPuUf4CcKMaNSBjVaNa4ZGkrEMuJqH6PcUlLR
 NUDpWhh6CgEmp1hUDaDWMH9iX2IKnxOXKjWjlCi1/elRg1PDQAMXLzNqlkkX2Dgf
 Gv+0d0ynYZCZcqfXZGK19pVNFwgyTzIvToFebilUJKeMjoC6WkDuZuNbJda1kLas
 3dEWDqztQGuj1voirPt+cfz2sej86HsvlbEM2fCZgVhq+0yG6TDeHC7DnzqU97p+
 mCso4pl3PVSTGR4rkYi1OKst2fLEIyWbjliMZw4Sxu5LEVBe3D11QErhc/CYS6ca
 5DBShbCQsRjYJT51oCJw+A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270858; x=
 1750357258; bh=Ft6VOcYUTh+RZThIEK+xdFXL+poi2ijkC0RUgi+VFeE=; b=B
 RJvgdDJdSyF2yuLw+A9snROCh2X41Df7jnO7vwvYFoUD/4Pnc1Mz5+T9UQbPzYlh
 DLwfV6dRdqMUihn8GBeLw5AlZnhxkJCuESG7/BTPAs+kBpZtHd8ac5K8FZKSZdyP
 sTXFqrUnAja+sqkWmiNgjH+upjgLf2rEKIrf5fQ4vp4PlZ6pEyKuhexRpiQ7nDDt
 GB+HFYnYSvqZZCPRBe8Xb3K9KrJ8aLCmYS7d8AyE8occKTIg2emDcjCpXo7Nv1HI
 Xii+01tcefm/HFxx06pGs3UzEmUDkrgMi8SAUOUpJngQNSTrD7C1PtJkjBMYIzV8
 CQdvBmUfsAkk3Mxt7rKWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=1HP6f8oV; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BRJvgdDJ
Subject: [Buildroot] [PATCH v3 11/11] support/config-fragments: Add
 LoongArch64 toolchain support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add full/glibc variant of LoongArch64 internal toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 support/config-fragments/autobuild/br-loongarch64-full-internal.config | 3 +++
 .../config-fragments/autobuild/br-loongarch64-internal-glibc.config    | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv               | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/support/config-fragments/autobuild/br-loongarch64-full-internal.config b/support/config-fragments/autobuild/br-loongarch64-full-internal.config
new file mode 100644
index 0000000000000000000000000000000000000000..9faab86b3ca4b5529f5b8f52f022c704e59870eb
--- /dev/null
+++ b/support/config-fragments/autobuild/br-loongarch64-full-internal.config
@@ -0,0 +1,3 @@
+BR2_loongarch64=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config b/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config
new file mode 100644
index 0000000000000000000000000000000000000000..a9ee70d5590c75955982f3bafcc1d61c92e907ff
--- /dev/null
+++ b/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config
@@ -0,0 +1,3 @@
+BR2_loongarch64=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 047b22a9fa66a7d62eff5f24d476fe5e07f80a90..d0002375d6ed9eb4715afaef06f45a3371068836 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -50,6 +50,8 @@ support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
+support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
+support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
