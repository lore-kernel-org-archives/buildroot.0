Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6025CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFED0606D6;
	Sun,  4 Oct 2026 16:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6p8laW2LMAVg; Sun,  4 Oct 2026 16:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EE91D6065C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130466;
	b=IFV0LByllXFm75RQq469sbmnpFLiBvrLVcPksq/oliurqhBT6lw/qfcoH27RD/Ko7yVH
	 TcuzcCaplyq3Olc7gJ7dhuBsxhfLbj2nLKDxBjw4Q7XniG0spyPLQX5p8PC5YmIhJr0O8
	 Su7xZvhMJIz+WMN4iFV4klpzph73Nq2pxOiiyz36ntrc6dPB8uimwFgmd6oF30IsUJVXP
	 JbbtzSvQ0ZhOZ16wFUEdgH3jxKrLlpesoHKH/ckTmgTfvQ9ppI/C4bunBsCRPBghIFzUV
	 E4A4FV2YlVXy03rZ78AEJ5uhGxi1sIRdQ/TlE74MprlpRj61HjEQ5PqNZUS3Kz4aAjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i0i72Cb23KMJqZj1zTOnHZUHnHMVReg/yerrFECbm0c=;
	b=K8ASO+3T9gjjMIpgJmEx8oRVQnOKWaUWbLBnsVbG7PLHPkfdgAn+eXAvG1CC5j9T/hdh
	 8Zq0l9erUNM9OGFXDB0v6ji98bKgcF6KJhTl3I4jsZAOrwzGNqhK28FnetMJrnJpElwhO
	 rIfppFGjdM9bOwCHdDktRgDjYn/kZ627FspB5lRUlOx4A8pPs6sQ/j+VYueKAtJqH2wsQ
	 6NBjZguLqtr1vgD6RWmTMEGwPnnO51YxVhyd7Tm8Yhj73wvmXMsKFZbtaa4ORjQtzZfZz
	 9k1S4yZE+2QWmgQPS9J5vYVGz3ByozK4V01XRGkAHzENcG3quQiMCvh+M5GxGjn696Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130466;
	bh=i0i72Cb23KMJqZj1zTOnHZUHnHMVReg/yerrFECbm0c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJTPFyzqIgDahVKzeBJyRUs/WKPvM9BLpweJg2p5QHfbUM2nCal6z4JlCw8TnKywj
	 xWzbuI3mQp3Si93ihqcJ+QDYXvjkv8RRmpP7f2r5Dn0KknUYSYgEmy9em5PzgEwHj6
	 tg84RqNZAzYaksEKCxHWbftakOgW/VFfu3tfJCtlFIbf8eYlGsJf8BUDyzluB82/VM
	 QwCLbRlr+xnT7ROYvvHyKlqIf6oqPJsZWwH/jGr/DRYFYSYJnZ5wN3FJFoxWGJtQ+p
	 Kn7fhkEa8eSvcbXy1EluSqZ//IC0NfXASZIQuuPw0QdqtaQI9GF+OCekm2f7kTb5oe
	 OTq3jWw1RPFWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE91D6065C;
	Sun,  4 Oct 2026 16:14:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1C334E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FA62406C4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M_QpREHAYpx for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 54F78406C3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130463;
 b=r2OAs3S46SNeucIRcoywd6daHJrG6mBNwrXl8U31lCY+l6+GdDgv9cQdKcUiFu0inCjh
 OQ4iLgkJPenao92jbWtjszTu4NGvOYRzYw55K95jjfvgexbF2BE4vaYHA17Le2ZwVOApu
 V8RLpGRtTMN9Iqw6PCnh7hbvRklS7hLMGyM3bBqoUZcDH+NMm62rY4I3jjXweGAGDGx4F
 puEwaJBwpGCs31lwFfGV5YsTVWjE4JCFvKZCZ/8B3uGZ5ay65mUW0AmhNBE/L3Cjd7aBC
 aLOocg0vj4axKaEmFicKYiiZuA2w10QR7RWLQTNCp+HbVizv+lOo84srpqQrCgH97Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130463;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=EgBMi2dAiAigUNOcb45TNOsgXHVauo4gRm0YSENkKqY=;
 b=JXNjp7h24m2YPOeTklshcGw8PTs94tqhXUYNmOc+Jqkha6sfIbc9BXTCeHn+H0vMyJ7U
 g9swScCCmVeBDlG9TfwlovUOilNnEZhKpaz9iKzk8+AvCYSIWOf+aC1LlmBurftXpfBiL
 BUEZjuhQXupqjFObPQL9Vg/ozCBsLC4Lin8D0hbFlFO7VDrPghveSbIayxoXUfmqV2XOI
 utsUtC0C2CxYmBjN21RIaZ/GffaI7U8QQvULmA+iuGQr2B+EAyHuJHx8ezJjfDDvaUiWw
 cjwLbpAXhKxqqMtH2eCV17Sb+NVI/JjDHTFuNCvWrKIVXq8GgG8rzPLYfvRpUhuuZdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=dZe0evvt; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=dZe0evvt
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54F78406C3
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=dZe0evvty38rsiZ5wgIOOasjq47SGbnQHLdkVopzMUMGga+y25XdQDtN5sVBemOKt3u05/Oi1ZEv9gCmkk3XwKPnpUcSs6M0XOMOu+gPP/FdVngtoOGCjHsEW5eTlOpmwxL2GfljcMcQ8NMIbzSy+9eMjKsVL2lBUY2nXClh0a+mJx0SAniWq1R0q1JXa7pvJKlVzbzeWVlSlK1ZR858H8o90D+kNsnt8e0mJKTMHOW8cKkDX6LarB+9conHEGvSIWFY8SjOOOL4hcWNkyV15WMfGTxtv3jsG9KFW/jCf1l5tM+0J9hhrLK+sEdoeXGcJFsD86gsI4CLTrvnNoHX3Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nMVKcfoxeG0SlZLQf/qBW7AxN7X55utaP771cXR0a/g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1582391185; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Oct 2026 16:14:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDOqt-0000000CgHp-1cHc;
 Sun, 04 Oct 2026 18:14:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004081151.3091813-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Oct 2026 10:11:51 +0200")
References: <20261004081151.3091813-1-bernd@kuhls.net>
Date: Sun, 04 Oct 2026 18:14:15 +0200
Message-ID: <878q4dl9yg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump version
 to 3.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/esnet/iperf/blob/3.22/RELNOTES.md
 > Fixes CVE-2026-101283, CVE-2026-101276, CVE-2026-102253, CVE-2026-71217.

 > "The iperf-3.18 release notes were updated to reflect that a code change
 >  in that version addresses CVE-2026-71218."

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/39ff4c67ae5fa8383098d8db23dc57d5cb615fa3

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
