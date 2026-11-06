Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B613606A333
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/sr5lMP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B44A608D6;
	Fri,  6 Nov 2026 21:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qsy-NvYPGTs6; Fri,  6 Nov 2026 21:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5013160A6A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999915;
	b=Q9PmOzoKSZxdO739wrQhAd76Bagr7MUzFscfeZmkuMniau+rGdDXAgnLnP/+s57UoarU
	 fYKrGcVDzMH9JbbOb34QmVmdT5DM8nCHG/S6dVmfxdjVaiI9hRqSF5TysreVZfYTmxAla
	 DDr05TVj7bnmZhyX/PWoNReXlFG00vkSKO7pjal/K6jgsmFI67ep/Q8WUhMisyfNEk+vK
	 Na6BrFDNmqQ+1XX02cN8+tG2pg9phQq80oDbv/2yUCoacSXRIUvR2+71nunFq4btFy78W
	 pJfmUPF7rbglDA2lAROT/xl/znGXaL7i2E2y6cQ+xVKu/6f6U30aPW7cRNO5qCbM4ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=qiWhB/B01goe2UgC4jFCjME1q7xbAQVIQl9NVFULDj3RJd+XvVca0DU4hWWploTalGEw
	 7eRvULoOGpgpS7IybQQ7BU6/bkghlMBbde8NQkryrZDAakN70agV/5xukdvWdFgWeflyU
	 WxJQKM57G48FL/pohIo5L9SfjEQWDltfy9l50nclh+xvPc+ofHAgSJE/woVMgTZbZ9MTv
	 ZJHLRTpMBr8I5CMrZV8vp9t9raC98M6s5mwC885li6AQ90OeNBF55CFeL3nDntm78slWw
	 E66lGjnXxMAOxXIh9xc57guBqNgeD1c4zQZpeEkcBmxIwA2y6rh4IQHajJaBrEKsX6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999915;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a/sr5lMP3cFT29lHb6NUpc1siScMRI4C8BvWv+ClWqBfrsjt/naA57US0vCHrUOEJ
	 u6zxV3rdvH+DnmJRS6J5Q6r+Xna95WOHF2an5WUqpZMmQ1xdrwdE9afiKNVdWbYZov
	 ImqoQpotYM9JRHNqg0SKcMycEX8lhgTNnq509q0FmlHJAHrsD3RwjiU4BOjRoptZhb
	 EMgQ9HQjB83nK/CrlfXbAw2TEtKTfC0jtuERA+PXr5Y6gmm/Ep25mEAbsh5pzQHs4z
	 XEODAydDsSvSONR/stTzuQAh07LFIwrsGkUv+F93f0/FAoxhnx+0HQvEme8HfDJ+4H
	 nPqpZbliS5q4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5013160A6A;
	Fri,  6 Nov 2026 21:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B802D235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A98474094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ygETsbH6Wlb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F2A540907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F2A540907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D5D9C20039F;
 Fri,  6 Nov 2026 22:18:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:18:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:18:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20261106191536.2120153-13-james.hilliard1@gmail.com>
References: <20261106191536.2120153-13-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6185f60f769cb22c687bd976d07639f1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-gpiod: bump to version 2.6.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
