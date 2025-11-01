Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390FACCFA02
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70118471E;
	Sat,  1 Nov 2025 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaAXy3NWttHq; Sat,  1 Nov 2025 17:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7AA84708
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7AA84708;
	Sat,  1 Nov 2025 17:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 207A62A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0738F4044B
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sg5IKepDye5J for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CF414013E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF414013E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CF414013E
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:28:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DDAD513F854;
 Sat,  1 Nov 2025 18:27:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 18:27:56 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 18:27:56 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com
In-Reply-To: <20251027033242.1797230-2-ycliang@andestech.com>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-2-ycliang@andestech.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <516d3dfa293491e5289d50f0b4616462@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762018079;
 bh=djHZJqZrwZXv9Xd5emNlHlcv5vMNImInae6wkZXvAvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EhKQSiP+uxkSe+YLJOImvRn6ilCNLodJEzQ4jjuUOMSFFGoyTubefuNfEWy2A7v1j
 PHU3JSF/OGWxuFLqLWWVyie69kDAE96K3z0lIAMdZsQezb/xfT2J8aFixJZ/+w5hlr
 gqQMB6vWQHkXTMjJLBmqqUMb0oIpumrVaMG4DU2nYxoDYtUuBaJaZGM5tDUCkNCduG
 3dJWfkFaHtgL/CHaw5Tid6cgkTym4ItQwADHha6aoaZFZ4d0ls2ymmIsFosUTzbCNm
 INQ3SSTvjbPhz77DWpXkyFEtN7YqbjhKx6ghq+BTyq3kdS4sm3ZASqF6Q9qxXWLUyB
 pWicbMC97eUbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EhKQSiP+
Subject: Re: [Buildroot] [PATCH 1/4] configs/andes_ae350_45_defconfig: Fix
 post-build.sh Shellcheck error
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

On 27/10/2025 04:32, Leo Yu-Chi Liang via buildroot wrote:
> Add quotation mark to fix Shellcheck error.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

I applied this patch only, with a small fixup. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7504f85c8432e155233b3000cd1bb78a8704ada1

I skipped other patches of the series since there is comments.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
