Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B9FC9EE0
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 09:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC66841DC;
	Sat,  7 Mar 2026 09:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIbhkh-WE2nf; Sat,  7 Mar 2026 09:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A346841D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772875556;
	bh=ki4hELvi6/riVuQ1wsz/PHQ/ctZVnc5ohRG4jTLvjdE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Dlqd42ppmWxjyrK08zR14/w5U+kke/hpn+mt71xnNRV53uNUAPCSuvE8LHCBDSKHg
	 wiW482bvpuBHPIehIpMBf+Um5sNAcM3jMZl1JgYlspJ0bzt3yutIvItg0l7fQ3xLs5
	 99ovh/eRyaV6JZVmcHxuACba1+IRjCVaonLnLqNp/aThBOfwBJKMeCPGTi0Fp1RXJb
	 SXW+xLiqxSrEc0vwT1Hn+VQtMG2bKov1/Yowe950H05o+ksgNULLGJv8wQJ6IlGeTx
	 SMJtt6czdXH5Vj0pHoHo/AaQ0DFWIkGaM5pIWAR8vmzMyZhtaUsfO1uutnKNgGfSxv
	 0Gs+ZzsFgsGpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A346841D6;
	Sat,  7 Mar 2026 09:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A5EC223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F20160F3F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5UGpOpfyKjG for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 09:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FBDD6078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FBDD6078A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FBDD6078A
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:25:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1vIqOZ0YHI-00f5Ht; Sat, 07
 Mar 2026 10:25:47 +0100
Message-ID: <322dd910-1bba-4797-a5f0-4228380e06f1@gmx.de>
Date: Sat, 7 Mar 2026 10:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dylan Buckley <ohitsdylan@outlook.com>, buildroot@buildroot.org
References: <PH5PR05MB998506EF0692F2B1FD864EEB3ACB7BA@PH5PR05MB998506.namprd05.prod.outlook.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <PH5PR05MB998506EF0692F2B1FD864EEB3ACB7BA@PH5PR05MB998506.namprd05.prod.outlook.com>
X-Provags-ID: V03:K1:zhAWq/E56FQZw9/b5murG22KUpXPt5mEhSKMvBx6iUXo9e4HLoI
 LA5FHljoCuqtonWpa2sFwzKzrhbq7L003dCJjK0mx5QaVmmpTlqPS/TH7+Gg8w6sEv3M9Q7
 JMnP/Gj7utBSHk+2WzsxIe8gsQaDvjpJOVgEPuUn1NQnN0tAxK4/ESK9KocJcvHN6EM3s3I
 hJPeLIVoz7mwJsBZmGRlA==
UI-OutboundReport: notjunk:1;M01:P0:Cjl/+IlKvSo=;zgtHenqhLZrbaM7e2pq8zmtMqnj
 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
 VKAi2wmQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772875547; x=1773480347; i=fiona.klute@gmx.de;
 bh=nbBhg3AVLLMk9lPJaRh9tE0+GtXaf/dcE+Qlx5SCXNk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AWwgeQEswaPbm7ZSJqWXHSi8R8USG5V0339rltSFaHUJzJiB12Dx8iQd+o3UNZ+j
 3Ffttjip6Ac8+sWjBdWKApRxwiroX61tfJ3SxSPP3W0uD/7t2/Fpjm4+EiDmdNHZp
 voiXrKedn37WUk7AHypzvBsZC2LojfdXHMiyunj7HBsrv8zPZbBzmwDeateJQ+85Z
 I/EKRL4xSIYlY6mKu2WgMmZV1GZPqXIDB8URVDlACkdr5W3wcwQWwaqVx0l2+9uKg
 5BLWeVOcSlbcY9q3P/u1aoH9QI8pEuUouTGyK/UEknyK5V7+jtqg4SXb3v/ttZIGt
 d5PHUo0QwN/3ehqUxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AWwgeQEs
Subject: Re: [Buildroot] How to Build python-jinja2 Package as a Host Package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 07.03.26 um 02:06 schrieb Dylan Buckley:
> Hello,
> 
> I am trying to build the Python package, Jinja2, as a host package. I 
> see calls in the python-jinja2.mk file to the host-python-package 
> function, but I do not see python-jinja2 as an option in the menuconfig 
> host package list. I do have python3 enabled in the host packages.
> 
> Am I missing something obvious here?
Most host packages don't have any config option and are just pulled in 
via <pkg>_DEPENDENCIES where needed. E.g. if you look at 
package/python-jinja2/python-jinja2.mk, host-python-markupsafe is listed 
there, and python-markupsafe doesn't need a config option for the host 
package for that to work.

The host packages with config options are mostly ones people might want 
to use as tools to go with the Buildroot build results (e.g. for 
post-build/image scripts, flashing, debugging).

So, what to do depends on what your goal is:

If you just want to build Jinja2 now: make host-python-jinja2

If you need it for some other package: add it to <pkg>_DEPENDENCIES

If you need it for some post build tooling, you could write a patch to 
add a config option. There are a few host python modules with config 
options, you can look at those for an example.

If you need it for some custom make target you can technically also just 
add it as a prerequisite for that target, but that'll have it missing 
from dependency tracking (including "make source", "make legal-info") 
unless something else pulls it in.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
