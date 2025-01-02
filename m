Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EA0E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 13:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30901605A4;
	Thu,  2 Jan 2025 13:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8x_sVvzPLycc; Thu,  2 Jan 2025 13:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB9C6066A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB9C6066A;
	Thu,  2 Jan 2025 13:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C5DF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E589D401CC
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aylLJu49RD0U for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 13:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A386403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A386403B7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A386403B7
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:24:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1687171764; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jan 2025 13:24:49 +0000 (UTC)
Message-ID: <1099c0ff-2c84-4153-84c3-a48f6b364d93@korsgaard.com>
Date: Thu, 2 Jan 2025 14:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Buildroot Development <buildroot@buildroot.org>
References: <20241227153522.3076932-1-peter@korsgaard.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241227153522.3076932-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LXEW7rtjv/2lJvB6MVzeCkGBD+ZsdK/IJ+aodbhbdcNhO3qoGZ0eGCIUBe/aesh9NO7rcy4MIQ7SC0vrY5uyyXV9vMmHX0bgZ9VdHIqfNKVys2oPpvZbYAY3fUC8aKDX0PSWrgkfCGgxJIAqN5HHIojvz2fBr+sI6Y9T3cl6ohQKk1bFakL8n7Z/Fa9QrOITbNVa7YnRzGYLAPbgOevy2qm+a1o3c5nl8RtSX0v0IAgJaXboH9rK2l9AjkEnE0JBB8Qb42GGT7lUawecHZTO2dxTANv967VwOIwf9IY+trHfmZVg31rhHSHqNAUq0lMXFiLZ6g3NU24Y5A3v562MEQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=MJaRS2hmeL7jqlAQau3oxcGe2/QxGld/HeEFQ3q5bKI=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LXEW7rtj
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump version to
 1.22.12
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

On 12/27/24 16:35, Peter Korsgaard wrote:
> For various bugfixes. For details, see the release notes:
> 
> https://gstreamer.freedesktop.org/releases/1.22/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed series to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
