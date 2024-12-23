Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6C7E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B8F814B1;
	Mon, 23 Dec 2024 07:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ERg2HwPMLlL; Mon, 23 Dec 2024 07:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B55C81760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B55C81760;
	Mon, 23 Dec 2024 07:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AE35E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFAC6414C6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaroJhRMLrjP for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EADC414B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EADC414B9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EADC414B9
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:06:20 +0000 (UTC)
X-CSE-ConnectionGUID: V3iwBa2kR7WE2k6BLF0vSg==
X-CSE-MsgGUID: rFnQU4BtRY2OMQgG7CYliw==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:06:17 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:06:17 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:06:16 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:06:15 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: oe7h9wZWSm+9+92DK/92bg==
X-CSE-MsgGUID: C8JQP667TdeeH5ce4FBJaA==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="235527736"
Date: Mon, 23 Dec 2024 08:06:15 +0100
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <Z2kL55rbwgb35epR@yd-6wlzhs3>
References: <cover.1734701459.git.yann.morin@orange.com>
 <64f9d09898aee7370ee86df702b207182e6d0cb5.1734701459.git.yann.morin@orange.com>
 <e6f74cda3c0226092172388da4f2438f@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6f74cda3c0226092172388da4f2438f@free.fr>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734937581; x=1766473581;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=atQOV0ICq+ECNiOgqRUwVY3G8/rztU+2xH0lFmQY4rw=;
 b=ma8wuF3guWUilj46DBMzfTIzTrb+FJ08wli8Ufu0lyIbhcbgVRobWZhE
 qwhZcTMvKRcYuaCzR702USZktWaEZZuGTwlKXAAQbgbCpgJKBRpIseRGi
 tGoK1SdaKdTWR7fwvxAIMZsKkBgxbvH/uWXG2xVkrHmDyHdOCrJlQABRV
 NXbebZPWJ7ZVJ54aP8g0yCuEX+Cptk+QU6ImDemw3TNRs2RNSi7p7YvqP
 nnNUk3yPF4RUMDcmk0pNamFuUkrEAYYsBdsl7x6JT19bO3yb0fZJIFL2b
 e0prN4QqIR/rl58GzxT25Mp97YcNycaRh2orrlItZFClSnRK0Z+I8XyD4
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ma8wuF3g
Subject: Re: [Buildroot] [PATCH 5/5] utils/get-developers: add option to
 report Cc: lines
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

Julien, All,

On 2024-12-20 22:49 +0100, Julien Olivain spake thusly:
> On 20/12/2024 14:31, yann.morin@orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > Add an option so that get-developers reports Cc: lines ready to be
> > pasted in a commit log.
[--SNIP--]
> > +    parser.add_argument('--cc', action="store_true",
> > +                        help='report developpers as CC: lines ready to
> > be pasted in a commit log')
> Here, this help line does not give a clue this option only works for the
> "patch" action (and nothing happens if it's used on other actions).

Indeed. I modelled that new option on the existing -e option, that only
affect the output when parsing a patch file.

> Do you see valid use cases for other actions?  Such as:
>     utils/get-developers --cc -p python3
>     utils/get-developers --cc -f package/python3/python3.mk
>     ...

No, I really wanted it to behave like the existing -e option.

I agree that the help text I wrote for that new option was not entirely
crystal-clear. So, I've amended it and modelled it after that of the -e
option now (in v2 to come shortly).

> If yes, this --cc should be handled in other actions too.
> If no, the help line could mention it is limited only to patches.
> 
> What do you think?
> 
> Also, "developpers" in the help string should be fixed to "developers".

Is that the only typo you spotted in the entire series? ;-)

Thanks for the review!

Regards,
Yann E. MORIN.

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
