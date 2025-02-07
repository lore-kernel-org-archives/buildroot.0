Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B19C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307DE60A93;
	Fri,  7 Feb 2025 21:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jKTULW5Y8LC; Fri,  7 Feb 2025 21:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6131A60A68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6131A60A68;
	Fri,  7 Feb 2025 21:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85876CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CFB340224
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OHqLsZSnfxz for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79075403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79075403FE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79075403FE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:18:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F068C2003C3;
 Fri,  7 Feb 2025 22:18:36 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:57678])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Feb 2025 22:18:36 +0100
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 22:18:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20250206191710.8607-1-nemaakhilesh@gmail.com>
References: <20250206191710.8607-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a80d4e1b9668469691ef1cbbdfe5ef37@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738963119;
 bh=iwFTWQLXXVKObtZKYQjpCjlu8WfxsGVHY9ll8Iv9gkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HFZneh7Le69sp+ipFNd3ubkn4mQQyWm9Nkz198I91lHONkoOTfDB++xwtt0VvQxeo
 3MND+6lIxLCzsKJWqr78HbKluvS0WXaGcwN1240oFNC3oJ3yQqyqfTj26dfh3RlPKw
 B2yR0HuUVWZPTpaVvT+/SpI9QuZK2xVnxjZ4n7WXZD4Oj3jafq11l8c6xR1UjyqBf/
 mR16Agfhgv0B+MJO5XvSoHr71QB0NTz/jyt/vn0oL6IL60J4xY8/vvTVQzJfG2wEfk
 wirj6RRlSepyX7dryxFkO5uvmry8mk0Ljuiz2RvD73gT4rt9EtTegK5Xs/AQSlaliV
 HVrRDbOD8uszQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HFZneh7L
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.29
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

On 06/02/2025 20:17, Akhilesh Nema wrote:
> Changelog - https://github.com/pikvm/ustreamer/compare/v6.28...v6.29
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
