Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1A4EEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D933660709;
	Thu, 14 Sep 2023 21:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D933660709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJZv6j0FskCz; Thu, 14 Sep 2023 21:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CF160808;
	Thu, 14 Sep 2023 21:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CF160808
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54C041BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2106483A37
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2106483A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjtIKhgbPCGx for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:07:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC02A83A0A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC02A83A0A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02C6F40002;
 Thu, 14 Sep 2023 21:07:30 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:07:30 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230914230730.697c596a@windsurf>
In-Reply-To: <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694725652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTp5l5PZV3aWbgFg4dvRF8GEDuOv10Ksi/z/ew1ZWBQ=;
 b=HG1Yr15bVHkpVK18rRayrfl4UTx8HnKK7COEaQIyLPGzyWtVTvpp/8y0pd57qJgIyEchfh
 mfNk+o4mthk8gheNIhhGtY9TUDwMUtV5x+dPW5AxpDQXsc1Mt+NvYTEkymhNHlNK7Mhv7u
 5uBTsDUXXN0aqy08ETP1QmHlNYFpPs289dz4lhaJBHVu8j76zS7OxCgv25/qCemBQqgsIa
 xxhGai4c3A4uq/iRJymBJzKRI6e0pugg/N/lRC8ntq3AInkA5HZklWxcryiRQ7y9KdAJHv
 4oOnU68M/YmySuGVnJ5hdPt/Ll/BXfXnKk9FPLydKGYm2nRHWrDXvc1dYL2XWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HG1Yr15b
Subject: Re: [Buildroot] [PATCH 5/5] support/download/git: handle git
 attributes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Francois Perrad <fperrad@gmail.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Wed, 13 Sep 2023 00:15:52 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Files in a git repository can be given attributes, like the usual eol
> that can convert to-from crlf, cr, lf when checking-out of committing a
> file.
> 
> There are also two attributes that are meant to be used when generating
> an archive (with git archive): export-subst, and export-ignore, that
> respectively substitutes format placeholders in a file, and excludes a
> file from the archive.
> 
> Some package (e.g. pcm-tools, luajit) use the export-subst attribute
> to generate versioning information. luajit, specifically, uses the UNIX
> timestamp of the commit as the patch-level for its semantic versioning.
> 
> Extend the git backend to handle the export-subst attribute. There is
> no git tool (that we could find) that does that automatically, except
> git-archive, which we can't use. So, we do it manually with a bit of
> trickery where we do use awk to:
> 
>   - identify all files that have the export-subst attribute set,
> 
>   - for each such file, iterate over all the placeholders, and
>     replace them with the expanded format.
> 
> When doing the replacement, we decided to force abbreviating short
> hashes to 40 chars, which is the length of a full sha1, rather than
> actually abbreviating them:
> 
>   - letting git decide of the length is not reproducible over time:
>     as new commits are added, the short length will increase to avoid
>     collisions; a newer git version may decide of a different heuristic
>     to shorten hashes; a user may have a local setting with an arbitrary
>     length;
> 
>   - deciding on our side of an arbitrary value would not be
>     viable long term either, as it might be too large to be minimum, or
>     too short to avoid collisions.
> 
> The only reproducible solution is to use unabbreviated hashes.
> 
> Handling git-attributes also implies that the format of the generated
> archives has changed, since we now expand placeholders, so we bump our
> git format version.
> 
> Of all our git-downloaded packages, 5 are affected:
> 
>   - pcm-tools, which was known, and the one that triggered this commit;
>     since we now expand placeholders, we can drop the post-extract hook;
>     switching to a full hash in replacements also changes the hash of
>     the generated archive;
> 
>   - qt5knx, qt5location, qt5mqtt, and qt5opcua: the file .tag at the
>     repository root, contains only the full hash placeholder; that file
>     is not used at all during the build (AFAICS);
> 
> Finally, we add a run-time test to validate this new feature.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Woody Douglass <wdouglass@carnegierobotics.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Francois Perrad <fperrad@gmail.com>

I am not totally convinced by this. I recognize the massive efforts
that have been into these complex awk scripts, but there are a few
reasons why I dislike it:

(1) It's complex/non-obvious

(2) It fixes a problem in only one single package, which is already
    fixed in a package-specific way, and we don't have visibility on
    many more packages adopting this.

(3) It bumps the Git tarball version, which is going to cause breakage
    to *all* downstream users of Buildroot which have custom packages
    retrieved from Git (and there are probably thousands of these in
    the numerous companies using Buildroot). So causing so much hassle
    to our users for the gain of fixing one package in Buildroot is IMO
    not a good trade-off.

Of course, I can be convinced that I'm wrong, but I'm not too convinced
at the moment. And of course (again), Peter and Arnout are definitely
welcome to disagree and overrule me :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
