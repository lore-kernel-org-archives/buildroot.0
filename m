Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2EDFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007E340770;
	Sat,  3 Jan 2026 11:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tbb2Cy0pwB1; Sat,  3 Jan 2026 11:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6815406F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439805;
	bh=zVd5A6S2+HnlH01wYD2+e2giYVmabOqOXMrQmszmT0I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HzDlsNZBOn/p1QGW+q1URTLSMz6bK94yGgFejSisf2i1n5ozMHk6ue8s7ssGDfGjE
	 5Gi2avyDN4MRc7L0wGM9tByPKdYtK8Y/PYEmybTUJ/lbMYzTVwYZxzc3njKgNqpPJv
	 rKSqem1FeTm8axkPYBX/oCLdTSDVqxofja9bpyMwhdXGIfL8p6XgaEG593wbJwmNzt
	 qvx1SVIOWznCpmfTQwx2wR6lWjitaxBMq2CRApc0CL973tDvPpfiSbTrF30E5KLhca
	 4VTUxh8nf1P0ZyTf1A1ydFN25UkzzhvRW5uxb258l31aVKlfWkSOr/aEhH8ZZu0Y8G
	 psnlESmqsQo0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6815406F3;
	Sat,  3 Jan 2026 11:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 466F8440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2FB2406F3
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1k9EFjY6MDca for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1285440706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1285440706
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1285440706
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:30:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4F8B3780371;
 Sat,  3 Jan 2026 12:29:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:29:58 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:29:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260103010034.713506-1-james.hilliard1@gmail.com>
References: <20260103010034.713506-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7dd97b7d210c13b945ccf5b9d5d3955d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767439800;
 bh=X/PvdYp2uMv4eZ8gscimw9uhN4JqHUnhMg6EtYV+pOE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vCKMq22yr79p79qvgcNDx0iqMTvdqBzIyrfLzxvHJD81yEPa/7xedtHwcMPJFRkq2
 VDzD5JpIKJkmtmQ2e8JIIOI8hymII5CmzX0TlXx5M3nE4lzJJAhFWPQirOvJZwHVzh
 e9xdGmPYe8A3hmh6zR0XrNivkGYChhd7kmFsWqZfu/YczcK+2g1AEx0Hw8sgDdvhUK
 yJj0Vupr0uPrsXF13SUpHTMlzIzy38XUEHZuONIRpGbdyXeh8UWdN+SbyMGVsTobcR
 BQ+UFtMdsQwwV2nu/fKbg8Tl4xveKdxvyEocO7fRVIuSnorIzM0cVXNnNDZPHHi6Le
 K+Uy70KkFXk7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCKMq22y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-git: bump to version
 3.1.46
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2026 02:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
