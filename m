Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A35C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 15:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD5C160FA3;
	Tue,  1 Feb 2022 15:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSNryj5XMS81; Tue,  1 Feb 2022 15:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF03960F34;
	Tue,  1 Feb 2022 15:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B338A1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 15:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A12E2415F9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MF5Myi_kfKJ0 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 15:16:22 +0000 (UTC)
X-Greylist: delayed 00:06:30 by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80350415EF
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 15:16:22 +0000 (UTC)
Received: from opfedar02.francetelecom.fr (unknown [xx.xx.xx.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar25.francetelecom.fr (ESMTP service) with ESMTPS id 4Jp7dV52ylz8t51; 
 Tue,  1 Feb 2022 16:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1643728190;
 bh=7zYL/tchCTjKBv2W3BFF3fEKtjgBsSBk0K/5DrXHJCs=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=j/gTyAEN/hc3w4ScPYf4vbV6o80OZWTbYFj4Zv3YtXa+CgJunbCrKsdKreyagRDU5
 DeWVvLI5HTvTEM3wpFphjiHXzjRydA3QhnsEFujQw3Tf8FjGyh50w0xj6K2nw3dkRE
 yFVOtgDkJ1iiUPrlIvwvZM3WRArUrXqOw1Y5SfhcOYp3bLdgHKCBJpaJqNEUISTqwp
 fXvZIhCgmUm7qi4MsX/HOKEnY1Yt3Hm2nIOfvXhvF1bj1hl6xXd0RDgLG4hR4QPExb
 H9JWEJYO9jeySjQB8FNw95+pAyBqmvy813fEDzkIW+OrJdfywtTyCMe15r9Bg9sjTm
 95YOnS3RgTblw==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 01 Feb 2022 16:09:48 +0100
Date: Tue, 1 Feb 2022 16:09:48 +0100
From: <yann.morin@orange.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <22491_1643728190_61F94D3E_22491_62_1_20220201150948.GB3216@tl-lnx-nyma7486>
References: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
 <MWHPR1201MB0239B756E843D8604AD86625A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1201MB0239B756E843D8604AD86625A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
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
Cc: Frederic GARDES <frederic.gardes@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2022-02-01 14:23 +0000, Alexey Brodkin spake thusly:
[--SNIP--]
> > +config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
> > +       string "Oldest kernel version supported"
> > +       help
> > +         If you plan on running on various kernel versions, enter the
> > +         oldest version you expect to run on here.
> > +
> > +         Note that the older the version, the more backward compatibility
> > +         code is added, and the slower the code may get.
> > +
> > +         Leave it empty (the default) to use the same version as used for
> > +         the kernel headers.
> I'd say there's the third option and frankly I like this one the most - default
> oldest version assumed by the glibc itself. The beauty of it is it's really the
> oldest version of the kernel which is supported by a given glibc version for
> a particular architecture.

I also considered that, but I believe that a user should explicitly
request the oldest kernel they want to support (yes, they'd have to do
their homework to see what that version can be for their architecture).
Letting the system decide on itself is prone to providing some
surprises... However, letting the user provide an explicit version is
also prone to surprises, because if that version is too old, glibc
resets it to the oldest it actually supports, and just merely emits a
warning message, which does not prevent the build to succeed (it still
fails at runtime in the usual way then)...

So, in either case, meh...

So, we'd have to differentiate between the three cases:
  - use same as headers (should be the default to keep current
    behaviour)
  - use oldest supported by glibc
  - use explcitly specified version

So, two options there:

  - recognise a magical value in BR2_PACKAGE_GLIBC_KERNEL_COMPAT, like
    'oldest' (bikeshed, go) to mean the oldest glibc can support, empty
    to mean "same as headers", or an actual value.

  - add a boolean "Specify oldest kernel supported", and hide
    BR2_PACKAGE_GLIBC_KERNEL_COMPAT behind that boolean; then if the
    boolean is not set, use same as headers (as today); if it is set,
    then use BR2_PACKAGE_GLIBC_KERNEL_COMPAT is set, or let glibc decide
    if not set.

Thoughts?

Needless to say, I don't have much sympathy for the first option,
magical values are bad... But I am not too fond of the second option
either, but I can't see a better way to provide for the three different
cases...

> [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=configure;h=8e5bee775a651fcbaaa96ede8039ae1f049e296e;hb=HEAD#l3529
> [2] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/configure.ac;h=197b7e66c8fe6eb0a1136c992478b9a2272713e7;hb=HEAD#l30

Yeah, I already had a look at those for various archs.

Thanks!

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

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
