Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E92CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BCA6061B;
	Sun, 18 Oct 2026 13:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9AXNQL1pjNi; Sun, 18 Oct 2026 13:40:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC6766064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330802;
	b=SoJ2aGJ/HQBuAttmZI+uX133vBblovaIUv4NLJUVnpZKpVIJLFz7vlYYKe0rOIHiD2h/
	 oWJ9zqz0OwPlF9ChcOv+gEMjWKDZGYKBvJ9nsgFfpGr5+4oVKKFWJOpbb76/xAqlwSsU3
	 qp0wNRsZFudUh/hUF4brM6CytY2zeNmCj3Eb3dc2PT4iz7XlS18fF6UrDtGeDrSzd8cf9
	 n6GMzX9bmIsvbxBzfR6oH91E9c+H64w7xapYqVfaG33HQ1/PF6Fpnqd5Izd+XC2mWlK9X
	 chXe5bhwzKhH5/F/ls2cNM1hp7lgnI7/IpavFqkJuMQJ0oSgpEkXQsarqs3sYX+Ol4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=WzsdSvsz1w3EE8Z0tKUZD9XKICq1XpfD2clGCPMbrTc=;
	b=LEYDaeNiScV2ywboXbJcAm1x6qv39o8816g92Zri6638Tjn8HyLEUww4pwLkVR9g5abL
	 G5OwSNcGt2ZbHzXd63OKmEyqHtz7ZzOibMChhimCOF+bkLfIoN2Okln1jtBfU+RqXU3bn
	 9IuIwxb51Euj81PSv6/+Log1hapojy+gaiteYoB0nk3A//+0JeUVOOiQyiozKjSqJ2NaD
	 Qs7YDCQat8gv1w0NrMEFaSkyMIviILctV/y1BYh+E0M5nZibhnxz4z/4iEwkfNiG0uzpV
	 dwiTOCSadGSRpZqlSQ76C46UeM+gknf7+WwJYH22OMsmgcKiAFbX2sPeE6CL3rubNUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330802;
	bh=WzsdSvsz1w3EE8Z0tKUZD9XKICq1XpfD2clGCPMbrTc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lm3AFhpa4xlHxA1+SDIru6kTxiR6d7fvCrZ+uailA2VUdbCsVq3TGx8mQn9Q0qadX
	 vfenAKcEWInTX0zeChDpH4lIZbD0/tFCO1j2HSOmccd+v6eo8BLwbRtx7KjyQRROXi
	 2FW7dSa2mfY0nrqqgw9JVbyCxIl+PS8GPmWNo3hEArbyGSflAurVC2RGSDn6Z3HuC0
	 11zABo8o7aziGP+hSJEP7/D7OoIOjQSGOFsTy33Mi/+I+oHQjCK1oKZSvbPRVXSixo
	 vY94OLdZ97kt6ducblfrbgk0HatH2VWo1yrHgyRwas+hxH8QfY+zjo3Ok1wDKUvwFo
	 zXHMpufMXea0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6766064D;
	Sun, 18 Oct 2026 13:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ACBC255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31221400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msPup9qwwIuV for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:40:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 457A44005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330800;
 b=IBQClI7MKpU5ks3CJPlyRhAKa9dF8PlqU7VWeg8jj0KagSQ3c5bdRmh687SiC7qYh2nl
 7GMaU1qZcVAZU3L4AzOdjpEYBmnDvzI9unav4/6X4ur0T7JRcJm0pVfAQ1X6eN1Uy/KdX
 7zuhrzQkX0ADWdtNurSycehZroV/C85cbI+0fQfQrCa1BKyGkYxOcPmOjhQS1HAr72Ksz
 Rd28cFYX2/Nx+9pZdJlhkAs1Nkh1IQkSrJRBq+GzxSXEtBpdxVHY71jfjEKJn5bkjikAB
 cEv0pVL9UlTQ829jvs3HiWnasSbTr85bPNA1NQwY+tfEdksGJT29tCYrKivai8dieWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330800;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Ka/4+z0M30NJceiQMEZyQHmNXTHVRw0LFgOxx0VMkZg=;
 b=CQWInM1oK0PSzmGZH5iwOmFcdMnzGnUQaqyp2EXtWIhKVg7/NdZPiFWAV8/dsQeOwGLf
 WROcjapHm/oPDANO07b0Uj32gfWzsiAnnSKbvM5uN0dKZpVr6BBxmDz02FfIpHEkq4XS9
 yO3F5u3AiZL4DsppesATk9lcOaStolSq3chzilTY8zASO16dQttcdacNrCOZtxeNsjQTY
 T5q1hD38xUe3U28mWjDG0gj1K+6psU9OQzvDBf4ccbJARLtVla3tJd/xDgzVkKI5wt4E9
 nR/gMAPJuPWACAehS4+4p4iLTuo3iMblxtL4uIPTmjYlGB3ZITZnCSXW7BDp++bPY6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oiiHhHtG; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 457A44005F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0901C2003D0;
 Sun, 18 Oct 2026 15:39:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:39:54 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:39:54 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>
In-Reply-To: <20261015070812.1059968-1-dario.binacchi@amarulasolutions.com>
References: <20261015070812.1059968-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <71a6995fc1eae65280b926394c0c9181@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.189
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

On 15/10/2026 09:08, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.1.189. The size of
> xipImage has increased by 9286 bytes (1706592 bytes compared to
> 1696766 in version 6.1.177).
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
