Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB1606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TmTvtIl+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UoEXtC8Q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D482606D7;
	Tue, 27 Oct 2026 17:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeAwlMkwuNWp; Tue, 27 Oct 2026 17:48:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A982D6068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793123288;
	b=iD5NNlR1sJCFpgjFsvTaBwj6dpXKjJji1iHa47a+xULCW0E1Zc8kQ83bbFzo27am+QLy
	 ++kOBw1HyPe9n12p9lOOBulvGeVd5Owlu3GKi/mJIYKSS0Zl8EYZHGt4za7LvD4AaYJoY
	 dUtJKxZcNM806qDltA8uSiMquJOSXxrrghBk8zZImmTQQBsopJvXlArrbSpNrjva2WwIw
	 qZ4vLiCNM6ID43c+Md77X+5T6q1ZsIGh1C8vuhq6FhQanjour0m2asIsTbHrKw1DtD8eP
	 hUxsUx3YsdbLi6KSyO73AUMjuoykbc9+BXD0squlLrhU4chN01YjcyZ8YGVVKxtBJ1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793123288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4dqMVXTqc4FKPW0JW0FkQi35YKyHXlUw8UKXLAHJZDI=;
	b=S0zlGI4aYz+xhOlifBkadOKW9T+ecmQ19uLVIzeE4ziu5hv5xgjlLouEV2pZ818M/Pf5
	 M4AoFm+95mNDq+NihqJ0Ndu8Z0Nm3YkFIFqcrCYf3I8zmG87UmUiisDtdRqmUsR5i6E+j
	 bLrxWh4DVUJq7PLs/wdMRTemrLTM/jZttfOWUpSczxwOGunvjELMUt/Xj3x0Fhh0/mVrb
	 xbOuc7JTJKW8uX3gJ+WhHn09+mrJszGI211+Vz/VnZ4Xoog1qDLV6cKFUKU7DhyHwGOjZ
	 NCX7WXqFFm+x7sSI87x62D75E1Csd2w29ykUQjzwymwtQsuQcdzbJBMPPEny3sGzP7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UoEXtC8Q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793123288;
	bh=4dqMVXTqc4FKPW0JW0FkQi35YKyHXlUw8UKXLAHJZDI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TmTvtIl+ZDF3ghgkTCNjLJ+mW4vFw/AykxY1ftWBl5L7kwySmC0iDCVKCOnQ4B3cc
	 JNKU2pT8YEiHx2DfvOOlR5XeukE9j/zLaKYhYeKBw+/3ajvCNbkHSFYsnMfUFbhSE3
	 mnxFjeQPToTQY9ev4sjNmtd6ieSNJwv1TPDvXmRjNWQvAanDKBxumftoi/qiM81oaT
	 UW6rsmy4L4+ntoYbax78YGC84Z5Hs8S+h8V1BwhBF676Sb3+1ujGPeTNxL69EUHRX1
	 vIYCEGrGKBM8bOGUbCd7OzS8ktYfXHIuRjjZ7xAfAbQmJ8xxZe4r+9Yyq59W1l4Uw2
	 Ua9xVjEvCB9YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A982D6068F;
	Tue, 27 Oct 2026 17:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B157A235
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96BB96068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxGZqBtt-Amb for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:48:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FA326061D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793123286;
 b=HvQXS5JfRCmPcJ9T4qkr4ypEiy46ge9vbti8+DuNhsE902EX8ynneKwaohPtSsSvK2Av
 ae2BGonJV4mjfFiXSv4UXeOUiO6fFvePf63oMTU2uYftjY2Zl/sXtjZQFbmXmkisNPaF+
 F7vwrZgyTSQpkRJv0mkRRLkbzB7yMGWSpAkMEdhHgCcYZX2/KxqdOqYa+C4BuQrfZgUfL
 2j626Pih26ojkk185+MeLh7d5ubm/hzPABHao4LrCPskb/gotj6WMhecwtcOstNAbXIfY
 g4rBFm2oOuOGWTY0jGU2gvocr9H2Fi7NZd5uQlYYbLeVOpWgienWeCx1T2eURO6bYjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793123286;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=G4N4ALwXJnUR3jWs6QPfmwMWdHPEwZFIc8ln+fCcuro=;
 b=BvjIoQM586BrJkqbrNsAilIlIDnDPtATO4dhuZiuKLJSaMcN7Aidf+ZyEhI3zw2BUXqB
 PmL5QoHNzvqJ/mFQYy3PEtfgDmAITMYpqhK16wGK2QK6tn56yGpV46N5m+2nzPIst6xPv
 JSpXc8rCAPqxvOzvwPmEwiXY+t3Ayip+C3RbdL8lBbJ7vsbHdwCgENoOaK6CCKrI+MRsk
 E8B6uGJdKGXIADjSF1w7nIYeBR53lhyHflkf3ksLMdv6c264jWilzRW4PqVoZ1HVl0hLq
 GGhCAL34DLn5MeuNCkbGDkzcEw+efCTRbkjPxu/taQOgufyGb+P340BOvR0CJlUUhVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=UoEXtC8Q; 
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UoEXtC8Q
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FA326061D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:48:04 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LlHFxgkV9tleFLlHFxMviF; Tue, 27 Oct 2026 18:48:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793123281; bh=iqCH1rSl4C9DeqfwSkR4PdLxTjf8RXpoGaxV7jyYEoI=;
 h=From:To:Subject:Date:MIME-Version;
 b=UoEXtC8QN8Y16W9Q+CmXaQEdQDmofbm2QPoy3SocYZE2y/2XCL8iNlHLNqsELOLq3
 CKOPTHZc3L019ArwIg5nSycx7v8KGjkcKqI515muz4P6ORikTtGNEnxniz6qtxay8t
 ReBj41YaeWQ9zinGbhf9WFWQeh1QjysylsJJgImbSdhZT5wsgBH0ejbOwGOBEU5j5T
 +bCax62PZrvb+ARICMf1ZgzpSzTC2ekTWuztanxj+vUxKE2L5J3QMSCDZv6O8sHPH8
 4gd2PmtjqvU8ljGQldnNZKwyKjsRcdTBd9Gks6fWUgREo46AZkyzRVEQM9dh5b0ni5
 bNAjjUa9oUrTw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 27 Oct 2026 18:47:44 +0100
Message-ID: <20261027174744.2443091-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEyarA0wieQ3hKksJ8zY3AOCcX1XPCZiRh/RiQBcMXyJFK3Votn7Wkt/GABFkiyTWgAJVQxxyE9hsUUG6wBbGn24IJ9uowKoYL6c/kFsELadD1BI3KOp
 0oY44Bgrh3KNX/pg6ef0O55JF6yxVFf2b6Z0mLXUYfhUxuhZSCxoH8Sli3k/f1cNeN8OZiDw2iWgL44o7SNeYjVZBtoWinxD3xYAPAVCZnvl74Mlyd+VtNo/
 PfEsAyJa7FvuxuXXPSUuddjIXwsvrTSCmrhvgFPewLM=
Subject: [Buildroot] [PATCH] package/rtl8723bu: fix build failure with Linux
 versions 7.1.x
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

Commit 99c3aee78f537afa3ccf5820c68857b2c10e9351 points to buggy commit
causing build to fail with Linux versions 7.1.x so let's update to
version 2026-10-27_2 to fix the bug.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 4175d02d52..ae25661b1b 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
+RTL8723BU_VERSION = da429f4c3ec254bd4d02f0f6b595230deab4194f
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
