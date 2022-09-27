Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED48EC07E9D
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 08:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F27408A7;
	Tue, 27 Sep 2022 08:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F27408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIgy9ho8CHX0; Tue, 27 Sep 2022 08:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E8740650;
	Tue, 27 Sep 2022 08:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E8740650
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 215941BF2F9
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F23A181B04
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23A181B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzthRlhri9XI for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 08:03:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C2A81469
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C2A81469
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 08:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 32D2A1814BA
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 10:03:06 +0200 (CEST)
To: buildroot@buildroot.org
User-Agent: SOGoMail 5.7.0
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 10:03:06 +0200
Message-ID: <11a232-6332ae00-1-66eb0300@54871508>
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1664265786; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=OssUAqpGx63uxYeA0ER1iLvcxwPajrN5IzJIfXSugUM=;
 b=Gc23gIS3pfLUAtx4HpOxScWZWbul1qdkHb0Iig1G3Q5540GmrcSAckqPdDXN4QPBosVVVt
 jiW2Dq9BqloNB8v+A+uAPKD71E7rkfaEbKR9+hwjIP1EJIRr2xOVB4SELnXkg4xVsraGhg
 OtRrECI9Pcrf3dXcAQo8pfPRuJbD4r4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Gc23gIS3
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_3/3=5D_package/wpewebkit=3A__bump?=
 =?utf-8?q?_to_version_2=2E38=2E0?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Adrian,

On Wednesday, September 21, 2022 21:08 CEST, Adrian Perez de Castro <aperez@igalia.com> wrote:

> Hello Thomas, all,
> 
> On Wed, 21 Sep 2022 20:18:54 +0200 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > Hello Adrian,
> > 
> > On Wed, 21 Sep 2022 02:00:29 +0300
> > Adrian Perez de Castro <aperez@igalia.com> wrote:
> > 
> > > Update to a new major release which brings in improvements and a few
> > > new features. Release notes:
> > > 
> > >   https://wpewebkit.org/release/wpewebkit-2.38.0.html
> > > 
> > > This release also includes security fixes for CVE-2022-32886,
> > > CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:
> > > 
> > >   https://wpewebkit.org/security/WSA-2022-0009.html
> > 
> > According to this page, CVE-2022-32891 only affects versions up 2.36.5,
> > and we're using 2.36.7 in Buildroot.
> > 
> > Also according to this page, the two other CVEs have been fixed in
> > 2.36.8.
> > 
> > So, could you rework this patch series to:
> > 
> >  - Have a first patch "package/wpewebkit: security bump to version
> >    2.36.8", which does bump to 2.36.8
> > 
> >  - Has the patches updating libwpe, wpebackend-fdo.
> > 
> >  - Has the patch updating wpewebkit to 2.38.0
> 
> Of course, no problem. I'll send an update in the next days.
> 
> > Indeed, we will want to backport the 2.36.8 bump to our stable branch,
> > as it contains security fixes.
> 
> Makes sense. Allowing LTS/stable distros to pick the update more easily is
> one of the reasons why I made one more 2.36.x with the fixes :)
> 

Would you mind to also submit the NEON Patch separately or with the 2.36.x patch
so it can be applied to the 2022.08 branch? I'm currently using it as external patch
and it works fine.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
