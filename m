Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4405606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qBkQjskd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724C060AD9;
	Sat, 24 Oct 2026 11:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kChSd7ZndHMM; Sat, 24 Oct 2026 11:54:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A03560AB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842856;
	b=WWPlT18mFeJ0cABYxqB2juZqy9MyiGxv88Zes7DuLag6qsdr8KzqZzE+TijJMSJvlsco
	 x0l4oUeJtKHtJEx24pD8uj0V4YHcQtMIlbzbekajBAuzDHaTg20LULPx/k+HNJB7tB9zj
	 vFvRz9Bvmzs46EmCsGlQCv5sFvD/paHyNnM719PjPWOpLTpo142lqvc7DMXGQNVjpeogg
	 zHMc5tptKfa/R2ObXByJ6fKmvXHogF/zJ48QPtgAVLRaOHUzeJtAaQGDL6A3zeHuDcmP1
	 GYxpgfAQUZpn9RFNG4aTWayY194uMv9VVVBl+/UZNeipREc/XnbvWhbDVDpBMB3a3Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=Qsiw4pWTmykMOHKYP1D+POwCX3wv+RAUKPzNHt4r8+z6F4VawOAI+5mEyXDSJw3gEvJQ
	 tO6h+MbuQP79+aBtH5O2vCK9EDBBU3Jb2cw3MqNZqGA0TuRIft4g6Ft4Q4hOsTcJNc4uL
	 Y6gEfkAhQ+ZvyrHXyU2eeFQNfGVHrti4W5BjXhk0y4BWNFMP0IVSMZiTSbnWg1tPtNrPx
	 p2km9nji8We03zJ55iROMLmY/xC8e7smqz5R4VO6RWTI4WJBsjyDZ8nZAkgs4UnODxPKQ
	 42A+oxx7DbATJCGcimEcskk6A0+INMIaJzG7EIDRMUBDjU/UzLCkpZCQc8SzJrHFZKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842856;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qBkQjskdRtcLvHVP+0vQd4F4tgQFJtgyHzQ8M2LcBoTfYllHCbCTG04a/WCX62vB8
	 KGW60DbY2CkCged3rNOUAJXYRON3NoTYtYej4K8NPidPhTbPYowTQf7vedrqlZJxft
	 fJVvBuKMmvVAf1VLDzFv5k71pmDzO7o5UprOZjveQdbCAyGXTonlLX6/BSs2iqLUIv
	 2BmPExYBcLaWmnhR9Fvx8fXwzq+TjOV92ljcmGukCfbuXkapNhrWnCDGFHMf22xck8
	 +xrbWCghEI2Wv9bGXR90TeDfwNKGzfhe9hF7NG4mkuzn1lzrNrW40NQRCyHEg0jUBs
	 lhhX+BwW8Q9aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A03560AB2;
	Sat, 24 Oct 2026 11:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8754D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68FA681701
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbmhSXliCEV2 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A77FE816E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842850;
 b=JxjhaTuiH87RdrQOlucIJ0TXxbJxf/b86JrcUGnRI3wMHUnD7mEp/K8A4Ay4Lb9JgNiP
 uwz36IMUSn6KpJfW+XueshPWuyCBW4WF8fhjakmQb/RYQ4Zm3/TsxJ6yRCj3qnYWlAL7g
 Z9n/0TVWSxRHzhe3upg4eDXnCv4YUJ5Dwl8b9pzjl78B4L/OJlZpJquIWVa3Qh/aOGpGG
 HuPHZSFNrVA+xEmkuX99zIpiIBMYI24n6hwohOg8bW5/0ZrL4va2dXzrwSumfg3jJICzB
 BJuYc/eo3h95Qr3PPg1YfZC3zdM/xGrVtMyscYRku6BK9+aeflUDJK5zGC9iziLtlzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842850;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=bBZKLtpVmTrn75LUnE/qhyPEi5M9Z1fe16m+Nh3yqraNVLrL1eFg3uieLOlzJKEtizoO
 olZCdd6cyriJUEEzMdI3Sk70LuIA9zIgnq0etlrFbwZRQTfCaRw40BvCKix07zaXuEv3V
 Es7xwA3lMU6MSj8Wpgcn/himlF5hsCh2cxohPPqMx4ATl01wMLO3+ov6ntGWkBRgOAT9E
 YQ6+CUa06LtyyPou5T1fdCIgLWvQBlJJEHpcpF1aa3K72LizNpggn4DiSAyXj73rwk0hk
 xluacegH3Z9MMCDfoN9T8FpLmNA6+XV46W0lgB5ZiG4xZMf8thhE13fyec9DAGNHeXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uMXs1vJe; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A77FE816E5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6BC1F780383;
 Sat, 24 Oct 2026 13:54:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:54:05 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:54:05 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261023181818.920329-21-james.hilliard1@gmail.com>
References: <20261023181818.920329-21-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <37a5637231d340a588471f14144a1d5d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-sentry-sdk: bump to version
 2.73.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
