Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6210ECCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 12:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AEE83F0D;
	Sun, 19 Oct 2025 12:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGUHqt8EIJfJ; Sun, 19 Oct 2025 12:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D0183E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D0183E50;
	Sun, 19 Oct 2025 12:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3213243F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7A540A91
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tXSesgkUvDl for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 12:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A47840A78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A47840A78
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A47840A78
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CC92478035B;
 Sun, 19 Oct 2025 14:05:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 14:05:25 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 14:05:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251016182638.3397027-1-bernd@kuhls.net>
References: <20251016182638.3397027-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <42f1c7ca58da53fa9d6fb43305ed87d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760875526;
 bh=AO60Ex9/k02AsR5SSkkzpd0Lb1ZJ3Wg+Sv4A2JroOnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VYgSl4HdpW5pSMuam9H5F93E5SK8zm76GEsiRDSuO0vAO10h1T/j1UJBEZNMz6MHy
 XMvwcN/0TGHfRfwk7jRemgx8CxThWFwtyidL02jZ6Sn+MmQ8nzBQRXYV8xaZy577m0
 zJdpK+UxcYUeaeBGNsOFSUAlmxGqrfmQfMui0hXNrem5CQ42WS/JKTeky0MmQxnNw2
 W5uAnQORk/ZvwnCzZ+2MVAScYL/cA27piZF+XQ9XO5qYO9OU7mOLGTb+i2aBpq8Fmo
 Dd28LqrYNr1XbigzvG4+C5kd3Y52bMHF54qqj8Qmu7AnGAd855HrAYJK1/oq8pUrgM
 2cGc3xVmwnG7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VYgSl4Hd
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.2
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

On 16/10/2025 20:26, Bernd Kuhls wrote:
> Release notes:
> https://www.samba.org/samba/history/samba-4.23.0.html
> https://www.samba.org/samba/history/samba-4.23.1.html
> https://www.samba.org/samba/history/samba-4.23.2.html
> 
> Rebased patch 0001 due to upstream commit:
> https://gitlab.com/samba-team/samba/-/commit/7a4c8d6f84cabfe9d27fcb795a4030de93a1b8cb#8e3d715f2e6eade6c52748fd46ba94a12e2cec4e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
