Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9ECE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E7A400E4;
	Sun, 12 Jan 2025 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WerFQxL9RTi; Sun, 12 Jan 2025 11:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD8240557
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD8240557;
	Sun, 12 Jan 2025 11:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 722A2942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5176E6064A
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuR0zSUuGKEd for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72E456070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E456070B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72E456070B
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C6C162003A4;
 Sun, 12 Jan 2025 12:36:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:36:10 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:36:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111184613.2948996-1-james.hilliard1@gmail.com>
References: <20250111184613.2948996-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bfdca3c93ba2b71a935807e9fcd7ffbb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681771;
 bh=DodRoGpIORZlT8Tk7PK4RWjBFg6LPLJwSXXjC4ktehQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KwHh9aRK3ms8/4WXJh0QdCrCQGynD+NBA5JXhK5UyUnyJcjr7KWMaMknGVOtrPx7D
 5vn9EZS2PP9MZ4jYlAZ14CBn6UiFdh0rE0N4HG+zf+5k8hhKYt6a6+7x5w+7TcOPie
 BQhYQeoN/U5BLCmNl12llS10UlYavU0HcJ3J6P5Z7ZmTwETHReJwhEvhHRQn3xQrS+
 Gb5Q+mCP2N14MvEc74xzGfI91UGQ9HjArb9qgG24i8G1WQobotD22zr9mp9+1B60Yx
 R+hMV4C0mM1yPLrSnJ0YqMjzE4zaHhhwWULnvNBrxawV8E3CO1KYSnvaCTY+EnNQhq
 Dw4cE/wiJbHpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KwHh9aRK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version
 1.3.4
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

On 11/01/2025 19:46, James Hilliard wrote:
> Add new host-python-setuptools-scm build dependency.
> 
> License hash changed due to year update:
> https://github.com/thombashi/typepy/commit/974f6c5665c4ff0ee9f030e5d2e89b07bcea2073
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
