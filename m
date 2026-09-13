Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4ADC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C9D405AE;
	Sun, 13 Sep 2026 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 664NJEvPf-LC; Sun, 13 Sep 2026 19:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A6AF405A9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328246;
	b=UdhrA6ROGqpDUb2idSSrjw3Dx/T/IEST5nW8XnTTFJdSpSszjlwr8sSWLPiLvRxo1LoQ
	 ujlrPydjNOyK99Nje4sjRHldBu13Apk4kVIj6wlN/tc0yly53tE9ZqmJDH6jF6pk5p07e
	 VO+PEw87Agimil5FkXkY9Fuhtscpx51SI/bti9bqX6diDL6HOkkzdcCGprEvj6vseKa0E
	 gKcJ8xLXY0OBZYwBUG4w8U8yBmhDqiug/4NMKmci6LesnNZT3p2KCpyVJ6GGBYzekKjP5
	 NOMdNL1mBqGs4dyKcGQxUYAWN9G39/8Ir8Hk9y7cwKv24jttiob4Sk/0OCSvNF/uvbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+I0W1kXjrd+AcHUFVe3rIhDiL+P1Ff9PpdVSsTZ8hW4=;
	b=NBAi2JjZmcHdwlZwwtJIUj4WhztJ0UI6+nuPS2Z4rtoIIplgIs4eCq32DpcO9lQHWcLZ
	 QWBOp4ggo//XjnAbOdnIWfn9V6iJFCTmD8HqbDOwHs3mVu2gYrETBlaaMDlfdn9Ix91tE
	 hDhMIgG3DaqHkRaL34cEqAMExPF78Kef9kyfv72JhZtt7FF2aJCSV3PqaciYpcJSqz4B8
	 R5CUV0xJ9PkNHDFqmN37JAMCnoylO1MH8gCD2ezhefm1MA12eDsYJI//wOZCfH6Q6V4F4
	 8ZO5T7jvvDHqbbQ4XA4cFpUdAHg60PVGB4cAlXy/BZSdsJyA6Q6w+utdRqztTAjYXJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328246;
	bh=+I0W1kXjrd+AcHUFVe3rIhDiL+P1Ff9PpdVSsTZ8hW4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FFFfaSedJpiflIcoH0+wzFwFYtnGJRQ1dEBFEdO9jXd1qlchQ/VEukit55t4o0V0h
	 5EDEW5QvV/k1qQ1DM1rowGaRPr4vH8YubguiGhI0ucQcandYyYc6JCs/CmmOAYViLT
	 7BKYQQFE1OylnfEmnFgpeCKJ7/JL8DhDmJQu3y+HtUlZtFoTvMiKS+ZyvD60RLl+pz
	 H9V8N2u+1ySvG7E3IxbXX/PvZVAR2W5vyeCuV7Wrl3misNNXlR+GaNBIaWdE963nRd
	 6ymb/k6yu34T9zJJrbhSQTBB7AmMKJpYyRLjjc/Z32zh14WKqmm3EqSm7g5lbSQpqL
	 dkpUqatU4b52Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6AF405A9;
	Sun, 13 Sep 2026 19:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7802224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9848405A9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcW2rc3ktAyt for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 245224059A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328244;
 b=O5TOkmu159orYCe3JgZJnmsoUqEWPboKog9h1h3hzGbCOIUe/05l89wg5Hrw4V0zL7tK
 TGWN8OpBacgSaK9MhgzDnN78FOZ9dMWFvBEcNY2LEvwpbNnfE012bw62cwmbBKbwOzbOB
 hkIuxJaKLkHVatp8I/k0/eQC+T6PiqY+dUjHIEggKiEIy1zp9Gdrp3rRvYu7UPSHcBtni
 fmBn7zIRYokpTdSg719Sk3v3v63IODdrWiaqzaen2M7YwDOJxVX381vUk1+HJVtwdHGAW
 8s8Hd5pNVXExosv54vcO7LOKp2iId7AZKR7BHjsK141I8myqOLjvjPK8pHm5J2+BKSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328244;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=pzKsM80eVIHjWiNEJkwCWaHhHuxC4bnBBYftdbTGXsc=;
 b=fw6G+rJrYXI/AofzevJUWcNobEiyVvvNt7m1Ds7Gtd7suZdJIlDrRl6Cgk5CjG26n64W
 uA2ZIgAe4GrQYhho0oQv7j1yTQ6rymj+KCa7De1ZXdr89jUUKx2STHcDSFicogV4Uudl+
 xYKtS+Yv5nQi9/HIFiIUUDhGqENoI/eoon7wcUof50kDK4fEMRl2h8ZBZHa0tIP5DCHLv
 wmU0dyHQJukvpxrI2gzL4ImsVwVzjf5n2IeXvpIxd1FjjHrux2QENjj7vklEVPzzpzwew
 jThPFNBPZTSNhFkbdJXKavA9Ou555Dh3Q8DexhjDP6kIkhQjgAukTmu5nCEjl5dW/cg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F6ylZzLe; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 245224059A
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:37:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F2FB819F58A;
 Sun, 13 Sep 2026 21:37:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:37:18 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:37:18 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
In-Reply-To: <20260913175756.1702319-1-thomas.petazzoni@bootlin.com>
References: <20260913175756.1702319-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <dd138d6a44444df36fef2ad6c0ffab42@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/falcosecurity-libs: drop
 meaningless selects
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

On 13/09/2026 19:57, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_FALCOSECURITY_LIBS selects BR2_PACKAGE_HOST_GRPC and
> BR2_PACKAGE_HOST_PROTOBUF, neither of which exists. These selects are
> anyway not needed, so drop them.
> 
> Fixes: a15e35c4ebc52f29f65372c8e86cefa874aa4aaf ("falcosecurity-libs: 
> add new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
