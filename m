Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B18CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C067A6070A;
	Sun, 18 Oct 2026 14:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBHlbjgfWr1T; Sun, 18 Oct 2026 14:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F068F60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333819;
	b=ST8rj6YeDwwPZGAszeRSXwtJz83h+DxYFjV/a7Fmp/wAkI+Qh9X9gPOuCxmw+ErkGUZB
	 scvs4ea5P5hFCcRMiiemkjbeX99Dn3M3XEpvjQ4k6YzD0FOeqYPe8ujoYQGgfB5ynM5sP
	 V6sPrxB+XzitATQgxwXpeKguMZXRMCI/oObdCcIRUvNkwKFwkIi1kdC6kIibYypVPLwsc
	 niDUg0Pc1QK+vRrhMTW/ujaDB5mrn+BKn1oRfdTCeaCl1zfW2DChO+sVs/HG6qKloCf4w
	 dODTxwaMftCl2iHVPiAwrIftCcnFJBbZsrirvTFQq5P6R9PfT3RGNmZg2R8XKpdsv1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=sQCmXe8LRX+FdeD7GWd570tiy1HU/+e3Z7OxY93iL2Klqia7f4j2P02efvKyPvuhrH2j
	 AC1Qy6P+KQRu74zfRAzEUv0V4yBres5o6bVkpS3eg99VxwhUFnWhK9GMP9xYWCT5t3Kz+
	 wc+J7OxyjrMvR2Fldy5ClZDkjfWhQe1xgMCmWgcwOLX0TRghE7diOF3NHX/xqeLzHtv/g
	 hLwnc3zAdsBLQ5zDCr4hSwrvUoq4GXDKwTarQd+INDsC70ByPi65VWY+mDTqKrogHu89R
	 1ZQLid3gkkibQt82PkmGwJGKHbec7LsOCb/sqK1GsxDBOrtD/ewGfpdOi55Mk5MwEmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333819;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TR4Cm2v4Obz/rVbLPFP+Vbb8tx0AfzkavmZ6ee5hZEvcWmDHxXpe4KxseiSw4I20+
	 kDGDqzKi+tYkOCu37orTgFXQeQXRPgE4xcLLK9Ay8vn/wMKw1nFrXiwvQmo0VHjbBV
	 QV2LTzI59IbI4j3ddz4ycLiN/VsJml/HhVSt4/5IMeSZL90vFJAw2knqEFhJfQRZ1a
	 KgnRFXonZLsYGXmoY4nD9qffUbs3n4QKsvxJ++lLpmUtDaPEk5t14nJt+LGyGipPnT
	 1QW/6xRTqnCLQJRYGCtqt/RzvRFg4Rzi/dpGvfXXytSSkoOJ5XJwXVmxqQswMvvYXt
	 6L5xv7Be7qO+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F068F60652;
	Sun, 18 Oct 2026 14:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B83EB2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A98DC80E1D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Mh0W9mxvv3t for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:30:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 172D880CB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333817;
 b=nnbiM+Rgqcavdfqg5PbWY0++Dj+lGXU6OcXrGwFeVtrerNAVtKn8D1vrB7u2Q6CwGcZg
 lRvh7VUqC5U71pGPstbksX4EhnfCB7JFjfG9isabb6wSbnhJv/JndVkXmuHUO7sQlddtY
 dsNtNY/fd4s1alTXn3wLnWBhyK8J3Tl1u+X8ZAUi8phSmNHhBLmvJCctrE40OKHpvWh/Q
 XYZ3bRgUJs7mZP9LjWdO5nxiiDnMMh9PZzlCzjlh+FKV6mI38eN6b3s5C+iDhAciroOb/
 aq8W4Ljt6uB6yXfqtOtfdJJv2tg2ItnicPDYdzvv/LgX1X3phsnSiM1DAM7NORUmX5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333817;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=Y/PUsfaGssjfRrvrmFpZGJsDAK3Dbc9iHutsgmuwTYPRqcgR8CuhiTQD4jpnlCzlY7ww
 wop3dQ4zUbYxpswc2DX8XqlyXwXCDxoEesxN7gTU64A449/ez1EP72FOPbfKpBccN0uF/
 ndlIgnC4RpJcd4DLTXT8wHiIhzI8VzBrXg0v+tCR73SowCfwrQ4gCYFwyOtBQjAg0CJBp
 x9C3h54LU84ooUnZWHbVx1qJeQ4xCn7O0pd5B2y3Ab+0jwWkMcdstYYH+4j8TijnjBCbt
 AcUcrXhvyAWQuA5JpylLVTyICxxcD7Yk+4HbIDxwde/21fX4NPqKSShHecdmU6TuiEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nI0keut5; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 172D880CB0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D4E7E19F59C;
 Sun, 18 Oct 2026 16:30:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:30:13 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:30:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-15-james.hilliard1@gmail.com>
References: <20261015215210.3426895-15-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b17e35f3051d1e2b5a03bde9e1fcf714@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wrapt: bump to version 2.5.1
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
