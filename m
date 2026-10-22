Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=axUJzH3u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B214813F1;
	Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r79dcnj810_p; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FF2B813B7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758725;
	b=q3plM98MgKXgxAPWsJVy/qDXPRf8qha6RD+YawLgfdP3JP0acPaEH5i2cqNEmM3ousP9
	 QuWrKfB5vddhZteFOuTwt03jpxwuJ+lFNUiqfvFvIurMR6ccHpnNc8nCUandQriOld4Xk
	 BFLOfGdqU+wk/NJ5G9qt2syLnmHKB8wg/COeXTjad0YIbBm/0DtgU7sRj+2CIFGM15IXI
	 D2Z5JlFM8OwyedlJP/FtCkdu/7c5koy5kSaWr+htV1vXUEA1lc9QD9yOKgCzwWtESuHer
	 wXulE/qr1m089HF9w0DtLXeKakSEXkgYhSxfXMHuLmtCQNNowf6J0THyKmEoiCz9NtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=A8rMuhgWIvt5qu4OCs9/6Xhm2fW4qxhkIytNWIloZ4U=;
	b=ISP/IGszY8oP4PeJq10bfSxOKu3FL4/uJ7Z2CzMY1U97ClkKQJYDXwfLy7uzNfoL9Wik
	 MJQQbFsjlXF6Wqf5YFHq7Ls6HBbqrsFYGY0cignyaoopbN2r9XAu9Xrfsa+p+oet2Ovuu
	 F5lVq0ifEGvLsCN5UI7cxIMR2d3X62md9uFJ6vAni62nDl6zgpfp8YKSmsguIZ3wJPXPH
	 GatkA+H+IAQ1wHcs2cxuw9AUqfD++/vdENnomdGYVkkUZZbksB/MyjQKtVr+7BaIPtA+o
	 VFJRKSgAja6Lr8s3z8aGft96sKMq26Qp/k1uzN6/GXfCdh18+j0W380gB5cKoAZyb2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758725;
	bh=A8rMuhgWIvt5qu4OCs9/6Xhm2fW4qxhkIytNWIloZ4U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=axUJzH3uH34GZeKSglAgAbf1qLCLfVhQh6ePNS2heANKUVJlahd8Dz6n54hVoBGZw
	 70Yf6wY6dnVokkbcCge5Ysd+FcX5EskB5fR0UDWuXqT9bZfYFrzM0Fk0ARPcKiuB3D
	 cRWRvfhGkteYasuROMVjP7yfIb782OLMUkji6+a2ZSBCPAh1Th6eR60xe7QUqDk/jG
	 nAf5XhyosbhCCnw32LFJnZH+wUQvcOOn4oFoVQ1eQS4FbgYTIOTX+yGc2WAo7epfcD
	 mTStyNXLe4A/6EBDKcsG+6ft8om1AhaacnVXwa5EG118FAM6fpWVQ57KI2Xl8A0KfG
	 xA8MpmJS12YMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF2B813B7;
	Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C969B12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB62340119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPIHJyGU2UbQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 30443400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758724;
 b=eipg2qVXi1z/KmvI1Sv/2KvrIrkxbuzbkBeMYxEmwMD57v6bzIaFg6VA+v0wGqwp32iW
 n8W0e0+sSx8pSvYqauwMr0YDZTvWH25Hu3pAMRvCbFfHAMExX/5I/MZQSTBHZfWFfd8LX
 JebT5hjbOU5Sp0Jfuf5t4E4LX3NRtmbqdrVO/l0Gw8ZUd76366/beoeAipQWzWAd06h4G
 YlIC6Uk07P/ozaQ55LFgvsjdwHt/buwQemwpsEitqCQLJERZCe1V/9QLnniGN6ym9lDVf
 27zQAdJ+tfjEpgXHAXsaXSHhLMJOfd1Bs+mqaLFMaaXGfGKDkI2kvwe4EFXCPzvANoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758724;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ePcSW0GVnGeBxGtccU+Fe/qD1zyNt5pMEytacJHLDGM=;
 b=s10tpUbkmrb2hoYaEXDnRo/gXn5QL5a3khxRHy96qmAlADL6M+WvlvAwtkEFhI5Acajq
 y+faInsCJxOGELKw6d8bY9f2hhdlO6N73YJdbPpuJGjOYiOpDx6GNR8wqstxBEHmBsDEi
 Aite1KvLuRtktQifsMUEoWrF5ebJ1mxArSKk2peUGtLkF1G8CwEpExopHUMYILz5JJgsV
 ZAXe3Iu1x/JlQi5weE54oH2VWaTCuZyyHe6yisD09b3d1Cnk8xYS2mcKGFipAuJ0pQIkb
 DnaY+yTpmFhSLTpbJRsHAB9dAlGQ1OJCxEnf0Ip25v43HrDM6gTxrVtOsNbed4uxg/g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30443400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6CF29C669; Fri, 23 Oct 2026 12:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 85cb9195db250012922721c2b37eb86e604f1505
X-Git-Newrev: 054a087d8a77fa1677d4b95811a8f1d44d834f4a
X-Patchwork-Hint: ignore
Message-Id: <20261023123039.B6CF29C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] DEVELOPERS: move aichat
 to maintainer entry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4175426896464890088=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4175426896464890088==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/054a087d8a77fa1677d4b95811a8f1d44d834f4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a498c7cbf61089f154e9f53a033e77bb25089340)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d27bf5454c..0e9a391ba7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/aichat/
 F:	package/broot/
 F:	package/kibi/
 F:	package/nnn/
@@ -131,9 +132,6 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
-N:	Alexander Shirokov <shirokovalexs@gmail.com>
-F:	package/aichat/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 

--===============4175426896464890088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4175426896464890088==--
