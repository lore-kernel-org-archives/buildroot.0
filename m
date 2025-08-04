Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A23AC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F64606F3;
	Mon,  4 Aug 2025 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8wdRXn7lAeP; Mon,  4 Aug 2025 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B64607C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B64607C6;
	Mon,  4 Aug 2025 20:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1288233
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1F1982374
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZZmLQ6wzLIM for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:03:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D329B82372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D329B82372
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D329B82372
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:03:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1537697532; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 20:03:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj1PC-00BKaW-1l;
 Mon, 04 Aug 2025 22:03:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20250804185159.3344978-1-bernd@kuhls.net>
Date: Mon, 04 Aug 2025 22:03:34 +0200
In-Reply-To: <20250804185159.3344978-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 4 Aug 2025 20:51:59 +0200")
Message-ID: <874iumluqx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FJ/0Qn70hl6j8hjtVI6uGtCk5XTYo2YHQQ59pTL6AVh/Zi8maTyoUqRcmZvMRD6MQTxbx64bLIRENiCMs2g5YN1rIVPJ0lAYXlnu9xoSQTU9sQrE56S8lvkQF8lQuhT32d/6eIDv64WQe1F/a78EZ/Vvpv/G0FBDHPPIzgbhzhIShvfI1aznL/heXS/DVWhfd3xb+hkQhJjTuic3uNdQxCi4DnEmLOc3TngVsrVoSv+5Ok0yOi1zBbYpUd3k4a/zV2Ri/Mznx5xNKzCFWqkcr5T6qRJ5o68otvFsFHc4MsyYz/LFAn60vfYTmM/UFIN6q4yQaoI63xb1rv8PbJ1vBg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fdZbQd+ILUwWT5fFzrQVY/s3D0evh3VlG/YsYHa6udE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FJ/0Qn70
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.29.0
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
 > https://lists.freedesktop.org/archives/wayland-devel/2025-March/044026.html
 > https://lists.freedesktop.org/archives/wayland-devel/2025-April/044102.html
 > https://lore.freedesktop.org/wayland-devel/20250731092534.GA4100432@quokka/T/

 > Upstream changed mtdev into an optional dependency:
 > https://gitlab.freedesktop.org/libinput/libinput/-/commit/27f4b0ae744a2b2655755188f2224dd5f8c4bdeb

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
