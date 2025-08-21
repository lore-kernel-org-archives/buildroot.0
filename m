Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB91CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D3C0843FF;
	Thu, 21 Aug 2025 21:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOR63-qcTmQv; Thu, 21 Aug 2025 21:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 554E98434B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 554E98434B;
	Thu, 21 Aug 2025 21:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D19991C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED0484254
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRsBCBQ-In3M for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2E82842B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E82842B5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2E82842B5
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:05:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1294810109; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 21:05:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1upCTM-001GTU-12;
 Thu, 21 Aug 2025 23:05:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
References: <20250816195542.3748-1-fl@n621.de>
 <87bjofm36c.fsf@dell.be.48ers.dk>
 <20250816204354.sdds7hpjzb5n7bkx@n621.de>
Date: Thu, 21 Aug 2025 23:05:24 +0200
In-Reply-To: <20250816204354.sdds7hpjzb5n7bkx@n621.de> (Florian Larysch's
 message of "Sat, 16 Aug 2025 22:43:54 +0200")
Message-ID: <87plcol71n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LnZ801uRUS/AOld9j5a+JfAmAx9GNCcjey7rQlzhcGkHsD4+vSBkpG6lx1HMCbt0ZxSE/s4YaYd+mb8BjMPOtecpVs7zrKrTvY86yLYuofo4GNnmR2zf1gtsENPRCi5qgV0em9pbe3I7dQSDD7FrSX2o25vK1rWwk192fN7lODwbN5gqxiMjgFYw9o6gXq19MkQ+9txoVdD5F3CDnkZ/quMtclw26AC89yK4285w2GP9bhKV5Ut0fT3pzM1FZezyoFGPcn2zgLITVc/vq0jhX6YdIrAar//uLMB4uOcgolhM3Fe55vLk9Nh6oSTWqeTcB2RElDa6d1CU2qUiybFJYQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=A+c2jq1wnCSDho8n8dLv/uNFkoGMsPJII/iA1vkXt/0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LnZ801uR
Subject: Re: [Buildroot] [PATCH 1/1] package/libjwt: require openssl
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

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > On Sat, Aug 16, 2025 at 10:17:47PM +0200, Peter Korsgaard wrote:
 >> While it can work with the combination gnutls + libopenssl, would there
 >> be any advantage over just using openssl for everything?

 > I've been wondering about this as well. It seems that applications using
 > libjwt can select between backends using an API call[1]. There don't
 > seem to be any feature differences between gnutls and openssl in my
 > cursory reading of the code. Furthermore, I could find no public use of
 > the backend switching API beyond libjwt's own test cases.

 > There seem to have been differences in feature completeness in the past
 > though[2][3], so it's possible that this is vestigial and/or the author
 > doesn't want to break existing applications more than necessary.

 > We could remove it from Buildroot entirely (though libjwt will still
 > automatically link to it when it detects gnutls in its sysroot via
 > pkg-config[4]), but it also doesn't hurt much as it doesn't enable the
 > gnutls dependency itself, so the overhead just is linking another object
 > file into the library

OK. Committed after dropping the gnutls support, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
