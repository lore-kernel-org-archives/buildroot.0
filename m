Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B80ACCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 06:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FD440BC4;
	Tue,  4 Nov 2025 06:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaJxVwQPLGjS; Tue,  4 Nov 2025 06:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F64740B64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F64740B64;
	Tue,  4 Nov 2025 06:02:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A94222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10ECE60E60
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Hh_lS84kwZ6 for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 06:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D65760E59
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D65760E59
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:01:55 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A461m0J066742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 4 Nov 2025 14:01:48 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 14:01:47 +0800
Date: Tue, 4 Nov 2025 14:01:45 +0800
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, <tim609@andestech.com>
Message-ID: <aQmWyToPsMCbIzrv@swlinux02>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-2-ycliang@andestech.com>
 <516d3dfa293491e5289d50f0b4616462@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <516d3dfa293491e5289d50f0b4616462@free.fr>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A461m0J066742
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org; dmarc=permerror
 header.from=andestech.com
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, Nov 01, 2025 at 06:27:56PM +0100, Julien Olivain wrote:
> [EXTERNAL MAIL]
> 
> On 27/10/2025 04:32, Leo Yu-Chi Liang via buildroot wrote:
> > Add quotation mark to fix Shellcheck error.
> > 
> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> 
> I applied this patch only, with a small fixup. See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/7504f85c8432e155233b3000cd1bb78a8704ada1
> 
> I skipped other patches of the series since there is comments.
> 
> Best regards,
> 
> Julien.

Got it!

I will reply to other comments and respin a v2 patch set.

Thank you so much.

Best regards,
Leo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
