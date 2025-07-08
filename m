Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54703C71130
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 05:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96BE60B66;
	Tue,  8 Jul 2025 05:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGE0oJ7qDHoB; Tue,  8 Jul 2025 05:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD50960B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD50960B83;
	Tue,  8 Jul 2025 05:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6EAE12E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 05:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98D8440140
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 05:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkYm1GP0u_UL for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 05:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41BBE400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41BBE400B7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41BBE400B7
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 05:04:26 +0000 (UTC)
X-CSE-ConnectionGUID: x4OiJsoJQwi+QfaJqbGBRg==
X-CSE-MsgGUID: 1fmQigcDTMquEZ0Ma0Bg0A==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:04:24 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Jul 2025 07:04:24 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 8 Jul 2025 07:04:22 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 08 Jul 2025 07:04:22 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: s0SofOViQUisSHiN5bJiDQ==
X-CSE-MsgGUID: 8xGYi1U7SJONth8O7k99xQ==
X-IronPort-AV: E=Sophos;i="6.16,296,1744063200"; d="scan'208";a="306780986"
Date: Tue, 8 Jul 2025 07:04:22 +0200
To: Florian Larysch <fl@n621.de>
CC: Romain Naour <romain.naour@smile.fr>, <buildroot@buildroot.org>, Christian
 Stewart <christian@aperture.us>, Thomas Perale <thomas.perale@mind.be>
Message-ID: <aGym1lIlT5vSN2V8@yd-6wlzhs3>
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
 <20250706171341.azx6v4b6k524gmsw@n621.de>
 <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
 <20250707154308.pchu64peqfpfwxqd@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250707154308.pchu64peqfpfwxqd@n621.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751951067; x=1783487067;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ABkFKUbnwL2jeJexYjVyeWoo5+Gt3VoqagqZSOUUI4o=;
 b=UaGMh79YGpi0+lZhXi1EjKkErofC68vkbZ+OUM1fQwlNWWbKIdLDxR7t
 wTLc8626NEvwaGekFrCTj1mQvuFNpIIx0x0Qk4q29beufcREpvAbvU5cF
 kXmQrtJNjGVmpFVKxpAi/4V/9UgWQu+us1lCpFjYO/CuLWh93n+sh6PDR
 Z6lvx4yjTXkrwBtJceAbLa8bhljsiuss4zk2KNgmCiuZVjG4Rv07W2g3d
 v62OI68vZIui8RIpW39O/Spsohx9wk6Pv5oDkCi8jmvwST51lOHdWWj2s
 hFGK9vcLuhTmQsKXMVMxr17L9AQSULZen5NbSg2Mds8spu0XpiuGLYW8j
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=UaGMh79Y
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

On 2025-07-07 17:43 +0200, Florian Larysch spake thusly:
> On Sun, Jul 06, 2025 at 09:59:53PM +0200, Romain Naour wrote:
> > I believe there is an misunderstanding here.
> Yeah and I'm afraid you've lost me completely now, sorry. :(

To be honest, I also got slightly lost. I agree with Romain that the
original commit message was not entirely clear (I had to read it very
carefully to get it, but then I'm still waiting for my cafeine shot to
kick in...)

But also I'm not sure I entirely groked Romain's comments either. ;-p

So, I've had a go (aha!) at rewriting a commit log as I understood the
situation, building upon your initial commit log and trying to account
for Romain's comments:

---8<---
All go packages must depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS,
which ensures that we do have a go compiler available for that target.

Now, BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is restricted to the
availability of a host go bootstrap, i.e. that the build machine can
bootstrap a go compiler.

However, there are architectures which can not bootstrap a go compiler,
but for which exist pre-built go toolchains; this is the case, for
example, of AArch64.

Thus, currently, on an AArch64 host, we can't build go packages (for
target or host), because we can't bootstrap a go compiler.

It is to be noted that a single go compiler can generate code for all
the architectures supported by go. When host-go-bin was added in commit
7b2a164b7460 (package/go/go-bin: new host-go provider), the host
depenency was properly accounted for: it is already possible to build
host-go packages with go-bin. However, the fact that a go compiler, in
addition to its native target, can also generate code for all supported
architectures, was missed at the time.

We fix that by relaxing the condition under which
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is set, by allowing go-bin
along go-bootstrap. This allows a situation where the host can't
bootstrap, but for which there is a pre-built toolchain, to build go
packages for a supported target.
---8<---

I hope that is clearer and fits the bill. If I missed anything, don;t
hesitate to amend/fix/ditch that proposal.

Regards,
Yann E. MORIN.

> > When you say "we can fall back on the pre-built toolchain", we indeed fall back
> > on the pre-built go cross-toolchain (host-go) but since
> > BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is missing, host-go can't be used to
> > build go target packages (even if it's installed in HOST_DIR).
> > 
> > Since it's a pre-built toolchain there is no native build involved.
> > As you explained, the full bootstrap via BR2_PACKAGE_HOST_GO_SRC is not
> > supported on aarch64 hosts.
> > 
> > With your patch applied, we can now use host-go (provided by host-go-bin) on
> > aaarch64 hosts to build go target packages. I'm agree with your changes, it's
> > just the commit log that needs to be reworded (with the link to the commit
> > adding host-go-bin package).
> 
> As I read it, this is more or less what the commit message is already
> saying. Can you please explain where you think it is incorrect or
> imprecise?
> 
> The only reference to a native build in the commit message is when it is
> describing the current broken state that causes a native build of target
> packages to happen erroneously.
> 
> I can of course add the link.
> 
> Florian

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
