Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C6CA0FFE
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 07:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F6478121F;
	Sat, 30 Aug 2025 07:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZ_LnvJqXsUX; Sat, 30 Aug 2025 07:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B2181211
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B2181211;
	Sat, 30 Aug 2025 07:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7F6FA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1275440808
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVXo5U1k_ONS for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 07:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C794940806
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C794940806
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C794940806
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:44:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -756296322; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 Aug 2025 07:44:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1usGFn-00E0mm-0W;
 Sat, 30 Aug 2025 09:44:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
References: <20250829165238.3082564-1-peter@korsgaard.com>
 <20250829235308.18037377@windsurf>
Date: Sat, 30 Aug 2025 09:44:03 +0200
In-Reply-To: <20250829235308.18037377@windsurf> (Thomas Petazzoni's message of
 "Fri, 29 Aug 2025 23:53:08 +0200")
Message-ID: <87wm6lfe4c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=W8nWVLXW7/BCkmmCApA/5uk/7TQSmMRibx8aDYLpcn3vx64hz23ge0UAjZlEq/+wY+dfr+kj4rqKz19veDUFevCw5sajl5qHqsZp2fZD7Qh1hVRbdSUW/6Hw2WMYalAglshqqQ5q4U0VaIKjZAwFlXYyeeDGjGzNWdvVBotPAMFJc+xqG9HgqqmChw+3Hl6MqGtTmFEt8le/eDP1Bgjg6YD+hhjVBQsXuHwiFidwaVeCWXKhwgOdbdMamVE3TGhFFSxL6YyXJ4Mq5G8+49/B+S7/5Ga1mR0RlNPLs5yL+xfJ+jptD6we/2EPNqVhsYvDPt/IktOBonD9dBY0YUPSXA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zp7MeAzhHrmtTUxQinVkaW8UgOmg0etjkVtBq3/BLnw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=W8nWVLXW
Subject: Re: [Buildroot] [PATCH] package/mbpfan: fix build on musl /
 uclibc-ng
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 29 Aug 2025 18:52:38 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> define MBPFAN_BUILD_CMDS
 >> -	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
 >> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE" \

 > Upstream seems to still be active, so what about doing the "right"
 > thing, which is adding #define _DEFAULT_SOURCE in the source file, and
 > submitting an upstream patch?

OK, I'll take a look.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
