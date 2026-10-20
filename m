Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28555606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cd6iMNYG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=ac2QWMRH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079EF80D62;
	Tue, 20 Oct 2026 10:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCO0Gk6i97j7; Tue, 20 Oct 2026 10:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2FB0980F24
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492169;
	b=ibiT5/nOmWwTi7eXLtLyWfwS91g8psPld2YmO4R7k31RfSXWU+Ym73awIcjkJn/fVuBh
	 UiapfbJDUW6xoxYGjsMqs6DDXTddPsxDA/xYfTUahI5xyI3oc/dwoJiMAkdX+CYn2+WMu
	 n7uQzATUjGRNPiSus6qnuHBXWh9olTUKfZBx0u3WtFGi8OK5DiUXAp9Kmxcsi8cYsVeLK
	 DaUUpL3YCT6Una5N3VF8Yx+uSnC0UBnfca/uAjmrcVUklvA8eU0ykBtF+SLm2aTqsJglX
	 bYwzHzu2OSx8C7HPJE4Oj3JeuQD5bAF5KOWoLDv0U/DaiPF6tRCgAM7SpBeI+7q6PgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=IvHsoDGw8qCgIbh9ky/tREx4XdvBhVNWh2+xkrpldyA=;
	b=SB0oNhH7+5AtqFaNh1B9/KJZn2rmM8yXVj7BTf7a/z+YdLaX4Cf+0GQKZO2vb9lj+BGA
	 Bpg3rBetBBRn0kMEJsk4XQIQtBMkXp0gxzPatMwivIsQmYxwdSYNBeuSWy7xR+yhn1rhj
	 SVSVLyPtxqE0D52fkaJ+qG0vd3UM892Sd0nAtiGugqkoGEViAJIe0oYG6hLWUeif8pWAB
	 khZUqwPDFOBFhZE968DCBhcBG47EvM50m3O+kKmL5JOJfbm9jKTZ48V1FknsDgIaKNajr
	 vpR57+46PTdS1TUScInFsnSdOzfsLYgCmNp9iSyVh2EHEv3fxruPKNApRxdD2YK8Vlw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492169;
	bh=IvHsoDGw8qCgIbh9ky/tREx4XdvBhVNWh2+xkrpldyA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cd6iMNYGxs+uCCD1JXCSgTg9Xwcr9HZOMUE6KXlsXG7ctZ7lYbw4zHfk0cvtcY3fE
	 X2XHY1eTD/Xo8SsrS9M2Kt47fW9GYqgLOfKwoS4Uhde6YwzWZl8a5zPxPtu1yhz8y4
	 SIfL/h+9imYUCczF4Ql1yGWYFlPUiyneI591ejqFfOM7xZTfbrXNv46GC6lSak9cP9
	 ZefOzCk7NtcyKafVyemgra6595+zZG9f6DF2qBg3C2MKpK6drk0D2d0BSpnYsC9oU0
	 AUI3gJtzGdXryhCi3t3YRaFLvBiBPSH/cWyfQStbBg2u+4artfJyjUdCCKw1NaIQlK
	 DXfISS6lYaobg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB0980F24;
	Tue, 20 Oct 2026 10:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C32465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35894016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90Fv3USisj5P for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2977A400FC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492159;
 b=V9/jxvZezYp/6Y6Z+Eqj7nfKX2fcC0iN2fpvqOy4ijMaajWnmKY+IkYGl5iKbckXsYdp
 OCCE+SkLqehCWdid/4ZwUu+OATU283QPJsvUrYByvrzNcrpmVuHG15bycz3sTKqciPE55
 q1TbSFAR+gG3FcEVY7URvJDrl7ha243BcAdCYPthR99PRyZDpDZhdVF9+M7MMupkmU1ho
 itpnsoMDHo9TaXlCa+zPUVL0AYi+hZGFHS94hHuqHYHHioIFMT2fIreRL8sGp11ep/ojj
 WlNk0C4DbrVn9BKj/m4WucDWdsW2C8BDoQl6NNAtkbch45j+zV71eoO7NdaNm9gHQqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492159;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=qFPgtCkD/xWtF+bal0o7BLfKtPwLokUZF1EAWWZHrWI=;
 b=Md5LCTB6SpwFNKj5iyNfvEQQkJIc4r8W3k+1fhoKaVhjgfMPq+2dD5Je9aVeDqtjnOLf
 2p1hRpIvaiPIsH4IvT2HZ6+rD0TFJlh3jm/R12tXUYAoOBrTlCh4iRY9+KaHmYNYx1Sam
 75t+67bKSrL5/VjnVw1GJvTY+E2RB5OCIGYt4S+Bl1jy2JZZK8/+Vmcpt9dMnHjBupkl+
 ijI6KX3KxjEQeYU3vnbcN0/lycp6h1FUzKLtEDdm6FKthiT6ForloVB8+1j12lf1SfHXf
 wZzMy0wGZ1CfgynmDvu59wZNeQfZG+o1XR/njKB+kaRjlYHGXY3/xCyJx6aViQS1QlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=ac2QWMRH; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ac2QWMRH
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2977A400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ac2QWMRHPI8TiorIdgtZPcl/S9XaVK7FnfSahPzgYWtyFF+faFLpOUMafaNGkkebOoLXy2gbzLDCyGoglKkiSGSI2ZPnPWJml/IENXUoOR+xIRSgATS/5P2lj9B5assll/jWXeitqjWtwCSmbf8lgbda76xI3O+YOyejhNk6MXDCofmArVGTnNgS+kQhrloroflMZB+054YoSLLQiMtwft+aKD3UKJ0uJs73vvTTG7CS7gaNyfYxuLuOtYitRfc2S9obrS65nuRV0lnUvwfFOh/zjv/Ayh92tGMyew9t+pz+MsvKqqmhIBDqLlC0d087tHqvE7SUPcaHRpX8qsVghg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=qFPgtCkD/xWtF+bal0o7BLfKtPwLokUZF1EAWWZHrWI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1426228254; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75j-0000000833T-186N;
 Tue, 20 Oct 2026 12:29:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:28:59 +0200
Message-ID: <20261020102906.1918308-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 5/7] configs/imx93-evk_defconfig: drop explicit
 FIRMWARE_IMX_LPDDR4=y
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the default on i.MX93, so is dropped by 'make savedefconfig'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx93-evk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index f3af2b5183..05ab4ae7af 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -22,7 +22,6 @@ BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
 BR2_PACKAGE_FIRMWARE_ELE_IMX=y
 BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_PACKAGE_FIRMWARE_IMX_LPDDR4=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
