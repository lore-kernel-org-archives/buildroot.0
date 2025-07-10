Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA12FC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 08:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7224481EE1;
	Thu, 10 Jul 2025 08:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPpKCAgrfyST; Thu, 10 Jul 2025 08:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4EF839E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D4EF839E9;
	Thu, 10 Jul 2025 08:35:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E476B12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAB1660EAB
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcIgSQhnwO1e for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 08:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5B2560DE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B2560DE9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5B2560DE9
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:35:41 +0000 (UTC)
X-CSE-ConnectionGUID: 8H0+qE2kTBOZdjwzzqnAKQ==
X-CSE-MsgGUID: tRSwZUhNR/OYbWoWf3t11Q==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:35:39 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 10:35:38 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Thu, 10 Jul 2025 10:35:37 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 10 Jul 2025 10:35:36 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: k4GhjmINQ9ujC5c13SGpvw==
X-CSE-MsgGUID: i8dZLuckSwq32QzFSu0qGQ==
X-IronPort-AV: E=Sophos;i="6.16,300,1744063200"; d="scan'208";a="309782415"
Date: Thu, 10 Jul 2025 10:35:36 +0200
To: Florian Larysch <fl@n621.de>
CC: Romain Naour <romain.naour@smile.fr>, <buildroot@buildroot.org>, Christian
 Stewart <christian@aperture.us>, Thomas Perale <thomas.perale@mind.be>
Message-ID: <aG97WEwGhHgMN5p2@yd-6wlzhs3>
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
 <20250706171341.azx6v4b6k524gmsw@n621.de>
 <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
 <20250707154308.pchu64peqfpfwxqd@n621.de>
 <aGym1lIlT5vSN2V8@yd-6wlzhs3>
 <20250709145921.wuzple2z7jrftmjh@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709145921.wuzple2z7jrftmjh@n621.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1752136542; x=1783672542;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=7xSgkawvvWXdX5j/HdFvzVRVHOp0xHuAbMuy8zgKK30=;
 b=MmQf6EcB0WfSycQEDSYv4adU0c4Y1vwqPcpKIdIaSnlbOqEpcYTrqR9e
 +Gtmm9A2ebECiJLsB12dXKZ1a4abeTotDMM6TDswwNliJRY/JaZXgnsP6
 UnGCxuyYb+iNsxwLiwDiWBrF0JdtDETBpSBCxhIulyMe4UrNfKyLcvGyb
 9HTNaWb7Oda96FCSd83qHkuGCWrGnS1Wmwq/zSQhNmgIXPLlx6hUBQexg
 QPEMFtixSIDRVsLSXjTzbB1Y+7BhOjnvcnRLuovzn6qXu/KT8gxraZ2Ck
 /7B0FKcA+LJMV+HMbsuCyijpkrKAtnE6ZJesmaMDXZsqQQEUHluU35S77
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=MmQf6EcB
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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

Florian, All,

On 2025-07-09 16:59 +0200, Florian Larysch spake thusly:
> On Tue, Jul 08, 2025 at 07:04:22AM +0200, yann.morin@orange.com wrote:
> > So, I've had a go (aha!) at rewriting a commit log as I understood the
> > situation, building upon your initial commit log and trying to account
> > for Romain's comments:
> Thank you! That does seem more straightforward than the original
> message.
[--SNIP--]
> Either way, feel free to commit this with your reworded message. Or
> should I send a v2?

I think you should just resubmit with the updated commit log. Do not
forget to mention, below the '---' line, that is is a v2 that
incorporates an extended commit log, e.g. something like:

    Signed-off-by: Your NAME <your-email>
    Cc: romain <email>
    Cc: yann <email>
    ---
    Changes v1 -> v2:
    - rewrite commit log as suggested by Romain and Yann.

that way, it is easier for a future reviewer to follow what's going on.

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
