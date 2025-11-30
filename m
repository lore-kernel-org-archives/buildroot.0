Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA29D116F3
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 16:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B478084A;
	Sun, 30 Nov 2025 16:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROJ6iR-LsJi0; Sun, 30 Nov 2025 16:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354C08081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 354C08081F;
	Sun, 30 Nov 2025 16:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7089219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FAC40A0D
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8l3REI_eALv for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 16:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82BA640A06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82BA640A06
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82BA640A06
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:44:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2099062265; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 16:44:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPkX5-0000000EGRe-31dP;
 Sun, 30 Nov 2025 17:44:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251118145303.2215064-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Tue, 18 Nov 2025 15:53:03 +0100")
References: <20251118145303.2215064-1-thomas@devoogdt.com>
Date: Sun, 30 Nov 2025 17:44:19 +0100
Message-ID: <877bv7ii70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WFMlv9n2WI44d4sXlmwA/afAQ4F/Q7nS+dysHzAr4UBuII93SU00esd2TEbPmHwX/HTH9aTjHL+/UQgBxKREwoULdOOX+KUSohqA+xAfPHN4LmXpw1o54aDiHp0spgHDxPg9d+o78UEVfkRhOTf7RP1510xcbHuY2/pD5MjCRSVl10tEDtiR9P0tueZi2RcHLDb2n2QG/0IfkkVzYbbW9Nkx2PjXH+h6dPkVVkYxwQXBuDwW8zUbNv/83CFhgb7AbUeq4pp5oZVHYGZwKJJ+RwIbHohmQbfBQR6lGu0oaUB9li46oqzPGgtgV02wkw7EMLG/+YUrnpTKyGwZYi2IGw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=VSA1LfLjyhu/IAeaN6guReEDo4R3zRpXw7UkcBN8u2c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=WFMlv9n2
Subject: Re: [Buildroot] [PATCH] package/yq: add new package
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > Version 4.45.2 was selected as newer versions require Go 1.24 [1],
 > which is not yet available in Buildroot.

Not yet available? Do you mean in 2025.02.x? Master has 1.25.x since
September.

Sticking to 4.45.2 is not really nice as it apparently introduced a
number of regressions:

https://github.com/mikefarah/yq/releases/tag/v4.45.3
https://github.com/mikefarah/yq/releases/tag/v4.45.4

 >  package/Config.in    |  1 +
 >  package/yq/Config.in | 10 ++++++++++
 >  package/yq/yq.hash   |  3 +++
 >  package/yq/yq.mk     | 13 +++++++++++++
 >  4 files changed, 27 insertions(+)
 >  create mode 100644 package/yq/Config.in
 >  create mode 100644 package/yq/yq.hash
 >  create mode 100644 package/yq/yq.mk

Please also add a DEVELOPERS entry for it, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
