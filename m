Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D10CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 14:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA44240A06;
	Sun,  5 Oct 2025 14:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogdTwqeKfhY9; Sun,  5 Oct 2025 14:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8086406FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8086406FB;
	Sun,  5 Oct 2025 14:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7293909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DBE260DF1
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFE-r6QSd_mq for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 14:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9284860E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9284860E01
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9284860E01
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:51:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1064570061; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 14:51:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Q4z-00Gwxo-22;
 Sun, 05 Oct 2025 16:51:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251003201301.2430282-1-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 16:51:17 +0200
In-Reply-To: <20251003201301.2430282-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 3 Oct 2025 22:13:01 +0200")
Message-ID: <87sefx1jx6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OptCBFkR5feyretASxCFKtldKoh0vv/B4OAtP1wwTb1yV/92pNLWWY1hrC5x3puACda2jaFi7lkalrVVv/t+rw+wvPj/SmannAY3YUTYQwRffdpP9MQzFsQS4/alIPkHgu6poownb0QtVQegJgYJxVzLLg+6GZ/AVsB/rLptgSCh9AaOwEMjNPP2SxFHshKtYp2xoxoEanvPK/IkeM/MmO9+3u44kms2si+FxFtTuapun+Wu+23PsycTTjHQHDB8GXvwSii2dioCY+E5pZpNgp5xlxiNM1Ro3KG7M53phpE61cljv/joSYrkHLN5utvJIZ+D9Scx+KUitNLPDcA8pw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=c+EvbhBhtMSLXutAikdPwj5RzEwSOlGzbVpOvQMw3bw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=OptCBFkR
Subject: Re: [Buildroot] [PATCH 1/1] package/libdisplay-info: bump version
 to 0.3.0
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
 > https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/

 > Added sha512 hash.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
