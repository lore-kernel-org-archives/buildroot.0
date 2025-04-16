Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBD6C369BD
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 12:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DB841D94;
	Wed, 16 Apr 2025 12:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhKCQKYgoaCw; Wed, 16 Apr 2025 12:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD4641A3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD4641A3E;
	Wed, 16 Apr 2025 12:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7EE2E83
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2ED1832D9
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG0inIt3u5GD for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 12:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91C2480BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C2480BD6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91C2480BD6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 12:06:59 +0000 (UTC)
X-CSE-ConnectionGUID: Ia8pI/8NR8OcrmDRP+2cXQ==
X-CSE-MsgGUID: p3z4lPQLQROlIuqzAnPwsg==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 14:06:57 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Apr 2025 14:06:56 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 16 Apr 2025 14:06:55 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 16 Apr 2025 14:06:54 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: XfV50DfNTbGxFazoBhypFw==
X-CSE-MsgGUID: Xd9eUjcfTVWTWpYbdw7m/Q==
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; d="scan'208";a="276515100"
Date: Wed, 16 Apr 2025 14:06:54 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
CC: <buildroot@buildroot.org>, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Z/+dXkdC1jEpIF9g@yd-6wlzhs3>
References: <20250411113731.4804-1-tianyuanhao3@163.com>
 <Z/ktsWj+ng6Z5pyA@yd-6wlzhs3>
 <490223b3.2688.196294762bd.Coremail.tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <490223b3.2688.196294762bd.Coremail.tianyuanhao3@163.com>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1744805220; x=1776341220;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=udMkxYvXEiyPVV2utoSClJTCIMvS4D2Sp701jdC9sjM=;
 b=ZMwzR/sGScmrnfwuy8ot4F775CnGA8+3xF9k3rnI2QI3fgeysKdkjyEq
 hdQlR4SY7u/O+xMD1t7p58wmMY8zMuR5RUl8PUXvak1ZKu+6LR7bEOHJX
 KtmTYUUj//9zUMLZags0+oA4bsmGTxtHyLcxRK0KDrLluAhmQ+ikEz9YT
 9PejpTf1fosziMMfhgxz6ACPHIJWMj2wce/InaEm4UnsoQ9t4+y82i8lS
 w4Kuwv62Fiz9uxTIJs4c5jUUFIyrrKhgRJpOraBG+8RCLHWD6C/zWCP3J
 GXfbKpifxFQpOrS675LfNpNi26IQ+Yfbvkt/q+f5PUb7h6kNvEooGPIb0
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ZMwzR/sG
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: install service files
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

Yuanhao, All,

On 2025-04-12 17:14 +0800, TIAN Yuanhao spake thusly:
> At 2025-04-11 22:56:49, yann.morin@orange.com wrote:
> >Yuanhao, All,>>On 2025-04-11 04:37 -0700, TIAN Yuanhao spake thusly:
> >> Install tailscaled to /usr/sbin, as the service file references that
> >> location.>> >> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> >> Cc: James Hilliard <james.hilliard1@gmail.com>
> >> --->[--SNIP--]>> +define TAILSCALE_INSTALL_TARGET_CMDS
> >> +    $(INSTALL) -D -m 0755 $(@D)/bin/tailscale \
> >> +            $(TARGET_DIR)/usr/bin/tailscale
> >> +    $(INSTALL) -D -m 0755 $(@D)/bin/tailscaled \
> >> +            $(TARGET_DIR)/usr/sbin/tailscaled
> >> +endef>>I would suggest that, rather than override the default _CMDS, you
> >provide a post-install hook that does a symlink in sbin.
> How about creating this symbolic link in TAILSCALE_INSTALL_INIT_***?

You'd have to replicate that for all the _INIT_* commands, so better do
it once and for all.

Afterall, adding the symlink is not due to the init system in use; it's
due to a limitation in Buildroot's golang-package infra, which does not
allow specifying the destination for each individual executable, and
forcibly shoves all in /usr/bin/. So, adding the symlink should just be
done unconditionally, as a post-install hook.

> >>> +define TAILSCALE_INSTALL_INIT_OPENRC
> >[--SNIP--]>> +define TAILSCALE_INSTALL_INIT_SYSTEMD
> >[--SNIP--]>
> >What about TAILSCALE_INSTALL_INIT_SYSV ?
> The upstream repository does not provide a sysv init script, and I
> am not familiar with sysv init either.

Fair enough.

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
