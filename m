Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WvbOOyKH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A837405B8;
	Sat, 24 Oct 2026 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M64gjWxkhY7a; Sat, 24 Oct 2026 21:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B1E7D40572
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876734;
	b=LLqrTGJXYqkYgtVNQE5SssqneN2llVKN8eZg+W9B0PDtCylVvvvhgv6u2G7YPD06CBh+
	 Hh7ROreo5LlE/MxgSP97WDuPlj1cC9ImxUwwphDh9PG6AqhxcpcqdReUgOp6jbyMeJZlX
	 psh2ta5hpAOp4ZC46gDSErWUX0AL6P+Yy/lTnr3wQ/eARj5zjD3e7iBrHtTy6ccaOmw0J
	 oKRYLU5wMSubH3gsaDuqz7ZXBF7nHYHnYHuZ7a/MSedMwh/XWG74gY1xQtjFa2DzmKzlp
	 oBHAeRbbTfzF7+PLz/j+bJBT0pdY8MGvbGJBuzRRzNHWBLx//eH0xJancQHWMuIWhvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876734;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gbLkVPJ4X59Xf/JtF/rgnuq6A/BPM086lQ8eAyA7Gfg=;
	b=TGB5X1oNoE5VtZfoGXlM2ZxU7JpRDcw7AlvoK+zdig4krmypLZUwpVrQw9wuPjuhw6VB
	 bGH+ms0170sfjSusqhVAboVg6qgr/InmgauJRgMO2UzM04lvnuQNhFHDZQQwgI718LpGN
	 ZtCe7J1hjgv7hSgWMFs1oijoDN0v5/w5uzGGVMk39wtuFbyGlDRLB9GCDIK4hmIdu1bOd
	 HuhYI3rMetFWA5UUDJTcSSMumZ0vRfnQRQB94Fs5b8XvvFtoUCzBcTW8iwDKvoiH+yjBN
	 kaUnUvDMlSMZD2Ikq0FUNned7+/3o6aigZpCwhzfr1b7qYxqOn22NG5+giK0dB94y8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876734;
	bh=gbLkVPJ4X59Xf/JtF/rgnuq6A/BPM086lQ8eAyA7Gfg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WvbOOyKHfTgP89mzWGxWQ/uba5Z6XKOzBfVMEYQb+sX31sBGU+oevCrFoCd/XoS9/
	 CQ+ITDcOGaQig3SzaqPLpyFq4O2Vy/VuY4WZUfBtVQqmgWLTkkUBSTcoYnKeyPp0jX
	 0Tv0+EiV0IYnjVsL/tNOC1I3Scjxg9kntsOk2TM0SVEPkslwIWyY/msY1Lo2NPFCUV
	 eMO41Ee+a6qfPGFMX953XXJhyLrmkhzLIE5Th5fGE7dXmP6S9kn41x8QWiiM5A8qfo
	 vskY/nQAQYXLgnsDr13oGb/kcbizylboaqS5Oq7Wqt8Puu2xNVSewrrkseGKTfjleL
	 fakQiHs8WcPww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E7D40572;
	Sat, 24 Oct 2026 21:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE87F2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A479F6061F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjxDULpW_4eF for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D81A60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876733;
 b=a4SFuGI25/c4WW7PLN83mJpttLAW7dhHIGKRHN+2Ph02hCadzQvaptZkDAhK2TICw9I4
 8Y/nd8DW6bT1mHPCZ4Vibi/dn7W8X5t9h/mxRyx0Ri8o6jk+2iPYdm/oU4dnJgxc7DrSC
 NzsX+xydsVruR9Ljy6kuUf5EJKrUqzbvotRDobfuhPv7twWx/VJrca1pdVk5j32PH+K6+
 7t0OgG+DRV+eump6fSay7CfUCSa8fsWdaY9uvAcxdIuSPvGk/N2RXutDRTNZvMiI7A5DK
 jHN1fFaTUSeGCW9tBpyKE1QPUohgNWTu9DRvFnB/IOjQsKBXTRn+52wITFobcxtxsMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876733;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kh8fJNSWjk6aXtjTs0EltfTyKZ/AAI8xPcpMk44RGJM=;
 b=Qpe/7+Jkd+9Aph+KCNPvM8+XqaYoRrmx8ZSSgNLmy670IwojFV37BsTGYajI+pe+4L1o
 JFicxq+K462keLmk65xBNX/OOi/Za6TKhoG7CRrXawjoc3pdjoOdFohSOwN2LKwzsH2El
 KJEisYFl14ofMlLXiT+eanZOUNQmlNC9gfo9BdyAlqIJFrHTumre2wnDs2UD/uxeFSbB6
 cU6XzzfE6LmPiM+ixmz8b3frc8YSZUQ9KvjfpZGFRCsQ7zxnxVn8kgFwKms6Vp5BxR+xx
 PAJyf8bSHwMdu1Op5QBZDuRH3/lW06uA21HeOijV3kp4JOaBZxX1aoshcXNx5DeQAyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D81A60606
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B2B9CDB3; Sat, 24 Oct 2026 21:17:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:16:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bba532f22db45b7b3807e139ff78cb52349ae52
X-Git-Newrev: a2466c7013051f6030bec5bee80cb6fcb9ab7e8b
X-Patchwork-Hint: ignore
Message-Id: <20261024211727.D5B2B9CDB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: remove configure option
 needed for CMake < 3.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2466c7013051f6030bec5bee80cb6fcb9ab7e8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In 2020 the fix we remove now was committed with buildroot commit
6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.

Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/domoticz.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..498ca232f4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -22,9 +22,6 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
-# Disable precompiled header as it needs cmake >= 3.16
-DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
-
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
