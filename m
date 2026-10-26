Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B327606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f1IWVs7X
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFD960607;
	Mon, 26 Oct 2026 11:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcO-noq60Apd; Mon, 26 Oct 2026 11:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BF486060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793013509;
	b=K5hr8KA6035RtorGvQBV6+vXSvCHx9PfHRWhACjUEu5e48GPB70JXsWKqyylWgVK1bYC
	 TazN0dNrYSzba4pT3I6AKC4o7h6PMhnftlm9caD3tjzdeJiF5U+FPEt/glYbyZGOnXtOb
	 NxESON8uL9mliHZXEnoSdCCCxpWIr8znE23GHizgJY3u89pD9bPrPLFtehbJ7tP5a0HI1
	 uJhJlmuxc/a1NEgNaA1p2rGnGZlUsC6LipsC5khe2MiOgYBv+H6+9GIPDo1XVPsC31VrD
	 YemLv74r2S4PFMDCEM/e+1E1ilNuAmxVMuGRUkfIDrA6jvuoAPP82RcmjzSlNq/CFPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793013509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ovkKLkuA2qbmnoPCe8DR+aQ0bagaqrMRw1A/WeyEmYY=;
	b=MoiXEZl6Bs3OrGab2jCiB8pQLhJdNLOz81s9Q6aBQe12ayhStnpc8YodWtQo8whtyPcJ
	 dUeANGyaDRFmBdVCQ/40cj/CRTUs4bl309cq3mecFiJe1VGvHA+26QBbsdiOJfsnM5Aw8
	 OwEtkaq4QGo/pYXBKV6lhy+nbmg1augjSgmElnIdfiiXdgKwpspKbVJuIhDS6TuoRTvF9
	 MEu1PdkQklENGcHjIIMOu/NVeHo9P/wUAL2EiYkqIByViUlbMDn2b4BOJvKdkn1xt/G5P
	 mDOw7vAD475mBOkBCrlLNxNtOPGe7CdO6wXKrEeG753JXszqlJ4UST17b/2pLSGIFLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793013509;
	bh=ovkKLkuA2qbmnoPCe8DR+aQ0bagaqrMRw1A/WeyEmYY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=f1IWVs7XEMtPMorD7entXbNvCQLmqxjnrn2K3AVvWOH0vVQHA5BlWcYmipOLGYHTh
	 0i7gEDBbh0TsYqyn41R0pWMP8FjzClCfmPnhlz494V2gcmeF9AT/WHht6qDf7IOJ0j
	 IlrK27hWcGatvSLG75djJVLBj42AZ8cfXwMZBFjRaxLGdh7TmgAFSLljYUP9DHoSgF
	 EH/g+H8fn4TVDmGfUudZLTGe9/ayoT0I20sCA2cT8MQr//SsJ5TD76YS8Rs1hwgoIK
	 K7h/X8ZLnOaSMFVJlMMzmY9M4yv1MV6HErjDGVFtOgSy9f2IVMXdS8eZ7c11otFf8F
	 K7+3IYUgt+Jxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF486060D;
	Mon, 26 Oct 2026 11:18:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8C1B356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AE34400F8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3z_0YRdmycu for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 11:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1132240072
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793013506;
 b=NfYcocm+l96Z//lIjV+s/nGVqrxcWuzUBKwL/Mjg+7SPs1miD/2bomDD1B8+sbZKeXgr
 zKYcOjagwbFhGK3w5U7/jIKMiiOZyVEXVZRIUOixOuQhGWLMUuJqlCOvI/3z80Q3MQrUl
 zGgjR5Gi5MCazgotBDlub+mve2zyVOzVk+n8SJkW5XEJpLYnd3J2n7X6EZ6yAXj+6UMiS
 vvJYTuP/d+HfzjgHGqOHdVyunvb7AKZvoYsc0Kwo0yMW6ejcIXVnJrOUEFx5lcw2Hstut
 MrLGAoFsBluAEQPrMiEkZxhIQhr5TTuYpYYXMdYSlm6K1laKFlOeUnO2alG3ong8NWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793013506;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JIs2P1x5dGGGbClZYu9CLCVWpr2x3OwFlGANEbJ0KjI=;
 b=EM21ikRqOPpyXvm4Bn1SfMha4UBFS3CQTiKmBA457QbcC1ER7UTCYrBEcofLUWI5IumE
 ziGbn/wBYc9Hip4KYoKh6sV8L9NLh9FEdUZ6pyFR3+IZ3cJPFO2Mj5VnedocQToGakvZq
 RNKjICgrPpNCxuRCGmqT9hiCK+8f/JSJ48kBZE8VBSEdnUn2iZJNtXLKoQHvCdcznkQ0V
 Eu0qZ8l4rZ3WHz2mq3g71gVQk/+ho91gwPBXRCAvnFXYcSKYJ/KCudsyvufAvf4UoyIXI
 00X1LmGkk6vT/Wq609ZORx5AWmq1xn5dhUitvtJqWfK9t5GzRTP0vGiFatAKruWN4Uw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=g0XvnTXd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1132240072
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:18:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa4d71e7so3031638a12.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793013503; x=1793618303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JIs2P1x5dGGGbClZYu9CLCVWpr2x3OwFlGANEbJ0KjI=;
 b=jeqqBfHdNlvZlVj0ZeV9CAnwZffZ3Do1qyQeu6z+78rhaIJNgx8xpEPDi2Vchkl/5m
 GeeWema0EmYgFKnmEVEzIZtg+tQAPN/Zb9u0Vv7ryYLPceDah0ib2zopnA7jZPrNZXkf
 ooZK3Att7MabfW1dBQqHR9QrPgUA3xVgTQE3SqeWasucKxBeJS8YyMK+mu5wFJMlMjuC
 YkmttVt+0CallHeUqf2VNkF7q0YVqhMCk6o8TCdST9Jh2IXQ1WMqA32tcG0OzSW/JOg0
 3PXyhYkvSwefnqTVDNbVf1IfsGFpXV9A7zZOuughmmn5E3fzQ9g9G0ZTiw+j5lg4lVRe
 KpkA==
X-Gm-Message-State: AFq9FYLRek5uKWZE2rFaaYJBktrJJoCRKqIClVaa1pA226D8dfxxa7Zt
 JXBEuRoJuF4kcOzCXvoKvdEoqyjX7slQGmwXzHyit1C1TbnzVvFz+tSnyJtXLdAhI/DeTUoxqf2
 b3YSt
X-Gm-Gg: AYBFou3NcyPlAgcAKvpSogHRNI7dyFXAFDVmWv4piVfPg/UnQu3y37qHVjDNuHfYyZ2
 eNjbgTO2WqGiY2TDJteM8fCFR167ZDDID2R9tixjZCHVcOkhzeLoXS939MCDBxkJ7/uLGm3ZSBM
 6QEpyRq6iMUXF9k5eRbXyWxebxN8Vi4en/tMBGfdjQg5B7UVvUNMSdH2oHlhrtW0KU1SB849vie
 EBQb19t1KyGCZMCoGb+XtQ/0xiq4E50lDQ02gK9RWMJDVvu4IYZqH7qo064ZfMKw7rLoHEcxdFC
 caLQZCy72jhCbleWkZD+49BDQYF4f4iE9Xko7I6ytD8EzvcA8Bb+ZtkEQAenMwVQPkwUgRuLAnL
 EGuB66g1xKt19DZZ3bGwtP9LhnmOGi6YCd9FjpB6fBujXOPKNAm8iDeWT+1xVXamVPQBND3YTbq
 IYO2IqQh9YNOeFyDzhvC7iK1u8tf9znlUVsbV7hRgzawqPAzzW37Ex6PFwLL7B/Ddwof1Cf8Xau
 St4QN4rnsPyXunpiBCjnZfZ41cvhy1RRdubs10LN6jAPGpkxVZHLxlfj5O81RVDE/NlL6wNrjGs
 Zkc5DMNJPKGwS29L4lbQaguAW/FjOcpC
X-Received: by 2002:a05:6402:401e:b0:6b4:5a0c:a7fe with SMTP id
 4fb4d7f45d1cf-6b45a0ca9dbmr4961230a12.28.1793013503049; 
 Mon, 26 Oct 2026 04:18:23 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445990d9bsm3556294a12.30.2026.10.26.04.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 04:18:22 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 26 Oct 2026 12:18:13 +0100
Message-ID: <20261026111813.2325455-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender-update-modules: fix LICENSE hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SHA256 sum of the LICENSE file was incorrect, leading to a failure
when running `make mender-update-modules-legal-info`

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index ec879f46a1..f6de69c42c 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
