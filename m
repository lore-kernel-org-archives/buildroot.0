Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBEC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 14:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1C560A9B;
	Sat, 19 Jul 2025 14:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mthiO_5DCP9Z; Sat, 19 Jul 2025 14:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5694060A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5694060A9E;
	Sat, 19 Jul 2025 14:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8EBDA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63997412AB
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-ityU44OcWE for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 14:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9324C41228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9324C41228
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9324C41228
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C46F919F5C6;
 Sat, 19 Jul 2025 16:40:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 16:40:48 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 16:40:48 +0200
To: Federico Pellegrin <fede@evolware.org>
Cc: buildroot@buildroot.org, james.hilliard1@gmail.com
In-Reply-To: <20250718045614.17100-1-fede@evolware.org>
References: <20250718045614.17100-1-fede@evolware.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <a6813f8b41e2a50a3622a48f515a14b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752936051;
 bh=C2najG1PsDym2aNOWJ02oE4MbFDqcU5qfs9TRyiYBls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uFPDRMXkXVJioKw2kYJupF8x0J95jdYMxVG1273JuR1gvyYCrxYPVD0JtWmvY/Npb
 j0HEm3dY0zAPei3VGHcaTKg2X5g+rlp3gsKsxmQPoFBZ6ml0XwgDuvR4PHII+Y6s3j
 TfPJpt7Lj2yBydD+NwK7USeVjgp/1CGqAIyR1ivYQ+eTK2MovYyKR3ilb3i/7sR21m
 lvS+5lr+P6Wm6xmmeEF6OMMujkXe6jq5PIHMk1PeCAq8GVtf9YmfRBp8ggt7DPgJZE
 v9ogS+bKGZttuTiqbGegcQ0zZ4HS51ZJ2dMFHoXpZC/onR0liUYEkwwfbIB0RvTLEE
 fKok0f1C519Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uFPDRMXk
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.5.0
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

On 18/07/2025 06:56, Federico Pellegrin wrote:
> Changes: https://github.com/libbpf/bpftool/releases
> 
> This upgrade fixes as well linking problems to LLVM libraries in
> the previous version on Buildroot 2025.05 and master.
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
