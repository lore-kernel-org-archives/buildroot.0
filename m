Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99DBC0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 21:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5259784AEA;
	Tue, 21 Jan 2025 21:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orKNt4lhOPco; Tue, 21 Jan 2025 21:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E79684A1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E79684A1F;
	Tue, 21 Jan 2025 21:24:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11517C1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F9941398
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOE6vFKk1T_Z for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 21:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.100;
 helo=smtp-outgoing-1702.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E1B241383
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1B241383
Received: from smtp-outgoing-1702.laposte.net (smtp-outgoing-1702.laposte.net
 [160.92.124.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E1B241383
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 21:24:41 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4Yd0b935J3z1spV6","contextId":
 "9a36be77-8012-4446-b1b1-b489e4d924b9"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0111.laposte.net (SMTP Server) with ESMTP id 4Yd0b935J3z1spV6;
 Tue, 21 Jan 2025 22:24:37 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4Yd0b92KSTz1spTs","contextId":
 "83e4bef8-842e-4750-bc8b-af66707075cd"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0111.laposte.net (SMTP Server) with ESMTPSA id 4Yd0b92KSTz1spTs;
 Tue, 21 Jan 2025 22:24:37 +0100 (CET)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id A228A635C4E7; Tue, 21 Jan 2025 22:24:55 +0100 (CET)
Date: Tue, 21 Jan 2025 22:24:55 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <Z5AQpzdvgT2C8KTr@romuald.bergerie>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250120061032.15343-1-vincent.stehle@laposte.net>
 <5f680e088fa047e6c0e2e2d98395deb6@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f680e088fa047e6c0e2e2d98395deb6@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1737494679;
 bh=bGtDj7JCv+u07pE0krqhcFtwS+N/xXqSSGDTr570E9w=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
 b=V1eTqVSUq8INA5aAEAi/eMCr9CI8SgMvZOw+0UIEcAPsEQGDRIXlRKWL0LpJ27oK0UIwQqBivL5QHazfDHzTHQzJvDklzwAH+aQqe0GjWGx/FXqcs9SeqxN3Qi+CrnA/J2kkLaXvQ76H1ewmVb5q0hjdRucmIy44NbOQZ5AMhUp8BsieQXWziaq73Cteew4HE0ESTQ+/cn243qMCAsE+8EDXxfYbhMyG6BuHRPBexpHwZ442t++TRsjp0XgZiTs3GM2issA9QcQm5YRQ9A/NhHLjWjeQv8BY89jSUYCidlDTWXucPXZNJ7yEWdvd+XhVKxlFBO/ENA5mHEnvIZS/9w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=V1eTqVSU
Subject: Re: [Buildroot] [PATCH] support/testing: test_xen: repair and
 leverage xen tools
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 20, 2025 at 08:56:53PM +0100, Julien Olivain wrote:
> Hi Vincent,
> 
> Thanks for this nice improvement!
> 
> I have one comment, see below:

Hi Julien,

Thanks for the review!
My comments below.

(snip)
> > +        BR2_SYSTEM_BIN_SH_BASH=y
> 
> I think this test should not select BR2_SYSTEM_BIN_SH_BASH=y here.
> The bash requirement comes from the Xen tools scripts,
> installed by the package itself. See:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/hotplug/Linux/init.d/xencommons.in;hb=RELEASE-4.14.6#l1
> or other scripts:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/hotplug/Linux/vif-setup.in;hb=RELEASE-4.14.6#l1
> Also, this test does not really need to have bash as the system /bin/bash,
> the real requirement is to have bash installed.
> 
> So maybe this could be fixed in a separate commit in the package,
> for example, entitled:
> "package/xen: xen tools needs bash at runtime"
> in:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/package/xen/Config.in#L20
> adding:
> 
>     select BR2_PACKAGE_BASH # runtime (scripts)
>     select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
> 
> Then, your test, just by selecting BR2_PACKAGE_XEN_TOOLS=y will have
> everything needed to work.

You are right, this would be better.

(snip)
> > +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> 
> This BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y can also be removed, since it should
> selected by the package.

Absolutely.

> 
> Can you send an updated patch with those changes, please?

Thanks for the feedbacks; I will send a v2 series.

While we are discussing this Xen test, I have another local change, which
detects the toolchain to use at runtime:

- When running on a PC, we can use the external (pre-built) toolchain.
- Otherwise (e.g. on an Arm host), we need to build a toolchain.

This is done in the TestXen class __init__() method, which detects the host
type with `uname -m' and which does a slight modification to its config
string member.
This works for me locally but I wonder if that would be acceptable and if I
should send it; I think that would be a first for a python test.
Can I ask your opinion about this, please?

Best regards,
Vincent.

> 
> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
