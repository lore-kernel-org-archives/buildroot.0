Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ACC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D41860FC7;
	Wed, 10 Jul 2024 09:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEgOx9vSCrJs; Wed, 10 Jul 2024 09:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561E960FA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561E960FA4;
	Wed, 10 Jul 2024 09:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D24CF1BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE005413E7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N08EybvXXXEY for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:16:32 +0000 (UTC)
X-Greylist: delayed 3731 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Jul 2024 09:16:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 442A141460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442A141460
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 442A141460
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:16:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 951961814B9; Wed, 10 Jul 2024 11:16:24 +0200 (CEST)
In-Reply-To: <20240710104842.16dbf85c@windsurf>
References: <20240710081348.60978-1-buildroot@heine.tech>
 <20240710104842.16dbf85c@windsurf>
Date: Wed, 10 Jul 2024 11:16:24 +0200
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <25518-668e5180-5-147108a0@236288521>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720602986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=huzxZceb0/8SfGNpu2wBKh0JyA+EaqEqlFlaqCIHqAY=;
 b=iC2sooNIStliYhfa8DNT6heAM3MCbDDxQpUrgaiioa3eDiIFbOBghewy8ZH01kBjseEXCx
 7c2ON+r/eODdQHWrWlYLk1/+5wmH80FE/eC5pWU6mF7ovvwHTaS6iMGN06UGlxZ8xGQ18l
 H3okzflEHl5u5Y2Hl7rorTkiTh8o/14=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=iC2sooNI
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/sqlitecpp=3A_new_packa?=
 =?utf-8?q?ge?=
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

thanks for applying so quickly.

On Wednesday, July 10, 2024 10:48 CEST, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Wed, 10 Jul 2024 10:13:47 +0200
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > SQLiteC++ (SQLiteCpp) is a lean and easy to use C++ SQLite3 wrapper.
> > 
> > http://srombauts.github.io/SQLiteCpp/
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Thanks, I have applied after doing some changes, see below.
> 
> 
> > diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
> > new file mode 100644
> > index 0000000000..02b2d8989c
> > --- /dev/null
> > +++ b/package/sqlitecpp/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_SQLITECPP
> > +	bool "SQLiteC++"
> 
> Changed to:
> 
> 	bool "sqlitecpp"
> 
> Indeed, we really want the prompt to be the same as the package name.
> 
> > +	select BR2_PACKAGE_SQLITE
> > +	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
> 
> Since it's written in C++, you forgot:
> 
> 	depends on BR2_INSTALL_LIBSDCPP
> 
> and the corresponding Config.in comment saying that the toolchain needs
> to have C++ support.
> 

I totally forgot about this, thanks for fixing.

One additional thing: This library requires C++11, I think all compilers we have currently in buildroot should
be recent enough to support it. Or do we need a gcc version check here as well?

Related: I'm currently looking at bumping boost. And in the last versions many libs dropped their support for C++98.
So if we could just rely on the availability of C++11 this would make this much easier.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
