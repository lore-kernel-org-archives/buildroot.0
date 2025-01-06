Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF62E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457F860623;
	Mon,  6 Jan 2025 16:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFuZI8mkBI0S; Mon,  6 Jan 2025 16:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AC96062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AC96062E;
	Mon,  6 Jan 2025 16:12:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 115296B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E42B04027D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLSt2S_GGtoB for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C865F400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C865F400D2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C865F400D2
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:12:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -564761613; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 06 Jan 2025 16:12:26 +0000 (UTC)
Message-ID: <41510d83-b1c6-4194-9160-ad3a38dd2ec3@korsgaard.com>
Date: Mon, 6 Jan 2025 17:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20241229202255.1683450-1-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229202255.1683450-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=taqO3NDtgJPN+myPGTHeRhTw5sLjldQoXzXS+IVndWRm4UAq4XZEYjFRkzj73puRW/QRWtqKF5mh0dp0E/jr5UQFG4QNetdfvECWVDaQpKN0cYdVffhcpWA2BbFRq/yAKlwVYCJuOMacktc5KUlRcR26e3enLVhKd6wT5HjER5xTplSiZzeGHA8c2zWKGbGtrLudxrRcoylXQaI1ptn2blZe+1oJ+zEfLG7oYY/K8SkbMVFnANAZpSBvGiy1vbQbjrlvLyJ1YJEXRDlMqaft/FZmxNDgXZZvqtL8KhDikIsieOdEo8WGnBgSM00ind//ZnKXajlmgyOmTFzgjq52GQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=jOboODj61HgTBdI3EACKxoxmaQpm0Y2b1bFmjrUvZfo=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=taqO3NDt
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/29/24 21:22, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/448
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
