Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B7E7FDDA
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651026071A;
	Mon,  2 Feb 2026 21:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGVr7caQgmiF; Mon,  2 Feb 2026 21:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54348605E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066203;
	bh=Qtt86mH4DIoeRXgmHKdXk8mL1hOreQCuXlLmXnB5sl0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxtGRysOwIVhdYWQkIyE7EDCDmVceqLBV8Q903AZBGzI4GN4yVEtdmUjx0waWTu4y
	 qjfUHgHeZ9xz2lDH/Skzo42pKjqvLK+hJjBxvT1Yq6kKgi/DdzlqAilcac1F2PnE7f
	 hw1b546GU27iv5yJ9XmhvoCDVsMuZe5+gMhanaLb94pDAE1rHO932bVWdnVG4mq6E1
	 S2V2zMYcSA4awvZsQVp0dWhQHUEmTfLBOgXycn445/KsN43pefEw9Hjnxz3qeUM/IW
	 2EDSMOwaBPJ6FWlcoqQp2N00W38wpGt2d0iZMECCnYeUWiP3LCuNQTe2YtFy0SRh7W
	 K6veeoOPZxgiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54348605E5;
	Mon,  2 Feb 2026 21:03:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB53149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F0D82C5E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWOg7ys3l-xm for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8D4D82AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D4D82AA2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8D4D82AA2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:03:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1114226231; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 21:03:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn14k-00000007dVf-0rWA;
 Mon, 02 Feb 2026 22:03:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Marcin Bis <marcin@bis.org.pl>
In-Reply-To: <20260110193254.4079274-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 20:32:53 +0100")
References: <20260110193254.4079274-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 22:03:13 +0100
Message-ID: <875x8evoxa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TIqqsTW/ub12SWJumfwhrWhbAf9dKLm0jKPcP7PyGUjHIPpCc/6jkpSyPzC5KwqqpayGJvhy9ab8Kv23I2PpClLX94/XekvDDIdGF74FOusM3yRTdi9G+vDYEQv4U9aBT3827jhXX+x/qBPTD8NSuIQ6fdsdpccRAaXLAbHau2O/2nN+PZ76o8msbxhNZNQy273eDTMdSxJSAP/r3Vlud/k0Gc/t1esu8/JgghRg8qFseAvLInk7Kn11AFBkhX89IPNuD+4Rg38rF/KnNucQQnpywSCOzNYy/SRH+SA/hCItaDYAnURLPsFbYtddO+5ojaOglsR4WTHfE1IKDVQXgA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=HpG6LeaW1qD/BZ9NSFZ28Tl84eVwamgxjHL3tFJETGU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=TIqqsTW/
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: needs MMU
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

 > Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
 > version 0.79 that includes upstream commits in version 0.72 which make
 > use of fork():

 > https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
 > https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2

 > Fixes:
 > https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
