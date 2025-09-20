Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FBBCAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 09:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47427615D2;
	Sat, 20 Sep 2025 09:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUS-ToJKA-Ii; Sat, 20 Sep 2025 09:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57864615D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57864615D3;
	Sat, 20 Sep 2025 09:14:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76353E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7FC83F96
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhtDquHv9iv8 for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 09:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C39183F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C39183F98
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C39183F98
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:13:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E3AC719F5A5;
 Sat, 20 Sep 2025 11:13:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Sep 2025 11:13:51 +0200
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 11:13:51 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250919065303.60285-1-thomas.perale@mind.be>
References: <20250919065303.60285-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <543a0ee0a3616c0f6663f02399763e77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758359633;
 bh=jjzV5cpI4zt4JmxURgbAqB3nTabvutW12ACnX7jOn6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cjTHQRiErJvcpYZFJLYt7EqwZCtgjn+1yXnzXSnQ3ZTOVEMFwffEEhaXgN5h8plLz
 gT59Nx0oTwj4nf62w2u5YEonR9sHfNTm9+6wjU9k3r1nLAyPyJAQQZCUsL+dMHq3+G
 5e4AKFnJkSeoG+uHr72lMNLhSZ8U25966PAoAX/gu/LlmLYU5YAE/2qM6Pyw35eAYi
 ZDqn/46lKspEJCS27+EqrlSzSR4KNr497h3D6Cy+FoUd9Utw1CusEJ1cmoUPwBLg/t
 ooH+SeZmmIDbjkQl0meAiUbVEbC9w5YRjyeyHA7eD4OtmbO7A1k+ESwwa8Ushh/kyL
 8BN53P6zp9gWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cjTHQRiE
Subject: Re: [Buildroot] [PATCH 1/2] package/poco: add patch for
 CVE-2025-6375
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

On 19/09/2025 08:53, Thomas Perale via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2025-6375:
> 
> A vulnerability was found in poco up to 1.14.1. It has been rated as
> problematic. Affected by this issue is the function 
> MultipartInputStream
> of the file Net/src/MultipartReader.cpp. The manipulation leads to null
> pointer dereference. The attack needs to be approached locally. The
> exploit has been disclosed to the public and may be used. Upgrading to
> version 1.14.2 is able to address this issue. The patch is identified 
> as
> 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf. It is recommended to upgrade
> the affected component.
> 
> For more information see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2025-6375
>   - 
> https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.

For info, I added a new dependency to utf8proc  in the patch 2/2. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/90e8845b1393bc3042ea8c9edc1172f3951742fe

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
