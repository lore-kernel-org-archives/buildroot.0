Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED2FC55175
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A587080C9D;
	Sun,  2 Aug 2026 15:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mBScuLHGW_6; Sun,  2 Aug 2026 15:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E1380C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785685139;
	bh=B4r22kpoNIQHe+NiVKDjMcCuTBjs5NNlAe/nzUc2D94=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cC7U5m1Ala8mPK4c/64uAvfJld8KYoDyyaoVKhEacPbx2jITQKWw1Zh1p2k5+YNfV
	 G9B63uUkIAcQs3vdBBwfnibhHOoVl7nNcty/LuguRH3Wsom8Vj3x5XCxpCJA9smTKF
	 Hy1uumWzuO4ES6XSkALCy9IkIWu3xLhTig9LzjOjtSwVL+kHMz21uuu3sstc+gbR7R
	 5t16F+wV5fz/xT/tNIwgt3QsyZ8ivET6SkhpdKXmi0SMTqaNKuV5YJ1MEDTkr0qjez
	 PtXilRtklEBN6uT8cE/PmNXgalY32ykl062cg4YD0aoqj6NQifvnz8av5k/s01WoE5
	 I3QhUz4fr/GpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E1380C9F;
	Sun,  2 Aug 2026 15:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 666092CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B6D80C9F
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46EGtNdoPHul for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4279B80C9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4279B80C9D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4279B80C9D
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:38:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4B44213F880;
 Sun,  2 Aug 2026 17:38:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:38:53 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:38:53 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-9-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-9-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <5b3fd610b99d864ee81deafed3143aaf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785685134;
 bh=5KDZfE72HeICRrS8+9UdwNHVVjGkxsELOJkLm3LL0XM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qkhbE2ryhYbyPTXgJCSAOflCopM9JtmaJ4zLs0shBxmQqtTLLDKY14DGqpC1CdBUe
 ibDQesyj/QNVqw0j1WbclBH2p7c1ZNp54uuAdRrMPSzT5QQn1PVsrT+yixcVVWIFvZ
 UkVyKKb7+weuLOAdQQwSkJ4/MxBiv+1f6BfNal1ARW0vpSfrAy4rbDXE7c1/chprAt
 +WFT37MPuX6LZbMbjMOFKVq0LR3JGL9DOdir/c/d695kQGeg/e5E0jZ6/x/E+WuqWo
 U9yaum8ofJmgWF2Z+PDq1ARudChEQuzCYIFbuVpHk3WNIYB5Usa/mw+RW8Y4heEYdR
 XYACpYNxL3glQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qkhbE2ry
Subject: Re: [Buildroot] [PATCH v3 8/8] package/hare-dbus: new package
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

Hi Francois,

On 21/07/2026 11:39, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
[...]
> diff --git a/package/hare-dbus/0001-fix-Makefile.patch 
> b/package/hare-dbus/0001-fix-Makefile.patch
> new file mode 100644
> index 000000000..1250d89b0
> --- /dev/null
> +++ b/package/hare-dbus/0001-fix-Makefile.patch
> @@ -0,0 +1,26 @@
> +From 93abfa5970937253ae73bc8bcd9e243d890484a9 Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Fri, 15 May 2026 11:56:39 +0200
> +Subject: [PATCH] fix Makefile
> +

Running the command:
utils/docker-run make check-package

generate the error:
package/hare-dbus/0001-fix-Makefile.patch:0: missing Upstream in the 
header (https://nightly.buildroot.org/#_additional_patch_documentation)

If this is fix is a real upstream issue, could you propose it?

Then, could you add the "Upstream:" tag, please?

> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index a738e6a..8c4fe78 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -18,7 +18,7 @@ dbus-introspector:
> + dbus-scanner:
> + 	$(HARE) build $(HAREFLAGS) cmd/dbus-scanner/
> +
> +-install: build
> ++install:
> + 	install -Dm755 
> dbus-introspector	${DESTDIR}${BINDIR}/dbus-introspector
> + 	install -Dm755 dbus-scanner		${DESTDIR}${BINDIR}/dbus-scanner
> + 	install -Dm644 dbus/protocol/*.ha 
> -t	$(DESTDIR)$(THIRDPARTYDIR)/dbus/protocol
> +--
> +2.43.0
> +
[...]

Could you send and updated series addressing this, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
