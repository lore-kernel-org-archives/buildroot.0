Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED07CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 108F28435C;
	Wed, 17 Sep 2025 17:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6wHQPb_ZUWm; Wed, 17 Sep 2025 17:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0998584220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0998584220;
	Wed, 17 Sep 2025 17:34:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7330AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D9206117E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9t2NX81zgUFK for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A67DD6112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67DD6112E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A67DD6112E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:34:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F3FC4780331;
 Wed, 17 Sep 2025 19:33:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 19:33:59 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 19:33:59 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>, Aleksandr
 Makarov <aleksandr.o.makarov@gmail.com>, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, Anthony Viallard
 <viallard@syscom-instruments.com>, James Hilliard
 <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <09d62eda034a925022ac70a85d4efc3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758130449;
 bh=YQt9GDsqX3tygu1CFWXofsBCJ2tcdksX8k6qeDoSFik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YDcQgKZXe6Z9hcI3SXGSWf1LPcBJX6c5+vAjyaWRIWcphrhvHu7yWmeC9M4ZnP0wu
 eXODOo1c4Ub6OE7NIZDPpd8Yw8EbTIpNWGLvY64p570ZNpVkF09SueC99x+mIxOlpR
 fKIo1t9Qzw05fzM/EXCyoPhBloZr38PTXivo+YdVpdaV27K7ezhH0wACgfQmf7f8uX
 pyHmeD+1LeQih/WBl4J6S/ulzLHFuhS7R7R9zvwPz1zwXXeRqO3tUUEge4MY2vpLBU
 g0OfGD6zP7jPN19aepHqVCYx0bQddmO0Dfs1sInzTxNDKpydPuFLV8t899jxOPk8lf
 P5LjkGsLEhc2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YDcQgKZX
Subject: Re: [Buildroot] [PATCH 01/12] package/asterisk: fix deprecated CPE
 ID
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

On 16/09/2025 22:27, Thomas Perale via buildroot wrote:
> The CPE 'asterisk:open_source' has been deprecated in favour of
> 'sangoma:asterisk'.
> 
> See the following for more information:
>  - 
> https://nvd.nist.gov/products/cpe/detail/7FC01D7D-5AE9-42A8-B31E-A99E745E5BE5
>  - https://github.com/asterisk/asterisk/security
>  - https://nvd.nist.gov/vuln/detail/CVE-2024-42491
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
