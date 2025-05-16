Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50085C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E57D61254;
	Fri, 16 May 2025 17:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qpmg24ISJRDM; Fri, 16 May 2025 17:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5600B612BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5600B612BB;
	Fri, 16 May 2025 17:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33374185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7B060C13
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOzLcwqsZ7BQ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7339260A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7339260A69
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7339260A69
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:53:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 727B9432F4;
 Fri, 16 May 2025 17:53:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:53:49 +0200
Message-ID: <20250516175351.308323-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
References: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtgedutdfghfetfeelhfdtteevvdeludekkeeiudegjeehgfevudeuudeutefhnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgidrmhhitghhvghlseifihgvu
 ggvmhgrnhhnqdhgrhhouhhprdgtohhmpdhrtghpthhtohepmhgrihhlsegusghrghhnrdgthhdprhgtphhtthhopegurghvihgurdhpihgvrhhrvghtsehsmhhilhgvrdhfrhdprhgtphhtthhopehgshhmvggthhgvrhesthhhrhgvvghsphgvvggulhhoghhitgdrtghomhdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhoshgvphhhrdhkohhguhhtsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747418035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0iZEtQ/t2xQuFnMAFJ6dcVkfQiu2mO6kCSVBQhsJYE=;
 b=jpoKP32Fj5/Ooo91UnUOllyAXxLHedZhJYPR7af6I69TZtjvb5RRKDTbc1IaMUkpbLQJQt
 LuQNlW31+DaDGS5w+Gy3b9fNeTZ37/rzsfSdogALBSHLOui6dQbwXLx5weveTZ+sIMhsxZ
 ZJSzxOPy3yxfHqUroOIZi/N1IfOuvmWG9PS3RKk6yJXkaEOrdbHevnw5J7H7UmQOcp+0DD
 uhXfgXlNmjwr4iBmIiRzb1+E2oIQJlYckdSUvQGJioSVgqx5wjF5jHpoDipUvR5AKKqYPP
 vHS5mwZMdv6oOUK1Ubwfgz4IFvPVgdaDDWMpxhkHNNwAYlRKj79bmp1B/R8bFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jpoKP32F
Subject: [Buildroot] [PATCH v2 2/3] package: update cargo suffix to -cargo4
 and fix hashes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the "support/download: replace deprecated .cargo/config"
change, the hashes of all Cargo-fetched packages need to be
updated. This commit therefore changes the suffix of Cargo packages
from -cargo3 to -cargo4, and updates all hashes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aardvark-dns/aardvark-dns.hash                 | 2 +-
 package/bat/bat.hash                                   | 2 +-
 package/dust/dust.hash                                 | 2 +-
 package/espflash/espflash.hash                         | 2 +-
 package/eza/eza.hash                                   | 2 +-
 package/fd/fd.hash                                     | 2 +-
 package/hyperfine/hyperfine.hash                       | 2 +-
 package/kmon/kmon.hash                                 | 2 +-
 package/libzenoh-c/libzenoh-c.hash                     | 2 +-
 package/netavark/netavark.hash                         | 2 +-
 package/nushell/nushell.hash                           | 2 +-
 package/parsec-tool/parsec-tool.hash                   | 2 +-
 package/parsec/parsec.hash                             | 2 +-
 package/pkg-download.mk                                | 2 +-
 package/procs/procs.hash                               | 2 +-
 package/python-bcrypt/python-bcrypt.hash               | 2 +-
 package/python-cryptography/python-cryptography.hash   | 2 +-
 package/python-maturin/python-maturin.hash             | 2 +-
 package/python-orjson/python-orjson.hash               | 2 +-
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-rpds-py/python-rpds-py.hash             | 2 +-
 package/python-rtoml/python-rtoml.hash                 | 2 +-
 package/python-selenium/python-selenium.hash           | 2 +-
 package/ripgrep/ripgrep.hash                           | 2 +-
 package/rust-bindgen/rust-bindgen.hash                 | 2 +-
 package/sentry-cli/sentry-cli.hash                     | 2 +-
 package/tbtools/tbtools.hash                           | 2 +-
 package/tealdeer/tealdeer.hash                         | 2 +-
 package/uefisettings/uefisettings.hash                 | 2 +-
 package/zoxide/zoxide.hash                             | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index ff0d5aad20..227ace529a 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12f0f729ebcd18894083802b4a53c04923a12223c00836376a31705afb702236  aardvark-dns-v1.14.0-git4-cargo3.tar.gz
+sha256  f5a75dec1b1a54e5460ecb9e2e27c88bd7f1b8eef3d78da08ec45a8a0d99604b  aardvark-dns-v1.14.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 9de1a5de3b..a860a73c60 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  2e6cd12a044c22b8645965147c1cee9682cd5e42e1e4defce184217ebd905872  bat-0.25.0-cargo3.tar.gz
+sha256  fe5d567728c240209e59a641ab41c53420b9e3a61bda43647880fd44c7fc7e75  bat-0.25.0-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 7cffbccd3f..a25176a9dd 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  53f663e2c8d699382a7c52effb4c76d761468a74e29c6e109daa849f7d0f8292  dust-1.1.2-cargo3.tar.gz
+sha256  06cb47200dce72a51ceebc5fb97094b20afacf6c303758540809808f24e59435  dust-1.1.2-cargo4.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index cf9bfa7be0..61297f2a50 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7081a0adf4134527af866d2741c4040d6e0aa0aac9cea65e41a43aefeb7cda80  espflash-3.2.0-cargo3.tar.gz
+sha256  02060e2a2d84d21679c1676a715beda468fcf75525ca6ee7560b3161c61fb148  espflash-3.2.0-cargo4.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 7bd8bd49ff..3b632f92d4 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17895d9de55241b4c011bf27ab676235a2344f2661e19987c78c870e7a22f471  eza-0.20.19-cargo3.tar.gz
+sha256  12c47fc9c73450dca05b6e34f928ad13e2cbb59434a915be0d47fa5635df2cf5  eza-0.20.19-cargo4.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 17ddcc6f17..5cad89cf31 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  593c1c9433c049fad66653d5d0e9243f8b192e92be40bd9a25c1b99d086e06ae  fd-10.2.0-cargo3.tar.gz
+sha256  aeb949d3ab62960ebc4ff9c1b2d06065de9727c270f36020b8d95328d762688a  fd-10.2.0-cargo4.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 2c6ab44c45..ca3bb41a89 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  933cd0efea1e9ec9da8ffff4aef1167eb79e161d4f961a9a8e67e64f03f2b8b8  hyperfine-1.19.0-cargo3.tar.gz
+sha256  9fb27f85472255c40f0ac24a932fae3cb5836cc99558d1f7a36a66e937be45a6  hyperfine-1.19.0-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index 2f61e8ffdb..c9c129648b 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5cc30c03e8e2cba665d777343c27ab02dce03a350404002b7b3acfd94645acdf  kmon-1.7.1-cargo3.tar.gz
+sha256  7b66ef3d20951dfdbe6a62c82ee6de4bb6db23135e65cf535df5d934a7d462d4  kmon-1.7.1-cargo4.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index c8788e612b..9a1cbca0ff 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3de86adf74c02c3d111b733205fb3a691790dd91afaacc42c40571bbbaf70b05  libzenoh-c-1.2.1-cargo3.tar.gz
+sha256  5b1cc424771338f28ed16bce23a442856ed5b7f7f3ba1ff2aeb7373d68b484dd  libzenoh-c-1.2.1-cargo4.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index d4e03c239b..ba6c942fd9 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ab9eade60540f83466da61872b4dfa09d110b3bf274ca3e5b4f6aa77ce775b7d  netavark-v1.14.0-git4-cargo3.tar.gz
+sha256  00219b98bcee1c25aa2fc7557b25c3f22a12ebbcbe1e83e82fe71f51541b250b  netavark-v1.14.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index acbcd0f69f..074bb694a6 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  86075c78ce86f14dded275d7e80948743faec630e7392754b6134d2de46a9f83  nushell-0.96.1-cargo3.tar.gz
+sha256  3f4f31e1c4832c34dc4c6058a78e9a893595e165334bb9be6a241618ce2861ad  nushell-0.96.1-cargo4.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index b9ff580329..f84c64802d 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22c35cb194e8f76eb7f700ff451662e3cc5109d9f297c4b7e8c19ff5d01f89e8  parsec-tool-0.7.0-cargo3.tar.gz
+sha256  6ddb379cf9ab309a64c869cd64870d4e58414398f00fdb0ed1524f1e684db226  parsec-tool-0.7.0-cargo4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index 79f86b9c7d..c6d9ad8d01 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a772c6d0a3e4e8532aa0d53841035258f0bb960af7cc82886792e6e3661708e6  parsec-1.4.1-cargo3.tar.gz
+sha256  1d12fc9718a8690790974348e8ac170bcee433c074c06ba5db7c0a15c372b30e  parsec-1.4.1-cargo4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bbb3501643..fa1e06537e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo3
+BR_FMT_VERSION_cargo = -cargo4
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 015ebd6b74..d79e205231 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  29459186e5acaf105fed558acbf5c5242e7b3e3e4606e810298c5415cdee26d6  procs-0.14.9-cargo3.tar.gz
+sha256  bcb75fd23307581e23c20697edd876a5a231dac25191b9e8166f62e0f82af997  procs-0.14.9-cargo4.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 660f5b688c..029baab0ea 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  2a4be8c8ae6d3b39e40d313eb16c06f9c9873282d214e11d655e7ab5e8c7095a  python-bcrypt-4.2.1-cargo3.tar.gz
+sha256  f33b38de3883c173e1eb9426c99aca1379708ef5feac46bf749f4d36ecf9ed98  python-bcrypt-4.2.1-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 35020cb299..148e28aa9d 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  9fc861ee2c464558dc0a122ebb60734f4c032d690c5c7e4bf5d753a952385d48  python-cryptography-44.0.1-cargo3.tar.gz
+sha256  fee8ee88b2661e0cfcb14285abd3cf292d36aa6ee72e9f76d0c0d8ad010e1c27  python-cryptography-44.0.1-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 307783ce74..baa8d4b2e6 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  09c15e4d5fc5a46f6d730e1860f2c46a2bf4bedf53e0508e605b856637a66ff9  python-maturin-1.8.3-cargo3.tar.gz
+sha256  c5e19df8566f9c15b6178a6312f1d7071c7a91efb0f578151439b5fcdb517176  python-maturin-1.8.3-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f4616812a2..54594749fe 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  fcb1240544e33db0dff7daa1e68b53e6a09bcd48cdb3f74a526c41232815bb31  python-orjson-3.10.15-cargo3.tar.gz
+sha256  b4a77b2489f8ffe81f9b1037f1c17fd6bf89291b82888f176dbeac00e9cdc0f9  python-orjson-3.10.15-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 11b00dc05d..ebfc50e508 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  475e20938b8dd93465a4e9fe9e030dfa51dcf1961d1cb02e3e50889489defd67  python-pydantic-core-2.34.1-cargo3.tar.gz
+sha256  34e84faa734d981ca1f383844ac057434108e657667f115363abd93ac65486a6  python-pydantic-core-2.34.1-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 240b317c06..6e1d0860a4 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  040c2401a9f4a950e6c7303ed565698fdf28247c6b216d5d895afbff9490dc7a  python-rpds-py-0.22.3-cargo3.tar.gz
+sha256  08c2362d2d127e27a7c0a501c917b6d404edac93fdd4b6ccf46ea9448b04fe5e  python-rpds-py-0.22.3-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 314c9e01ae..54aba0c849 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  624cc1ff2b3fdea42aeee3a4d1537d37431ec001870dfee1e04a12bd3076a2d3  python-rtoml-0.10.0-cargo3.tar.gz
+sha256  9174c3af184cbd94e67ac99f63a54c5f8ecea95421b36f15204f6eab762af047  python-rtoml-0.10.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 528b1a9246..55ccb0cf02 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  ab027a51928d013acfd2449d07fe0b667060d66b4ea223c9fe5e67888da4c6e2  python-selenium-4.27.1-cargo3.tar.gz
+sha256  6db4af23dae4b66626cd9a3f730e8aea4d35623953ce3b57b73510c4b8f8af49  python-selenium-4.27.1-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 87c7b07979..c6cfa63ea3 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d76c49448e199005780f75743be50f0c7e3886f57649e420f7aa01e0b73da9b5  ripgrep-14.1.1-cargo3.tar.gz
+sha256  cb56abf62d2e9924a873af5dba4ecc87964a5144459d240a83e42c26ea6f9d7f  ripgrep-14.1.1-cargo4.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 06b1185ff8..0718bdc696 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d5c56c023d14a043670f65ad087f2b056b04a64a3b85132c0b1c4ed9ed1cd32  rust-bindgen-0.65.1-cargo3.tar.gz
+sha256  20d32e8e182ef49694a65a4a18d624cac7caa30b03422212d503a7edc0d04f6a  rust-bindgen-0.65.1-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index a247010de8..88f3fdf46d 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1242c2c08a9aa9da415b3ddf4ada1eff04a2edf7ea087385be74e7b090589f09  sentry-cli-2.20.3-cargo3.tar.gz
+sha256  5072542aad76e1cad27ef643c50b2d959bd5d49e742d887fbad83391d9ce61e2  sentry-cli-2.20.3-cargo4.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 746e5f4b4c..f62d3c36d6 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  984a6875806bd46107c401c3044cd88265d44ba3f01ed932b3a4ea4dbe268c72  tbtools-0.6.0-cargo3.tar.gz
+sha256  3fd91206483884f44ef757343f68c9acf91817ebbcdf4c0f6821a3734eb54984  tbtools-0.6.0-cargo4.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index 6ad7485d2b..acfaad0271 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  260a054a737364bca4fb3c333042576f92284afe4cac82dbc420ee86656d846b  tealdeer-1.6.1-cargo3.tar.gz
+sha256  40952b9921d750bd6a84a7624b7b19558a9bbf1be6433b70db5ec2ccd840e33d  tealdeer-1.6.1-cargo4.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index e5cbd8a1bd..eb1a4f5edc 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7306d3e268f9c95fb627f9b428c8880ac616d60fa38ddfe8c209d13a9d422a0  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo3.tar.gz
+sha256  846eb9b3efe09f6584a2c08f70a291b3733066f832008b935f010336cbe5e0b9  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo4.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index c4dde33021..c6648b94d9 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  835edde458c330e7733c30ec07fd3b5f362d9a64eda14c3348a88263da93230e  zoxide-0.9.6-cargo3.tar.gz
+sha256  06c7c697582252a8b54f8bd32d77603d3c2f107b8d1e9adee7751dfd31ebfe76  zoxide-0.9.6-cargo4.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
