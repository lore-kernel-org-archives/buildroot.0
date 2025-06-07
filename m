Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E7C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 15:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3CD60E3F;
	Sat,  7 Jun 2025 15:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ji4_zPdA-vnH; Sat,  7 Jun 2025 15:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 171EB60B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 171EB60B70;
	Sat,  7 Jun 2025 15:32:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6FAEC8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C07D381011
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD_Uiwzk83-i for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 15:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C66180F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C66180F45
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C66180F45
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:32:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1673890938; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Jun 2025 15:32:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uNvWv-009Yx9-2n;
 Sat, 07 Jun 2025 17:32:21 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20250605074108.209337-1-kadambini.nema@gmail.com>
Date: Sat, 07 Jun 2025 17:32:21 +0200
In-Reply-To: <20250605074108.209337-1-kadambini.nema@gmail.com> (Kadambini
 Nema's message of "Thu, 5 Jun 2025 00:41:08 -0700")
Message-ID: <87tt4rbm9m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WRkIdUet6DkZmyZgMxYPdUtVTn9jfhQEyNwwksCpiaUoMGHyVcaOMP+DigFYtHJyM5/Pbkrw5MNKXmOt2mfbTnaA4WJpy9bREqAraMkuSVESZCeOyP4BM2HQ855Id/4qtt52ImC9oZifGZrWhJ3+j9uvuki6MdPPAl5MZTBsAh+zpgO/0Ev6FU4zKBGp5uMR09vUYZF2p02r9vxiQ4X9HOQHbtDNawF2k6kPlIzvLFRZ1PLXvMxxc/HoHcyAVHypa5uFvF5+dP/u68X9+FBUR6cMjP10LGFC9H+AzekLMRPfCPAhJccBTGbDbUkU9CWMdF81DRZM4Pg5QfKmoPte8A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=F8ryEZN68uSndyeRYvTVN94lHLwwB5E1on5Q39N/Va0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WRkIdUet
Subject: Re: [Buildroot] [PATCH 1/1] package/jq: security bump to version
 1.8.0
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kadambini" == Kadambini Nema <kadambini.nema@gmail.com> writes:

 > Release notes:
 > https://github.com/jqlang/jq/releases/tag/jq-1.8.0

 > Fixes the following security issues:
 > - CVE-2024-23337: Fix signed integer overflow in jvp_array_write and jvp_object_rehash.
 > - CVE-2024-53427: Reject NaN with payload while parsing JSON.
 > - CVE-2025-48060: Fix heap buffer overflow in jv_string_vfmt.
 > - Fix use of uninitialized value in check_literal.
 > - Fix segmentation fault on strftime/1, strflocaltime/1.
 > - Fix unhandled overflow in @base64d.

 > COPYING hash changed due to the following commit.
 > https://github.com/jqlang/jq/commit/9afc450930b19ca179e6ef4e744853a94a7b72cf

 > Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
