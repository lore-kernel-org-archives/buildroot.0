Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B28606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JBSlXsHr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Fl7yEHq1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3718B80DFF;
	Sat, 21 Nov 2026 20:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhImRkBQrRqL; Sat, 21 Nov 2026 20:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D192580DD9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291767;
	b=cIBRuF966sXR7suqx9XDKBBVCU65AFdV8YvwkCaqG9UmOW4uULFYXxEYK5l2ga7dj8Dl
	 5ScBlKUFN15Nt1MjVteq0zH1D6ZllnwSlUb/3mKB4rfWOJOP/GN367SoWwxiwZeuMtQMD
	 8oDwqWYw5LgokbA8HcAcVaTLn3dMitFLyEZrCcylYNfoxUgoXY9pNcFfIkZioVkPQ40KG
	 C5pEvAaY/Bnf402bVZfGgpOMuhvFxHyYQAZTnuFQusU+rai6/T6pqKOe25LbJ9HkWO9UY
	 +aZtQEqrPjLV2MgYBUvFjtC4G5VmOjCJXWVNPOsYI6KZigu4xB7wPTNLwYaBAc9NjHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zw+9ihDX8T16AnZADkOy5RIoNmVdetdI4dGRxF22MUE=;
	b=DuZ9828/5y9m7PVtUQAmKhSIgXlaRbdFQ8A5j9pyZ2/Y5MsW9zU8oSOhOv0dcs+8pMi8
	 JkGtz3GKyeV6/ZPbKxe8Cs0pGhKFsLwcoyp7uO8WNo/MmaFT4jhIDG43GOitfvCuNgRZs
	 Wts2yu0+Y5Yxq8PLrI5EjVinSELqDD+4SegRzBSC2+Y8A5tEQ0l/JtxHFqqOXeQUtOq23
	 YPeIe6TVAZ+TbyiKsTChsZi0yYFw9uJdnGu5IsE5BAIhNciwgPWe/4oHVWGVvq8rbFIkZ
	 ClhmFw+DJ1JgO6TEeKiB5ovBE2iB8sggWO9daxsXgj/7Oju1x350of7aTia6B6elw8g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291766;
	bh=zw+9ihDX8T16AnZADkOy5RIoNmVdetdI4dGRxF22MUE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JBSlXsHrKjHjHFJ0wRyyGJrUjr4kYV1kzE+w5U2Xy5dw+aI1Kd5ndsu2zykcGrAJO
	 4XMuVJx6ucur4eDGcrI4IMPTYWDPjCvuYhgJxkh7dUNvFAJOlSvUFTlAOu8/Fm4q88
	 4s2e+9ObPkyNjJ3rxuFWB3gc3k5fPBxxVKe42sTq77Kq8TWtKEEQj9laohunuVeQW7
	 O4wtbahHgXKiCnz9bzr5PLFgXh72YwsZVCxFy4jeNqW0fUatKj9+KdihAJFI/FKMBD
	 nI/LPDfrgnaWNPACDhRxPIGgr/9VbNyPZ5WtTY0pcH8FaFrpQp6hiSPlC3gJWM6fF1
	 4TK/BtI5e3ffA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D192580DD9;
	Sat, 21 Nov 2026 20:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DA9B465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B38740561
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c579nitnELHR for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5817B40535
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Fl7yEHq1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5817B40535
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795291759;
 bh=kEB7l1x5ovIvEKc4xyqq/3Y89RyHh5PBBLSpEXyQWGE=;
 h=From:To:Cc:Subject:Date:From;
 b=Fl7yEHq1LulVuCjTOzsWAqEPeSoEQGLq2XgUVDdz5yFxz4/v8hK340ux9jJTkqAav
 wWm3ABR1G1EvwaRbkavFTiykRrbEEtJjUqJ1YdssafW7uySZ+fySVEk7yMpc+xC0kp
 V7sNMKNRa19/nSl6z3CqFVFfsKpzAhzU1YluEwqw4L3v6rPTd3C9OK8sODHJSuwfuQ
 wRt1400vG/KC5xyO1hNpSMiK6YbLp4WYQs5+RQVQlhkqJs/bgtlJ0vwXSmpcSdleN1
 LqR/X6KWAw9ES1AKKyEyf+I1l59nO1Bdos9lPrjMjII5kWvsFtyd7fCB2Uft1sS8Vo
 zqxSGPM7Hxn4Q==
X-KAS-Sym: v3:f51bdf72230551df:kiR/jCxABIilLY762ar9EXtvcaN4WdtnENdIvaq1hxPum
 hwbTp3VkMgvw37dw2qWzic8kqtyzmg9P6FVJP0rUyuN+ay9WFRsCtKMTbx7fk8E4quInsmjWZEh
 yPdgZw5IR2ZuPPkC7W8VqEIdLfoLH462//SFnQEi0ve7sseiMMia8OPqwUyoJJHIOlb4Ki6TYKE
 pXsuhB8LR4IUydJrBOc4/iKJoymbC+E0okd5KLrPajxJ4R9jFu4s8NlTA5SRdioAL7iLfgFSofg
 RSdHzbrh/jgON+GaaCClAUd7iyGIgrb5NBai9adGGEWFSX09KlmZhqeoz98aMInC8Exk8f9A==:
 +vN01ItD08rNmMJVxNAakwGOmkc1d5pF40CE4A6ZjtR9esC3hg5PXP5v5Ibus3L8pr19d8NQ8DA
 WeEqnYYjTVEZDJKMwaoU1XqUIvXCTeHbhVJjo+MLtbFlY1jzT8ReVVu35cqKpJ1vHc6fL+PrX8/
 R3uIRwibLpGJDiBaP2G2QSEl4UKK8udKhaY3WN/9IRNqWk1XRmxQXfLjHhWPgunr2NbzBp1VXb0
 NXfeohBwKcau+2EUAU8bWxXhI87GlX8KvFdMRMfSK9jyBRnIxR5THZiDrWMQDh1lEQ0QFW7cBcy
 RjJTE4Axdc/CcECapwACEMQjNMGoKHQiW+EcRi7HJdp9Q4WWF5uLbeiLuxJToCn5kXjObdXc0/3
 JKNxoaAr/DHkyzvUnhMcSQGVVnFCb3dZ4+ZTcC2kx4vWi7Dk7IL9H8GE20we1ApwIWC2h90pUvz
 xbMdApBROjnI++xEFHRrdQcl5IolVkH+ALI5Gs0sen7GiKI/nAhCPiDa/pZYN+RwfNOmQ59eWr0
 juVjSB7Hv843Qs+AK6yITG/Rsqb3FCNe4K075HPA6ksDFvshjHZjuuJD5Jr774mJ9Iai4VfZA==
Received: from fli4l.lan.fli4l (p5b3a06d0.dip0.t-ipconnect.de [91.58.6.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60FD9A4C4100;
 Sat, 21 Nov 2026 21:09:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46466)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xUrOg-000000002I8-3oId;
 Sat, 21 Nov 2026 20:09:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 21:09:16 +0100
Message-ID: <20261121200918.130286-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH/next 1/3] package/docker-cli: bump version to
 29.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://docs.docker.com/engine/release-notes/29#29100

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 76a0bab4d1..916d9d76ce 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  23d7472c80bc7483e57655085d687c631b398837bbc92535528c4582fc17e95b  docker-cli-29.9.3-go2.tar.gz
+sha256  7b955259e070e839586faff4957ce71484380f3aff5caf519470c1448f9e9192  docker-cli-29.10.0-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 904f7ab150..30347c421c 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 29.9.3
+DOCKER_CLI_VERSION = 29.10.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
