Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73064EE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E42582182;
	Wed,  6 Sep 2023 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E42582182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqL7CKZ-GYHB; Wed,  6 Sep 2023 20:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D2A82183;
	Wed,  6 Sep 2023 20:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D2A82183
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFC71BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0693A82158
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0693A82158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef0SVv9jqkZL for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:09:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A55CD82145
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55CD82145
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MHG8g-1qQnZK0tUG-00DH0C for <buildroot@buildroot.org>; Wed, 06 Sep 2023
 22:09:54 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 22:09:27 +0200
Message-ID: <20230906200929.291410-1-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jWItwFjr38TlQxLWW9WVMLstsO4glVl+JSQS6LNEOXf8IRqVZmd
 DrAeH3dYysvzHnoqupbe/Y71xWdHIro1URYfRgm6PTHuI9n7s0A1L8vxWE7/NQVmkGLDgjN
 t+0CTrSsWrn84ihKqvzbB5EmFmhC+UU6noHquvq8SM3ImLM4sbMWlgwGIjdjDSeq0zVmHmx
 zgRcuaJ8b45bnXjYtYB9g==
UI-OutboundReport: notjunk:1;M01:P0:n3hCEi4FFgc=;hp97xqpYmgQN/gzs2nMTteEf7f7
 s2k7iteO22C1DAE29k8cPz/dlMv/hhUyJx3MQUX+SLlTdKaT7lB6dqvZSOmndgfOw6rT8e0Jk
 IKWK+0mOjNq7TTP03OGYerukc3qi0j7BD7C4JcWMykgDn6aiIEOJHExNNTvQP2xSyiI/x3NpN
 CldVaDRzejWc0RxeR1p7tx694T8+lWCg2yhmdjAXPjYiyQTgqhu/aFdcQQ7VU2tg/xohZ429t
 8nOBTvDX7quY9wnWPYSG2pvl41Kq8XrNcCjixOqet5VV6oeVlSdy3g+5JpRJAcuEn1tkShNim
 9lo9T4uvpIGVNvnAEjjPiuV5NQ5LlLACzDgcWqNp9uVngWGt5/8oNDA2DfmvN18gTNTXXbId5
 LDumlRO2dW4ZqXvB2uJ1cXy6NNnXGHCSG+6zy+K4tju56AvZF7w5UP9NFlivfBQSr1PYHnqd1
 sifXmZ4aFON7XmmFskMjhMoTH9C5NNbu6MqryiuYPjXQHFKy2ZaH/E0N13jleYI+MB7WtS8sM
 s89merVqxFrwqyNeeoWZHglS308X1i/z0zDKd3DcQ0NZLHaGEVCsY1afTqxeVuqEDZcWtxSx/
 hQ5tQK1djsNiAXvpouxqPd5eYbrUF+v3foAZR/9uiip5cgyajqrUbo0FuaPfj5Tpq90DWSfrZ
 G/f2XiqgVgbsmwGX/LHO2DuSngDkmHwSOaBMF1gvEwBRt5e7YIpAwTYfcwocYPQRZhSM1xL33
 xVtfQUEcPhSF9b7eSzx4FF0JphRoEyT2rC+KvDgswDZyGjclHzFu3lyhtUFdDTgp4ccrbyhwp
 61DT+oC9BRdSL7v2xHGoEqhUAsgaJJiO4wcV4kMjCk0raUx/jBrsZb/dvvN9PcMy3c1TgWksB
 ldLWDhF3F0o7Mjl5TQztKqLLAxZl2RJz2/5a5du4f3MoG4JIXb0JRiOo3v53Y61bfPxenSLJE
 nwOrUAwiD7+zeAVwYdq+rQMXO2w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694030994; x=1694635794; i=dalang@gmx.at;
 bh=+wIAK8aK74YAMD+TH15SHti0GNpfx2SjJf+ov+H/egc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=hbqwKyzvFPcWYU1gE8Yu8M0GKvYagLqKGCQY+lrERRbt2NK/G/togzEagl1Pr1A0FSqmXJg
 ysx7tKtm9ORpYRgSuDWfjMuGpuHZv1rfSG8n+FaRESvMvE4jvtLhjw8n998Y32ctyfA8iiB5u
 mQOpIC5sXKnYErjDANcxk0c2418CAoer/KzJ9z5vFSZuKujFt0vq0Klz4vkd7mogbT/9cAhFd
 /zJ4snHtZ5tGVtKtBSDJRraXiZbrcUTCp5Hnpm32B8vqGUPf19y7sOICJbmH5podqSu1yS+x1
 lkTKmaTjUND7I2j5KRJq0piaLOguJpWIK0m6ZM9PJbR7u0/Np11g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=hbqwKyzv
Subject: [Buildroot] [PATCH] package/libssh: ignore CVE-2023-3603
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

The affected code isn't present in any release, see [0].

[0]: https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libssh/libssh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index e770d2b924..f6c590ba0a 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -16,6 +16,9 @@ LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
+# Not part of this release
+# https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
+LIBSSH_IGNORE_CVES += CVE-2023-3603
 
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
