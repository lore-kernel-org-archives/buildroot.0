Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846B606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jyp1ovlg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=TIJfGhbo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0122C8101F;
	Tue, 27 Oct 2026 16:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFb5SaDVDmjv; Tue, 27 Oct 2026 16:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01A0481066
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119244;
	b=hP5az2Hjpk8pkfgDXQkMH3VyBrA7QLPb0ZrRz5WtauSBvFdxyiZFOCGT03s6ftEbUfPz
	 RCTPk3E99ljuWHKkdo/krfgtBeqt9yzA7eanYgUDoe4JV/R+Fz0qSIwtuan2YXrjcJIJI
	 YWOwplLcAYMAE+Nkie/2AnAYqWzBQsumBWfmRHUfVsy3EpOAvFq0H0QXTiWp9xfEoDvgb
	 ZcB+yfqintGMXPuYOivzBmISG6BTsyZhtkojAZcFde7jyoDbZYw1a7tYKgDjYtFBxfbtL
	 xQcTMrT31nl7IMNpIR8UfW0xxuKWcohcrgMz64a4YpVza6GkKZLHV7IPmUs5akAqBoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PpxsbVQl7Fv8/tL632d+MmZnqq0yOWeaS3d2ldLnaew=;
	b=TzseidG9zYZV4VMb3n6D314BSsPaH8oP3aYdEYX1N/K+cB5tr5/59vCWssaX0gb0S0sV
	 znVXeaQAX/Bm7CeVJamrbT948u9Wm+KV0M0IjiPUEW6repT/PWvRk3utnSjUkry7EnRqG
	 Rl/u98RfXwN3bkSHfIMIGAx/3wGgDRWd9SjhY1KSVfCru8P98g5xD7nQ4dnGn9qQfhIuD
	 V8uXBn3Um85XYAXameIdUA2/9QQdoZqzJScin32OgE3Vq9/9yZhLNj2xFFIt74hdpVqMW
	 hgIGu5E/Yk9/u3vcFLzSq5iMG6LUzmyq1O15su2adQl8yK+CIzaQW7QnKCzbW9kT9SQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=TIJfGhbo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119244;
	bh=PpxsbVQl7Fv8/tL632d+MmZnqq0yOWeaS3d2ldLnaew=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jyp1ovlgpuVbuy9ZLqAMY8GqWS0s3NzKOg1A4VD/XbfVMrjajeDP7aOIm7UCB5bdy
	 yPGkarwTbX2T6lSfznGIZyj0rm6IwiSDJBXJfcb0HXacNQQe0xowtBt+C4uYNfvsuT
	 M9kxluhcWwlwiuj+nw2b1EO5xpnhRSycTQHQTb0Zs2omBB5oT/gKB+xgbhMtw8qYkN
	 RkJJ19iglqVsBFWa/1IQ0FYHqU9R963JyAcqo+rbhdEloI4KfiwCm3mqqRx4Qt7BXL
	 QAES6WWFQkWzgzx3gzeW7mVfqz6O53qBsV11JL06ZPvbAk6mcPZHxhCZaYVBL+JuDl
	 Q3M8+upBxKCYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A0481066;
	Tue, 27 Oct 2026 16:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5260E72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 268F58100D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hZ1-gZfUdBf for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCAFF80FFE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119228;
 b=XjSCUoSJHBKlNeoM1ZfrXzvrY3Zk2xD/lobmwG25ovOlr80pT/3YO6sb6mjMhsrxyXkh
 ldUZq1g4nJJUTd4wShOag0AwSguBbguXQ6pmXNUVUmWZN7Mv7yUAYufP3zc2FBc7bthlh
 bpmQ1eEyC9W1FIt4USMNkcTT/ZBzy6oAAHjxh4Eqbc3ioKjZXbtRtjTvyVW1SzSfT9tuO
 vIGXMfC7egzWIuvGKc7TfIWwiiWRONCjLpwncRZ5nuLfnEeoeWxQLd9natseledOZUHNF
 raK04DLCuAwObsnXpW+A3JA9BWdDTlo9YaMa4Y9i15Gdjzca/8UMgbyRHeHU2p9NN8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119228;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ch1GzTTFTvHj/C4/vCqHSV/TPoW6zbtPVk/5gWmz19w=;
 b=MMaVFbeAH/EnbeImmTQkSRv7wfQC//GukSWc1lzVenV9rqjNoqR4djf+7Bcm5KUKNFct
 5frazXIl5JvI9Qgv0s8nGvXWFPBzujTAkXoQkwlEug2veKyv+F3ctk8BuYK1foF8zko5L
 th+jM2mOFGtarwWFRBykgxLSSxrIo3n9aFdHWp+kcmb0kTPBBzDqRxRpfgL2zsEL9YKNT
 LM+FYPVnwZ5qiVOjLXdbTKUFGZ4LaOfi4NkR8y0HrclFbvRqOplm/IdI0BKNLXZImduq8
 s5XegGM5G5l1YZpJd0GXIzXhfyvEo3Ve7mZsNf+bj9KxuMSpEXeUDKW3Z2xeJaTbfSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TIJfGhbo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TIJfGhbo
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCAFF80FFE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c407213696aso334766b.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119225; x=1793724025;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ch1GzTTFTvHj/C4/vCqHSV/TPoW6zbtPVk/5gWmz19w=;
 b=TIJfGhbo4n+hr0hBK8BQExjNX8vbTfkSXNG0dmBL4ZJwVvoH12jYx4uyGozFlCbKp0
 um3aRu0L29zCaMOV+io1RNMkLOS7XwevtrxJhGCFPAaPFhLlHMK1ODh+yQmqBolDGPuy
 /ozXdApDbh5uPFiHZe0arQhRrioS8NZ1Xb7Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119225; x=1793724025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ch1GzTTFTvHj/C4/vCqHSV/TPoW6zbtPVk/5gWmz19w=;
 b=ST424mCJW8K0ni9eU6Ry1arkXlKey8HVDfIhDnCx+W4kkofNP7M7cIfiqfjSGdGvPd
 rGGhiGD7VU9v6DPbmPH0NJAyyTgr0vBncI8fxJJLNa+zDr64SXx3ZWHQ0rtHBoPWHFhd
 qS9GJxe5+JRE/VV+Fwq6cCPCcfdyMTIMj/6Gbtv4RIZLLIjg7+2DOOAHoq/B1BPRe032
 0s9W3uWbEU0k2+Ex4emPMHjymtmP3q0FFM8yfe/1UfeZ/J9WyPzcLFxB14wWcXBzseTT
 /j9nEHd4K9j5VJ24r7E0A6NboBOmC4HL/5+s8lsjDiNwHHxrWByRrgphWQO3TtKMyzNP
 QlcA==
X-Gm-Message-State: AFq9FYL8OzCzE1zRFlTWgHDQYvkoa/x416bzPm8XRzZQk+5xj86uKSBt
 xKVuXeNWRTlKcVLqRyLxnnHEjY8iOZDXzD9i7CvAIJRNBz2wzQZf2lMHepwKXWuPkY7PwL0Geic
 ziMZNUHw=
X-Gm-Gg: AYBFou0bpeSCuh6vK8oKpu2hJNzxRZGTtvFfwcUGEWKgxP3y5OMj6PatsTxrGHlYSni
 pOvIX04ET0/1qoEacOyG4GtLkXWzPqALOzTOYn4j9hVF/3l+a4m91kQM17lWSivlNL2R9SsWQDp
 vRTtL7nUL43uphypdfbIqHegAf3JNHZuSp/MbQTDwCaj1bhEo7nL1XKojeayh0v0g4k/hPi/7Oe
 bkgVoW6NEPK2MQlyTjujZR5jMiOfPjz076gfOP1oI2Pld5D6LROSrl1NAC4ly+Gn6J4L5jaG25U
 fYWIhkwj884rAOtDLCMEWp+07s2Edah1U4PFLhDazWVdCIbmVtFMKw1XpPATH5Wynq6bcblO3bt
 QyiQj2w9kJEZ+zpflCgrvL8pXYoWiwmV9smF9VzhsfEHyP09paH6KnTIwqaH0LCnCT04EWdoaKS
 jYp7vw0ix2aHbG2ZmnN4Rv5AYXgP31xc1i6Ls/XnvmrLg7freLpFDjukCezQN29MvjdjvJfVLvX
 KqunOY0kGmxdSJZN/inGxYyYJJbDykQBLNqpy4AxWUSmIFYw5ianzLXv3OEfJsHk76cP4erXoEz
 HRyDP89Z2BFKEEr/DDeoMtsObTa6yC6n69d8GcI9v8CAf0toxRTIHW0H85AvpeHJwKDJcFvoXWP
 WcJ0uS0Ox2dN5MAUnA5QoBhvPF0ADhAnu1qENPv9A6hs2k3fCYd9M0jZ0rTQPYg==
X-Received: by 2002:a17:906:5154:20b0:c25:2ded:ad36 with SMTP id
 a640c23a62f3a-c46bd9674c5mr1295669866b.0.1793119225450; 
 Tue, 27 Oct 2026 09:40:25 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:10 +0100
Message-ID: <20261027164013.1602502-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 13/14] test_mender/post-build.sh: use
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

To keep parody with board/mender/x86_64/overlay/etc/mender/mender.conf,
change /var/lib/mender/device_type to /etc/mender/device_type and
add a /etc/mender/mender.conf file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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
