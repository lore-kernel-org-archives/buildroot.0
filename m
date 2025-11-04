Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56EECCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 07:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737A8812A5;
	Tue,  4 Nov 2025 07:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOSv1JGCdfAN; Tue,  4 Nov 2025 07:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C2C81200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C2C81200;
	Tue,  4 Nov 2025 07:34:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7500278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5EB440992
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TKNZI1mKQsM for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 07:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B95F400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B95F400BB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B95F400BB
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -336723932; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 07:34:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGBYq-0037VK-2V;
 Tue, 04 Nov 2025 08:34:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251103203128.213406-1-bernd@kuhls.net>
Date: Tue, 04 Nov 2025 08:34:36 +0100
In-Reply-To: <20251103203128.213406-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 3 Nov 2025 21:31:28 +0100")
Message-ID: <87a5129roz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MXo+4pvbZzQ9y6rT28PckHxocNzqkeUI5ffqx7SeoKIKOcnJAWMZlo34MuNJbEFFQe3bYByxo+FSdjh7mvDDM02/O9lV8v8i8q+wdMNYD1NrXIcvZZ4zHToy6mcnqud1VRYnTcjwl/4NHFw7kd52CbpXnsOLv0/5aqYjotittr9rTAS4R7HrW1WYXgR2B06mh03D4u91WxLEY9oxk4z6v6DmRo55shTWW637QShBcDtK9JGO4lg0+vAjdc7qN9UwR3KwSqMWD6G5gV38dPARzRFrppdTeAUWPZYNDJ6/rSnHvPQbgxSOm14hc4ERp5mW8vcNHzqEcVnftoRBorBHCQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GMASI/Fsvlk6ADh21G1QzeVK2Jnh/2IyHAtMDfQVogk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=MXo+4pvb
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.25
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

 > Release notes:
 > https://github.com/ebiggers/libdeflate/blob/v1.25/NEWS.md

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
