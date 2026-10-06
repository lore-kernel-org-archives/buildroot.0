Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FFFCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7175580EE6;
	Tue,  6 Oct 2026 19:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZWc87kfjFEN; Tue,  6 Oct 2026 19:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C838580ED3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791316621;
	b=lFV+cqennARXsBeYLhzzxnu67wJbK8A/FNUj/9PMwEn1Dmq77aJfFiGNZ63nHDJk6fcV
	 PKqFr7qqFFhob+pE+rC/OFCb3vlUIhcdn9cOecyxESOZDWED30ZgiV89RoIxmp4fi9A20
	 wkPgNKIYu/GG9iPtW8cxVhXYpzJmpFPbXybl6emq6V2RzW04fVRTarfxfojJroxZADypk
	 XdnM8oV0HTGN13ViRQQLbs6Ef/Ymmj3wpV0gzTigqQmYujC/G8kk1YJlgYEACs0Dw9pCa
	 ADc9zhJzzPBLYhdgg1fjGcYzfR83xIj8rBAObllRLA/v+wC0vSGq6wsJKg9Kao2HvqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791316621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Na9feB6RbafoK+trWIJIz67lR3y1vHmTDITseFlFui4=;
	b=Q1oAdAoJz93WIEF1xWdLKWvvHIDc7KQQ4X8ED3+pLCoRaVy4Bf8KCLCpdPZ3alaFpKmB
	 YVSZGM7ga5OaNefWVvESrPD2pYhE/8Sc995g0eYnORKQ+x2QNHL1eEmAo3/RtEjPvPfzh
	 +xXEz0GiErpOHY20VaXb3jNgUMMcqQeMXdOrj97/J4nXg60N0NPlqzorHkWAKFNc0MXiw
	 Svr4m/GuxsJ4V4JT8ak7ObzM7yf+4+P04p0sY4ebuy7KsGhcpW8N+DgcWFhh1mTJmzY1N
	 Mzmx9WBQ1ivwsIgIfJHsWshoUOl19uKZhFWc0WqLAEQrgF/ZnoMc6MNBUuJT237hipQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791316621;
	bh=Na9feB6RbafoK+trWIJIz67lR3y1vHmTDITseFlFui4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pwdE46NKAY72dqPFPzo286U4NpiEsXLhAQ5pLn9JboSz9hO9z7cNSkBT1lKL9j+Yh
	 ZKeK0yW/kGMjRj7CWKVSZ8Z/7dkMmb21K13A0qH7jozey/teUetzz0hBPk/yxd/o71
	 /Bb03TUW19xuIjqFzX7mpK8QiuJQI02KcY5C2SJFjrNJzn0xBQNvCbsVFo9QaTV39Z
	 Aw70i3wfWMNWa7c5Wo/wpZmQHpURuelHfH7EnHk+HtgQEDeXQhF8cMhYr7pp7H/eMq
	 nSLQFIZFqwQMcLEdIAGRXztXH2WnC8znM+J3pUC6O5UOQ+TVWJPrFluzWTk1erOvUW
	 gf6WlMDGDw12w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C838580ED3;
	Tue,  6 Oct 2026 19:57:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69AEC22B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F923402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvuxGN06uivL for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6B07B402DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791316384;
 b=NCJZqhGWLMLYPM5eAR0RTv/kukUa0CPAMaUSBv1Dqu+m0OW/R9CdqDHDO9kvlX5eSxKV
 xysEZZ43MEPCKQLhreQ0g7qJx7FOfvAz2pjh+XkQ9K+kXXzaXSh7vzMINyRS3y7WWas7Q
 79EriZz5QYgu7Rbc5cFhnytxk+4I4CyNJkFmnvyjM72k3NsB8nkny+bl1Pt8neIkCu1vr
 BYlKGEyrFRk/Z7NHXI60AufpQg5+k8etsruegKK4Y7CFbejSULmr8IMZSJFfcuJM2SZiS
 kDcyCi3YJyHk/Lq2wE4lCjo4bp7h0mAGVFeGI49IIT1v32Ch45/GUmHWCZGxsR9eq1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791316384;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=dpZMuVdIzvwrhttOLtVdWGNI+UM2I/ZyWPcP/qa6TKU=;
 b=hIw5KceULpPoVXRc7lCEh4Ql3vqcivlaUTfGSyRKKXzidc5RHQCk/c+GRcTBsL3ab0uy
 nG6MeBQTzbVsgptpkRZzZD7xG2QjUNbl89CpvXgAmUVfGn6NfoSoxJc+CnESZNxeaYXOm
 zZjR4IgetlqF0lbIY4tz2WFFaHtQLxsyH4PmCdPdrcnQom6kFz6I1Pw5EXGMM42dg4StR
 tNwN52i7+c04V4/IM7bXUhArA+M1TT6BDG5FKWk2kOia1OQTDwAXQcVhfGa3gpb2b0eGZ
 hN/84udEt9gQlGgapzEw+sI10zd5VA5aUCfTrxZ7XSaUjWN5IU6hRBM9QffTVkY9r/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UZYSXsfL; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B07B402DC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:53:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 51C8313F880;
 Tue,  6 Oct 2026 21:53:00 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:46310])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 21:53:00 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 21:53:00 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Sergio Prado <sergio.prado@e-labworks.com>
In-Reply-To: <20261006190356.176112-1-thomas.perale@mind.be>
References: <20261006190356.176112-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <f534e3c3e12f6e628771da70abfcecec@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wolfssl: security bump to v5.9.4
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

On 06/10/2026 21:03, Thomas Perale via buildroot wrote:
> See the release note:
> 
> - https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
> - CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
> - CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
> - CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
> - CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
> - CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
> - CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
> - CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
> - CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
> - CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
> - CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
For info, I fixed the LICENSING hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7de1ed77454587fd17077bb724629a0106b06888

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
