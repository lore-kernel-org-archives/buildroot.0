Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F448606A688
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kHa/yUDp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Vp6St12R
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E263405C9;
	Mon, 23 Nov 2026 18:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io67eDVSfSmn; Mon, 23 Nov 2026 18:32:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 13E28405EE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795458761;
	b=G9MQlwtJCj9tacDTon3VOITQHMGnnzl3ouxBkXL5mmURaoHjDeqTzeEwKWwYZswnKNlQ
	 lrfTfUPNAloYTSJ9g1+TKcj9z0bNB7E6uJJvmOoNTSJQ5zjPd5FlAKfubwcFouIkPBcdZ
	 /82TOnnK5+2bVtEKAXKBPmHHwTXTXq6AMV4gxMtXP5jIOtT0B6C24rXN7UAPhQgixGIaG
	 UobW0B1es8HcvymyQ2zBCV783arpDLRTqoC9vyJM+K4z6rHNmRcqQJ+2q4dmw5Z0myVWN
	 2QYiZuKvOvrbyQDqxc8s4qbU7uQtlh+HifKKua718BcSqeaCv/9SdEvNO5z0s0a7aeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795458761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gkOo5xwZt/9IejnCfAnse13goTfLC2rMs2AmrxKWa/8=;
	b=j+opQUMHUSa7BizMSMOGKBPyLiS9fs2IvTw1ncoEAZckimcvMEA9H2WbPuwLRbA83yQq
	 DINqPhEhZUpBaoZ+gWb9kJyAKWrdrBc+tUEGPsmyfQdvvAwg125oMnVku7nHsPEUT5py4
	 6F820EfNaL2hOpg0UHqRL6XbR9S71cdmQXbQk61nv8rfNuR/+XKi4rmJXmuczM86wSMxH
	 HtHGh9KmLjj4ChxIPz68Kk7WfvOfX+ArWqsUIkUE+Frx51lHX5YlEoLcshqD+1p2CGS4O
	 Nq2RCcQPTbum+KvOYBkbcVvGcmT8gJ6Q9EUBx0MjMcWRFtgT3GAsYiK+/vX4N7e0Y0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Vp6St12R;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795458761;
	bh=gkOo5xwZt/9IejnCfAnse13goTfLC2rMs2AmrxKWa/8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kHa/yUDpJTNEVgr8LbnOsvuabCIIw57AEWejEi8pGqDEwUjGN+8exBlQr3daFcLmP
	 XLcWvExfw/NZIV6LwqFVzCOBDtzrQrSRzSmDp2KiXxIKfre3cBcvXtAUlG3s8EhIWd
	 FwABKUgVRkrQy+LlxKyWHH3zrNKowGEINBf0ombabtZwZnXeoAvJ1R88CySCp/jcEi
	 MX4+4mH1+f9+v2DElJ7Q1VOgVBFPEmOoIQqmSQ6fmwJPthU8lVN1vrBZQJt0H+VhUR
	 y1mOTvHmgqnfxI15uiajzH10x11MLv8uSTDt6BgIaCNhPW7y3MJlrJ7GvAnif6O6Uc
	 DpkFQVeocyEmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E28405EE;
	Mon, 23 Nov 2026 18:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8874311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F05405EE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHVcIj-2DayN for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21C40405C9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Vp6St12R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C40405C9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795458753;
 bh=fM2NvC6bUmGZFY2l1G1UohOoQgTNUJyUKqN80IUALTg=;
 h=From:To:Subject:Date:From;
 b=Vp6St12Rvd/1rM30JHHT3dBHdCycichh8QYoLhtcj9h47QMzJGqBRC63LDbptqDPk
 B7bHW92CjOyCYG56+g6ZA07OiBKY2RNiaA1cHLkERkd/aCMfbK0533aCCySxN3XAU7
 TK8WDyaba19/gzdnQ2KDWJjvvrKXUBddno8M+TfiZ/NtlmfrMeR3EEW0nJbsSh2wj9
 tDMCJLIlmlyln5xp+9Slr080xvbKEWdQ7dMElfeuZJyXAnBC+D4E0I2WzzhvzfPm3O
 /tQaqkEmAsWjtTo808G4kc7GVPhqP46HBEPI3seEh+cj6US2ew+n8uyJvqDJxWjZ4a
 NPJIcp4eJhZgQ==
X-KAS-Sym: v3:f51bdf72230551df:oIEBTlhDrzmBvIaVocDpQIgCrvRtM5VWI82tQFRA3V+03
 fpPpEUSyfLJr2ljf7ODdNzX+a7eTipezkF5iTaN8ijFaY1dXliwkJJiLoQoIh6+xOMJNkJPwFWq
 L3ual/vynFonu+0zFB3Py0Hr3+ySrs1BsDgyEz3yLXX7+Bza1u1YxoZ57ZfXav7BwopJ5lEnVeb
 gxXBwCucL4C1+ZzEBdEGpd5FVBr29xaCDJah9k9+8mGqXo+5qZ4IMPZRmn9X25K1kee95kSZ2Ab
 gRpkq00w/DIqZBmKz6JdLJgJ1ru0Y32xwk3cceARHmvUcmtyZ2PSMQAiCrVm9KvZbj6Te5kQ==:
 lhP5iQp4pQCtopddG8KbgKC69ZMcTz2ZzNvXNXfYOD+Za+LIqDOEI45hqGFSDLyRBvcL98/iGkM
 iFVWVGe+9psJXsR2/zqwSxBm6JfDQaMy7PzcKJFtaag20AmxYkJrKN4VFktBPR88dGpZ+/Hu1PT
 3XjHv0mvXswjYyKQRdu1JMYTXineA+gsdtRo5FeWKUhaF2fUi7dZ3+WhlfISV37nRArMhAP1M8m
 +9bwskV/yBd2swTk2vT1KWUF7gaW10TW+LE0u04ROIH23a8KATl7pzyHO/vFeBKloZzPEmR93vu
 aT00mCxpliXTVtwSTepszAJRNd3E9xlbWmvJdBG9MLkby6H2a4PgnveeqDFZzH+RJ9m4znBZV4o
 9UOCVpsYf6ZB7DTMFsCdaWefgRaJq6EzG2reino65qEP91cB/te/Huu1YrX1M6mKTC3zYdAwAok
 qPCJIiTf6j5mRk7BnKjl6njD9o9sUpAeQcHwDV9SM+0PJEO6mcZ0cunMvDHiAeZ/VBrFrmiRHmy
 o2eYMWdJk59T0PlciPtSFOAgDUQ3epAReOMy6WGVlpctkM2l6sQGKx0D5LLCc239h9l0wiotWln
 Z4zV
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3261A4C42E1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:32:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVYq8-0000000052k-239B
 for buildroot@buildroot.org; Mon, 23 Nov 2026 18:32:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 19:32:32 +0100
Message-ID: <20261123183232.233737-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the latest kernel releases to:
 - 7.3.5 -> 7.3.6
 - 6.18.64 -> 6.18.65
 - 6.12.118 -> 6.12.119
 - 6.6.162 -> 6.6.163
 - 6.1.192 -> 6.1.193
 - 5.15.225 -> 5.15.226
 - 5.10.274 -> 5.10.275

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{5.10.274 => 5.10.275}                 |  0
 linux/{5.15.225 => 5.15.226}                 |  0
 linux/{6.1.192 => 6.1.193}                   |  0
 linux/{6.12.118 => 6.12.119}                 |  0
 linux/{6.18.64 => 6.18.65}                   |  0
 linux/{6.6.162 => 6.6.163}                   |  0
 linux/{7.3.5 => 7.3.6}                       |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.274 => 5.10.275} |  0
 package/linux-headers/{5.15.225 => 5.15.226} |  0
 package/linux-headers/{6.1.192 => 6.1.193}   |  0
 package/linux-headers/{6.12.118 => 6.12.119} |  0
 package/linux-headers/{6.18.64 => 6.18.65}   |  0
 package/linux-headers/{6.6.162 => 6.6.163}   |  0
 package/linux-headers/{7.3.5 => 7.3.6}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 18 files changed, 21 insertions(+), 21 deletions(-)
 rename linux/{5.10.274 => 5.10.275} (100%)
 rename linux/{5.15.225 => 5.15.226} (100%)
 rename linux/{6.1.192 => 6.1.193} (100%)
 rename linux/{6.12.118 => 6.12.119} (100%)
 rename linux/{6.18.64 => 6.18.65} (100%)
 rename linux/{6.6.162 => 6.6.163} (100%)
 rename linux/{7.3.5 => 7.3.6} (100%)
 rename package/linux-headers/{5.10.274 => 5.10.275} (100%)
 rename package/linux-headers/{5.15.225 => 5.15.226} (100%)
 rename package/linux-headers/{6.1.192 => 6.1.193} (100%)
 rename package/linux-headers/{6.12.118 => 6.12.119} (100%)
 rename package/linux-headers/{6.18.64 => 6.18.65} (100%)
 rename package/linux-headers/{6.6.162 => 6.6.163} (100%)
 rename package/linux-headers/{7.3.5 => 7.3.6} (100%)

diff --git a/linux/5.10.274 b/linux/5.10.275
similarity index 100%
rename from linux/5.10.274
rename to linux/5.10.275
diff --git a/linux/5.15.225 b/linux/5.15.226
similarity index 100%
rename from linux/5.15.225
rename to linux/5.15.226
diff --git a/linux/6.1.192 b/linux/6.1.193
similarity index 100%
rename from linux/6.1.192
rename to linux/6.1.193
diff --git a/linux/6.12.118 b/linux/6.12.119
similarity index 100%
rename from linux/6.12.118
rename to linux/6.12.119
diff --git a/linux/6.18.64 b/linux/6.18.65
similarity index 100%
rename from linux/6.18.64
rename to linux/6.18.65
diff --git a/linux/6.6.162 b/linux/6.6.163
similarity index 100%
rename from linux/6.6.162
rename to linux/6.6.163
diff --git a/linux/7.3.5 b/linux/7.3.6
similarity index 100%
rename from linux/7.3.5
rename to linux/7.3.6
diff --git a/linux/Config.in b/linux/Config.in
index 44f73ab006..98606091b5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -169,13 +169,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.64" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.118" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.162" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.192" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.225" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.274" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.3.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.65" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.119" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.163" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.193" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.226" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.275" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "6.12.114-cip34" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 8327c5dffc..91427d15be 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  08308460320e852ac0745b2be3c7ae1cd81bdad713506ed7d817ba1ec9e1a5a5  linux-6.12.118.tar.xz
-sha256  4aa89f3652fc131e5d39990f3bcd4b9e131028af3f315dbe83f3a8557dc06f06  linux-6.6.162.tar.xz
-sha256  1e88e317e20dbc79a2cb9e3d9667e908b262d12e76eb66eed894c5460eb87fca  linux-6.1.192.tar.xz
+sha256  143b287965acb9e270095b95894e59e2eba306d7e1f6b260d4ba74fca70c0333  linux-6.12.119.tar.xz
+sha256  08ca57ee614714958ffc6aa6451e34fb96fc398001e7e16ff7fc6dbfccb94688  linux-6.6.163.tar.xz
+sha256  e47276bbbc8aa191c5421ff2f6e0da87e25073042bc242e4afb1e53ab4ddcd80  linux-6.1.193.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b36b9fd6fa854787687c4c980aee4747577f563a8d4f45b7da2fdbd914c8224f  linux-5.15.225.tar.xz
-sha256  9f87a8b523560ca7740ea4a149c6dc0dab7814c2a41bccdb739b291a7e120b8c  linux-5.10.274.tar.xz
+sha256  18b909e36ec2949b5928a1dc4da101699a5db007529311de4a740b8e09299e1b  linux-5.15.226.tar.xz
+sha256  dd29544e7ada59b765983fca4d445248e8414e7af668466b1cd4ee48cbafd4ad  linux-5.10.275.tar.xz
 # Locally computed
 sha256  c4c21ee6722dd5d6a199099e5e68e2f0ef002c34e6e23ac0aa7ce92ba7710a8d  linux-cip-6.12.114-cip34.tar.gz
 
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 1d1150821b..a3ef5fe075 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  8f293f83d54f0b7b9be56863ebc5e4ea79d73e530b4ae55c572be97ef39f0990  linux-7.3.5.tar.xz
+sha256  8183d475a76a0faffa92d6cd500af421f589dfd0300a0f1060bb875e11d45723  linux-7.3.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  020d45510c539972e6f14c5c71566878d3b7ef56fb082b3e09134f2ebaade562  linux-6.18.64.tar.xz
+sha256  c92606f956f09dc50b5a0e2af9e86763fce27ada1647de97f8d1ac8cfc95801d  linux-6.18.65.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.274 b/package/linux-headers/5.10.275
similarity index 100%
rename from package/linux-headers/5.10.274
rename to package/linux-headers/5.10.275
diff --git a/package/linux-headers/5.15.225 b/package/linux-headers/5.15.226
similarity index 100%
rename from package/linux-headers/5.15.225
rename to package/linux-headers/5.15.226
diff --git a/package/linux-headers/6.1.192 b/package/linux-headers/6.1.193
similarity index 100%
rename from package/linux-headers/6.1.192
rename to package/linux-headers/6.1.193
diff --git a/package/linux-headers/6.12.118 b/package/linux-headers/6.12.119
similarity index 100%
rename from package/linux-headers/6.12.118
rename to package/linux-headers/6.12.119
diff --git a/package/linux-headers/6.18.64 b/package/linux-headers/6.18.65
similarity index 100%
rename from package/linux-headers/6.18.64
rename to package/linux-headers/6.18.65
diff --git a/package/linux-headers/6.6.162 b/package/linux-headers/6.6.163
similarity index 100%
rename from package/linux-headers/6.6.162
rename to package/linux-headers/6.6.163
diff --git a/package/linux-headers/7.3.5 b/package/linux-headers/7.3.6
similarity index 100%
rename from package/linux-headers/7.3.5
rename to package/linux-headers/7.3.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b3eb9289d2..001e889313 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -478,13 +478,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.274"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.225"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.192"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.162"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.118"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.64"	if BR2_KERNEL_HEADERS_6_18
-	default "7.3.5"		if BR2_KERNEL_HEADERS_7_3
+	default "5.10.275"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.226"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.193"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.163"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.119"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.65"	if BR2_KERNEL_HEADERS_6_18
+	default "7.3.6"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
