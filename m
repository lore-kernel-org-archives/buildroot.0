Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE63C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A643080E0C;
	Tue, 15 Sep 2026 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zTZ6aIzZYXs; Tue, 15 Sep 2026 17:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1A61080DDA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492859;
	b=p1OQLRaTM1dzvu/0lehAzuyeu/Faz9m8zSoe7k86YpHmesDXKBmEmhGrXXPvXx9g38Q4
	 os4MHc6yxrxjZ7OT0H6UE0x2XB5ZHNbQLZpvVAcC/YIG41RO4WiOUc2pjDjBjmtm7DFAx
	 RH2xZILtVkrpDUJJkMpjeqFJjIkEhg5Q/63g+XS4QaJRkgiDksrFkKjMV+eRRYNHKemUP
	 r4bk8ob+15vG14oeIMTh7x7SCijTVo9TaiG8BDJQX+y0dKW/jtuJ6J5Do+BO59pk0Knyi
	 42L52VqntaJhif4PXg9f6he/qQHbdpSLOvalZO9I1w2T5aTAOcUjH9QHM0vslRWIlkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=CEnH0PVg3Rh/OE4W3ADvnd3YojzBhSC+Sfp/JmYjc/U=;
	b=rbvPN0t88IbL01lJmPisCFjiil+xr4AAMLonyyZ2CMNB3HiPU3efcvo6W+YJlBneWOA2
	 qtXuQI+39dR6Cr+lguKvYga5cjLqUM+Wr8Dh1ikpzqRrf5bg2daQ6lO6gjZ6wt6nIrhEk
	 1CovyQ5WkJjd7nxy5jTtM+PjajgfuA1ILblKOibAA8e4q9zE5BoQbP5s0NROoQSwVGirw
	 NzRPnvq5TnfF5cQFBWC1RjgkBiV9R7UxcPfTWUFRltCBERdBVAta6D0FFZ2MbS/s6FVIe
	 e6mrHMWA8Ika2yIcqqd6hBFod1NM4uZEkg4gayCFSKKDyKW5szW1QOzZy8aHtJr9jXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492859;
	bh=CEnH0PVg3Rh/OE4W3ADvnd3YojzBhSC+Sfp/JmYjc/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mIKp4SSJht93SBtV4pMMaAFuf51u1BNFcFlUIPrU089Lw+8UuglsmbW0Qw3bH0g8n
	 m2YdgvfxVVEwSuylF0h7Q7t4dcf8lEQymCNJ9GpzHGls/0NQpJVqqnGzqmTdGCLbD0
	 YQS2R/JltTX2iwYyT5U6Xtdx4OAZzAihpG730VGA7YVUkUr2wkzL7GWwIwmaO9tOxU
	 D73XSYDcZvbOdwafZ4fqDrAFHWEKny+6d97t78pNpbOJ4WebdfXlQLRAucqRgkDL2V
	 5D0omOSPBbXoWOjGw5c1MFK+rh2x4pkZdNi0uL3cgfEm7vqcNiKMHGT89O4hvS7t+9
	 hXe5q1BacUkyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A61080DDA;
	Tue, 15 Sep 2026 17:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 624282D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D66260778
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdbQvIoa1li4 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C2B56076C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492853;
 b=TLWfuIthi6uyFn3ekHpxD7pX+q8aElmYLVmv0EmJ6cVCzq0IdJutAZNK6sTE6+/XMLjc
 NBRzfaOx0O4CZHKXOj/SalDlCGof0MHlwGZojsLf6WfINr7PMP5HZ+StE2C3OowhcSiVB
 ssNjAOgufLb2gEGgRhjLPcTut9+hIwAKAxFeoZJFAMV9SLkpXeZSgFHNM23XaWmeEc5ja
 vAsQIktDpFT/AZnwtC4u+j8RfbE8b33886JdyX99rD4tVSciLAOKJZ0PRgfJ6vc7mxmP4
 wm85aBa2D/WuhLwJIi2a6nZKS8TP+LsNd8OhulsjG9BFf1SQt0RiFopqgmUFjoXuPOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492853;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gkmqHOIguYlUiG+fCiDXyavNy3b+WeTRVi/oPT75O0o=;
 b=VdAPr/GscybGGbqba6C7PLL6Gh6kCpZQiXf9dC0EDT2LyiOyEb7lD4nbAHTnzROh3aek
 raJeg7t1amIm/7eaf6nBeDgquOe59jY92Mj3JifgWFoTkoyCOqrHzer8kwzd5apKe7guH
 81xn/ZlcaTT8OO4YgEJu/y8bpn02+CsYuVdD/2+efqr+wyv/jQ4KOEmDhFY4SVEF0Dqs4
 OxWo+iQvfAkf0tbHuEq1Emwk4+0BTMwYoGStsrlClJlSs3vw9jDI1GjypeuPvQU9x2GI5
 v5ltdEl0QQVTCXchY3Lstn98BEmgrBNrsrQ7QRtzactcK6wv/DHbnEhEtzby6Mrkzog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RY8RZlOC; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C2B56076C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F38932003DC;
 Tue, 15 Sep 2026 19:20:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:20:49 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:20:49 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914215426.1852105-1-thomas.petazzoni@bootlin.com>
References: <20260914215426.1852105-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ae3454ac9080778fcd1f18bb3c05f008@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bad: fix
 dependency on gcc version
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

On 14/09/2026 23:54, Thomas Petazzoni via buildroot wrote:
> Since the bump of libabseil-cpp in commit
> 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
> of this commit, the webrtc-audio-processing package was updated, but
> not its reverse dependency gst1-plugins-bad. This commit fixes this
> issue.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c 
> ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
