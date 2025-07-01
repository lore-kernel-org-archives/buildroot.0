Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750A9C8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 05:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024BE42605;
	Tue,  1 Jul 2025 05:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oErFRkHOefJ4; Tue,  1 Jul 2025 05:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D993F42614
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D993F42614;
	Tue,  1 Jul 2025 05:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECAE4179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 05:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE639614E1
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 05:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOp3pw37fqGh for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 05:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAC86614DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC86614DE
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAC86614DE
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 05:26:37 +0000 (UTC)
X-CSE-ConnectionGUID: 2XQ7+1MyTHuBo3zJ9MmrWw==
X-CSE-MsgGUID: a407ZHh0R/Cf24wDq0+auw==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:26:35 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 07:26:35 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 07:26:33 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 07:26:33 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: lG0yeFawR9G5idPqy092ew==
X-CSE-MsgGUID: AgME4NKdQnq4fMaXDqDJLQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="306778420"
Date: Tue, 1 Jul 2025 07:26:33 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Message-ID: <aGNxicz71nSV+nvK@yd-6wlzhs3>
References: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX306.corporate.adroot.infra.ftgroup
 (10.115.27.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751347598; x=1782883598;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=j7eKktkRLXeFi9MjuFXZfIdnbFYOgB0Zy0oj/KLLz+w=;
 b=mM55wujBhlkzTZkPL+m/jHvHLw72ZfTNYswe9MfXQB5lZMaVS9n/FMnw
 YrRbcv5kbzBnXpMSOKvj+4xfanKTo+1dKSyJZd+V2QGfwtqnLoVg7XOmJ
 k4mFfuO1eNenMdP1IRxRcc2aCMzJ+ynzH2TWbYyq1jCw4ggKy2YHrNaZK
 By1zPoXABoUIFkxo9DuBiuk9mPByDtaA/BSvSrAoWP0VsumgNhZTS3ihJ
 2hUAnaQrJF9jn8Ecl+Dua0eQlN6OpDT8lcfTFeY6Sb3svHFczyPNQG45l
 U9WV8ldYrDNCmziGhcexm1sBhuA4ON0GYkeRypuOxYaIK7TRR+eliWZdU
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=mM55wujB
Subject: Re: [Buildroot] [PATCH v2 0/2] package/elfutils: Add missing glibc
 and c++ dependencies for progs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxime, All,

On 2025-06-30 17:14 +0200, Maxime Chevallier spake thusly:
> This small series addresses a build issue for the elfutils programs that
> appeared after the bump to 0.192. This release introduced a C++ program
> (srcfiles.cxx), so we now require a C++ toolchain to build the programs.

To be noted: the bump to 0.192 was part of 2025.02, so the series should
be backported to both stable branches.

> As pointed by Yann Morin, the programs also depend on glibc. The first
> patch adds a missing menuconfig comment to explain the glibc dependency,
> and the second one introduces the C++ dependency.
> 
> V1 : https://lists.buildroot.org/pipermail/buildroot/2025-June/781721.html
> 
> Maxime Chevallier (2):
>   package/elfutils: Show a comment explaining that elfutils progs need
>     glibc
>   package/elfutils: elfutils programs now require a c++ toolchain

Thanks!

Regards,
Yann E. MORIN.

>  package/elfutils/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> -- 
> 2.49.0
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
