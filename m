Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F98606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jtHX4TS3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MHPVVjUk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCD380D7C;
	Wed, 28 Oct 2026 11:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6E92cZ0bndMx; Wed, 28 Oct 2026 11:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 532A980E34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187225;
	b=q4ieeLIba0lpM9evf8zsAkJTPQQsxPXQEPQ4Q7YSWGbElDTO7S1e1xyrn/JNaw3TmT/N
	 r3GQmkAtFohi/0LzBdNpZ5claOsBTZKg7LeFGd1qO772T4vQXpD/4YWAaD97z9KD9oZTn
	 vU/6bCFZ8ud/ezIzjCJ9LjS76k35ZUMKs2UW903+R3N7SFK/HxhyBIAgjiGPx+d2yBI69
	 HyV2IH4Nxf7iINRnhss1GAHKrBtyqFGouS150/o9ef46nVctj2a5q/wclCjZgatBYzrbh
	 SekjlJxlKvFLoI/RxroS/giUwfoEwcVV6YsViSI851vXzUPq7pNnCTLMs1s1Da4MoMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=afz8ohcBxnaumvCeTXACicpSSCNce0H0KMaOe0CQ3FQ=;
	b=ILzOvOVPZNqYurQrHJjJEbwvRxHcPHzBmFS3i6S3a1oan1KBGx705S9UEb7uBPfcVLsw
	 r86GT/ZMyLJl75mVqoVvyNAIFWD9yBFdJ3+likAqoRuK/lxmjcYpFsZDfSBT5GMVwEAbO
	 D0y++OZe0IJHHD7TSCcZqBYFQAQuyjE6cf+OsD9cs9RkeDrwxV/aq34QcSeqHfgkPW6yS
	 cZ5E0vMubru9h2m2SN35yOsCZLmGr1DAiZyKhWPTSWV54FpY5BeXedGnC04E1BOQMNBGK
	 dJSfjVfTmdSYhrL3ylyB8p1wP/GowijfxjSFgVX1/G3qmFOET0VHYrooPO6IvUYbT+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187225;
	bh=afz8ohcBxnaumvCeTXACicpSSCNce0H0KMaOe0CQ3FQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jtHX4TS3r87zOvKLDrASVHn3Wh/m3u0tG+wiNnbdar3ZDm88Ndx8JzQjgClj0vN4B
	 BH+CtNlKE/OiyZYTKc6afbPn+jIeVsBwxN0goP85dmHtkqq7XY+RNTxdAhkYf5Y76t
	 SwXPayzP/0xQw8SS8A2K0dqZfFSYfezkcvZX/5m0oUozx/6b7NcCY+WpV0jBqjpUPJ
	 sOY6j0cZb2Z/Yhl21T7IiL3gScckQo2bTVjIxmQJGC6cVXIb211Tc0wJ/YaUFielf+
	 qzqzjIz3LqT24gPVVXWklfKPp5QEeceLqeKlJIY8JCG4U1ATXi54bfzu81YpK1Dyqz
	 MD6ROhESXCogw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532A980E34;
	Wed, 28 Oct 2026 11:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 555EC972
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 131FA400FF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEOrLXGQixGS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 096B040087
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187219;
 b=Vyi2nFpyUivQ8YD4YUbq0hGblDyK8+/vU8G1mF/GMBajxP8pR2mkPtQZ0a6SrsOlKqeW
 K6D2eTgA83zJANYrjt9c7Vahvz4UoNjckHqBHsLd5M44Cqy98clKKwxACH/ZLRMNHvG5U
 5pMREVhH4csE22525Fj/6vnsz6LfesvHNY2enpvMufDeTqTIHPzGKN+Ij6AH4uxHzYHvy
 oM5+FCyWMyzgaQnkO3NliaMNFl8T052bNvllv/h5x11f1xbTP3vColXfNPqiC9Tq7IZrC
 NmKVWJI0hkEdIb5CkiWp+H2+I0oXowJiSnuqUKpj4CSO/YZxzMOFv+M0j/fIuep2c7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=W4uXSnsPcWB954a3O4bQN9bEy1e8jaNEz6/ns7cm8Y8=;
 b=bkEbO4fpaghgLRr9+KHTMHLeCCtm0hxn2h0F1B/u91xAFYyzI6SRs4LymN/gxB/Tp0LM
 UB2pKb90bUAJFXHQD51qMkZfbnJdXl7t1ym82gXYuvruyS2tZoyG2smvFTHme9Hhduhnx
 PgCEpj/kO8+GsTMjbmwsSQHmMmQbjkbZr0mjeOM4VTPV2KifTJUmAzearznVphGWVaFKS
 bcwfXQolbU+XfctBQVKvC4TIbV9r+VuMl+AxYqpWO0bQ72YRWhQnnYQh3LRjOv5TiZhOq
 muaLhATxy/1eeqxrW5CMO5wJPSJCUVXcuYKz2Mp2Hk5x1RhtS9cxumJ73oOOz17P1XA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MHPVVjUk; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MHPVVjUk
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 096B040087
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6b4563855deso175773a12.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793187217; x=1793792017;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W4uXSnsPcWB954a3O4bQN9bEy1e8jaNEz6/ns7cm8Y8=;
 b=MHPVVjUkXDDW5OTpX6Z9WgcgynMbfcJiqf/Dh9ypYYHrqgd4wBco0ogvTDqT5ygkxJ
 XmdyHABX+ZohGwzlvpxwD33s9kmegStMjYiQOYEtod7UvENagpY9cplZU9uzH8N0r51E
 V0BM5MjMVzuKwfHaDIRLdG5XultaqFJ0qQUZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187217; x=1793792017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=W4uXSnsPcWB954a3O4bQN9bEy1e8jaNEz6/ns7cm8Y8=;
 b=pl0oaGzrQpNkPdzFE6fviOSnoVkyND14FgLfq408+nFE+iEamhXV5itQmS+x9EkyWf
 WhsulzXcn4eoX1fENIJ5XYwabwnUBg2w8vrcZL7aEGyWtoO+VPba749W/G/4B9/DHChj
 gqcy6Fu1fD6ShLs8+zk3xa73wBbmIdlIJoJsaK7q1AvB8xljn7fQrsyD+gguCiI6RdKs
 kpP3TSZA3JtrVp2aVmn8z9NSQLxlgWAO2VQFIIGZhWwc3wkSVh9n6Urtzo6StAmLVisT
 Kx50n5Hdd45HscMnWWB0MfqR/YtzMqvrB7dVmhIYWJ679dcfP0n5UBkhumZ2dgt7A0Kt
 n/CQ==
X-Gm-Message-State: AFq9FYK6NWVfQPdvAWxtXhTe2Kwjc5citu+pbP/FBqNDCOYTggzXt2II
 n4WbNnr1d+eE3qpXbvJ1B93Z9W0qXHA4Z4QidNN0JGxLKji1qAe9k577NlpDqplfMZqyytlXKEd
 +9OYZw9M=
X-Gm-Gg: AYBFou0CAgbYNK4BiDhT8Ea7PDg8EmSy3lHT7XHLoKmAuXmukyA9knGPgdNwjgJYyi/
 +asqpUaPPe7SkYqF2Xbm31/gvd53hjJ4Gc0/D9QgcaUbAmgo34qATYh1jpQJlLjYplCYyC8E6FI
 XiCppmkFbFzs7N45r777cT4PmPLnAIf7mugl9tNt7yqmHeqHDAufxP48tAxJHIv8/1iQ2UvohWC
 Wl6Hez/GrGNOTA7eTXmnAShMGjQ+m5eOyFA9Ed4Kowuj91K1doeQBsOWFKvcMYbeLTBddOmaYIx
 QVMD+M6Lb2Npt8Q2+euDNgYWV6Tw7EdapW+IEnC0hsMGidx9anqajdZOvJmNQxhui5pAmf8zfvn
 nyaVqhMvn/f2S6RmsD8B7JdB8LwjhGVpP1vpnXL8UstRl5S3mR+SYxuNATSb1AsNOZoEcKfybOv
 FO5L4yLNHGxIR/+ExuxH+nBZUCbxn7vn/YaQjaTCKFA/aMoeArWfeclE63F7F+uANAUbeFXs7Wl
 2l7nFhJsnht9SUbQizTkg/hh70h3UK9kFIqAETIOvfEhxWvTh3NiPjsRSKHS3vQyltfZ3owxCg8
 dfbQCC5MT3jKBrEj9LfeSEJ051fsQ8/AhiXIU2bLF8y2nBDxJhwVP7AwTLh5aZW2N7ysn9iPZsy
 H8pt5y3pUezYVyzoGZQDS+GFifW9CDOj6gTkH/5NaNQakgsLcNKBWRUE3sKm87jL+50c67Dec6y
 cZEwF++oSOoFWJIbRhM0G39/wxIGTyhMVoCHWT
X-Received: by 2002:a17:906:b30c:b0:c3f:98d4:dfda with SMTP id
 a640c23a62f3a-c49bde860a4mr177407466b.3.1793187216504; 
 Wed, 28 Oct 2026 04:33:36 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6f7sm592468866b.63.2026.10.28.04.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:33:36 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:33:29 +0100
Message-ID: <20261028113331.2960539-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/6] test_mender/post-build.sh: use
 /etc/mender/device_type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To keep parity with board/mender/x86_64/overlay/etc/mender/mender.conf,
change /var/lib/mender/device_type to /etc/mender/device_type and
add a /etc/mender/mender.conf file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V2 -> V3: s/parody/parity/ [Thomas]

 .../testing/tests/package/test_mender/post-build.sh   |  3 +--
 .../test_mender/rootfs-overlay/etc/mender/mender.conf | 11 +++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index db075628e0..f27b0f9417 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -21,8 +21,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
-
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/etc/mender/device_type
 }
 
 mender_fixup
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..5f423fb2cb
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
@@ -0,0 +1,11 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy",
+  "DeviceTypeFile": "/etc/mender/device_type"
+}
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
