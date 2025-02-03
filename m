Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E06C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE5B605F9;
	Mon,  3 Feb 2025 18:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLBRxv8sW4yS; Mon,  3 Feb 2025 18:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD6B60600
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD6B60600;
	Mon,  3 Feb 2025 18:10:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CDD12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C61D2412B8
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omUzpAk8vWYf for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:10:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF7FB4129F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7FB4129F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF7FB4129F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:10:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9D8C460136;
 Mon,  3 Feb 2025 19:10:10 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:56378])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 19:10:10 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 19:10:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250203180024.56197-2-vjardin@free.fr>
References: <19e3c144a337497a75f5b1a552c386c5@free.fr>
 <20250203180024.56197-1-vjardin@free.fr>
 <20250203180024.56197-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <c97c5f48bc4a0f2d7adebf45e2ac4994@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738606211;
 bh=9Tm6tgBY+MQ3eMimVgJyzUAkOiLmPsm4jjWnXigsuJg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KOd3bl4nBwj7yLxwCWoLCQj/ZTLYQfAyp4MihKuK+TTDwFAUl4K+2bX+hRGMbxyZO
 jqLbJ0oV0mh5t2s9cYcBarcJs5D11xVU4t2bMZYVesPWHgeZcHja5johbahUGwvIxy
 luXcCgi3IA6Ew3TZVaR82tL60bHg4mMOFAgNU54LvTkZSKy2zqjdUzMHAWTTab58R6
 7GETh7ndGiF7MLB3LcyFei5b+DTL3sOC1Athp3uDyFEDWbH6TPx2W7EsTX60I2im0I
 Lm5R8r9sCFtw/oVjM+weiUeLmP2DxmhJBDQy5hExUNh6TT/LqsXsmW7IqgB2IsESX6
 H1IgTfBW3r0jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KOd3bl4n
Subject: Re: [Buildroot] [PATCH v3 1/1] board/nvidia/bf3: set eth names
 according to doc
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

On 03/02/2025 19:00, Vincent Jardin wrote:
> Set the names of the Ethernet interfaces that are exposed from a first
> boot so they are aligned with those described by Mellanox/NVIDIA
> documentation for the BF3.
> 
> Those tmfifo and oob interface names are describeded at:
>   
> https://docs.nvidia.com/networking/display/bluefielddpuosv460/host-side+interface+configuration
> 
> When running the native Ubuntu on the BF3 board, the following udev
> rules are set:
> $ cat /etc/udev/rules.d/91-tmfifo_net.rules
> SUBSYSTEM=="net", ACTION=="add", 
> DEVPATH=="/devices/platform/MLNXBF01:00/virtio1/net/eth[0-9]", 
> NAME="tmfifo_net0"
> 
> $ cat /etc/udev/rules.d/92-oob_net.rules
> SUBSYSTEM=="net", ACTION=="add", 
> DEVPATH=="/devices/platform/MLNXBF17:00/net/e*", NAME="oob_net0", 
> RUN+="/sbin/sysctl -w net.ipv4.conf.oob_net0.arp_notify=1"
> 
> The default CX ports of the BF3 are:
> ubuntu@bf$ ip link show p0
> 4: p0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP 
> mode
>    DEFAULT group default qlen 1000
>     link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
>     altname enp3s0f0np0
> ubuntu@bf$ ip link show p1
> 5: p1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP 
> mode
>    DEFAULT group default qlen 1000
>     link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
>     altname enp3s0f1np1
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
