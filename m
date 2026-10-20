Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC8606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kk+mfFFh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=ahFWHQiH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A4D60822;
	Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUzmGDzjNm4q; Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E3E460825
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492159;
	b=Tjv8+SDOSyEvoKYKKii1DgmlD8Y4Y3n451HeQDlGFb8qATOuNIbrHMifH+xNOvC9ckei
	 2lo2/pFzHSFRY8YIlcvqEUKnwnUZF05vKldYnUkoX+1OfHnodLhQkcOHAN2DeXWUfmlkZ
	 rLXAXtmBq0VT6xtTUd/ZPNXPsoBOR9T8mPEGhyQN0sD2OLQq9y9xVAm9qR3+WBYPxoOeo
	 9idr+xHDxvV1PZg7zN1j+F19Vm7GCbtQrRKeKF7BThBkoiILor3m1RpHIku35H/wmC+yP
	 tou0AtgzZFFQd4lmSPXKZWUYlmHVX12b9qSRVfzpu3adotXPcB4UILLEZzsekytxeug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8VsINoc0w4kz28kX+VyWHWLnAHeH14xdpB2/bJX318Y=;
	b=CAc58rP1IVqI0vZ3YQHaE+0G+HHslFRMSbWsejrnsK2jAodaszIV2zA/GUMI5EjBS2Z6
	 9MXPjVilFD2brO7Hu/seyu4VsSK/bF/NROkACSZsfeNwKJ4NwgBQ1fVDqJFt+6/oy0SFv
	 9wky7ppdBgm5SaDppAXu8oRzMBzF/94daXEChlUvi7vfLq4zCkOXA9NL9EbOOCi2lOtxl
	 cpKtjmtZbU0TM0xjDE7TWgDqU/6Ncas6aipnC1xdfdSsHOIrYpfcnnAGlO3kzBlnCQjbS
	 nFNTjVBJHumwF3fjZem+taw1bBuRMNpEVynyuBve58g6TiOJWRIA4r1xeSvoCDuMOag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492159;
	bh=8VsINoc0w4kz28kX+VyWHWLnAHeH14xdpB2/bJX318Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Kk+mfFFhrypNaN15svF1p4Tpt1gJD3iuo3zb3RRlaMR6GxKRbmM0sqkGZNc21FpqP
	 Y0hjIQqNVIZ+/w7vuaLHR68SujaZEsZD9u4HnbYZC0vKI3JSu4nDhAuh8yKcyt4EgM
	 pgXW63TTu/VskB8tDQs4C0rphQOjetzTQb2tYSrzCIpEuKTx1kHL4+z9YccVeRjdrW
	 VvClLE88wF5QRV9L+1F7YDbnmQR+owtlqipXrRISJG2hrfnuWT+NeKBWF+7CUisjOa
	 qPS9aoOOKVffFZdzxNKRqrnvWs0vqERnNm/ZH+EnAVzPLnvM4UfqFG1Wws+Nazl1ey
	 PweOX/6WKWtJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3E460825;
	Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35052465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B75F80C50
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPkO7dr4CEtV for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7522E80C5C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492154;
 b=sSpw6DROC0411eK2UcCdulp813uBGy7bGJqripJNlHL6DkPzo6AfdUMOduJ8ksIc5PDl
 aJj0dpsbjxQaBsiQNyKUHvY9UsV6TtTxs1EVypcYSgVN3/ygL/jXY3rbMYf7VxIEHjT2p
 2VtSJ0nFUtj4houxT1qnKyfx2qmqr86JPD0FnDAwVPk5NIxC5BuVBXJDH4sh0Y5ERZH7R
 744zo1ueGFem2CM4TmL0r+Prey64nUeccsi1rL4mq4Uc1pWIuT2V/5hhLQwbl1PCTrFA4
 H1Mji2Ak+B11JQhEuGjf5XzMmBCpccNALq7iJ288VutnUbSu3KTcjhnVWjbiK0ALFSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492154;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=hnpz8Jk+njgXw5Qe0zHMRfSM8sleBzoLOwfPN0T9qHU=;
 b=kJsnu9gt9Q4mk2Gn9+fVBfJ51pXnhPoWv+Vy+fdOzKUTu7/ziY1KwzRbh5vxu+1iN01k
 B1z0Tcte+r2S7vuNYq7syXYuH93wEMPASYn/OXu3AeUlLKikZF2Lp0u+jqRoXrgcO2wAm
 e6UfArg/dsJP/1rNLTPdSbyfsA8ih/yKz19L4aY6Ovmo1cN1VbFeKf6dWrh4ipdbry6bC
 hl3sTEclqsLLZTTkarivmiPHW587rzekNXUmCwI3vh3AIQddTYU8po61R+GoZGI0CkWBj
 mcIzQPQT8nVIDbDpmNc1Nx0jvTJ+p8Sli+3yyz40JMNG/SVzb+S8MEZURyLkO+DYB+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=ahFWHQiH; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ahFWHQiH
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7522E80C5C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ahFWHQiHvo9jVqyGMxeuDIP58It74TOBRahJ2SgYH+DBWc1wy0U4jWtHEY7zHtmO4uAwIk6ZhhS5y3/ddFj4vgam145vP7HT1fLRN9nivKtje9pgyaXpB/OXqwW6w6sFSOtym0aXDwf0xXJc2InoCu820+qevCGpX28WOknmyKr1DeVhzWuCk7XlA/mErKlCaNNyABZCeJkpnIXoM3FhcTl1nyh3Qg3chxgEF/LTPUbGDxzWTYYYV2bXeltHaC3hvZ2ap3nQ2d7qAEPG2WvvJLMNczI8cCGRoZB9Xw/zCRE+GT2hVb73cPJ8MR/kyigc9vLc06q41ey35/hI2dPAxQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=hnpz8Jk+njgXw5Qe0zHMRfSM8sleBzoLOwfPN0T9qHU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 506821236; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75g-00000008330-2Reh;
 Tue, 20 Oct 2026 12:29:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:28:55 +0200
Message-ID: <20261020102906.1918308-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/7] package/freescale-ele-imx: install with
 original filename
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U-Boot expects the original filename (E.G. mx93a1-ahab-container.img rather
than ahab-container.img), so install into BINARIES_DIR with the original
filename and add a ahab-container.img symlink similar to how it is done in
firmware-imx.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 5756b422ba..d2a96d06b8 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -22,7 +22,8 @@ endef
 FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE))
 
 define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
-	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
+	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/
+	ln -sf $(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
 endef
 
 $(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
