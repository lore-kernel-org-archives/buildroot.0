Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA710C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 22:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E732C846BE;
	Thu, 13 Feb 2025 22:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjohQ_uL8O_m; Thu, 13 Feb 2025 22:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C63C846B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C63C846B1;
	Thu, 13 Feb 2025 22:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9EBA199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7067846AC
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPzNLekX-UsW for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 22:54:06 +0000 (UTC)
X-Greylist: delayed 464 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 13 Feb 2025 22:54:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49E37844D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E37844D2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49E37844D2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:54:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 79518352081F; Thu, 13 Feb 2025 23:46:18 +0100 (CET)
Date: Thu, 13 Feb 2025 23:46:18 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Julien Olivain <ju.o@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z652OsALpn1B5OJR@waldemar-brodkorb.de>
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <20250213045050.816782-1-fancp2007@gmail.com>
 <c281fbe54e343bcc61c8e08e623e10a0@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c281fbe54e343bcc61c8e08e623e10a0@free.fr>
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739486778; bh=OrCnqyiUr/MttVudlOaRDomiSrDOZ/a2V5FnXtq+t+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6czhQO9JNxuZpUIYpWudkL6ururzxat4TMsjPUoVYcAdPkw3lsWzLKGyXhZWszBj
 ofeY3a7+6YY9pZOR2b1L0lfDd9yIaaG+9P4Cu1HeqNB54GwfjuiljaAYUoN+UqFqYn
 WrIfJvdSAMNkEfLMiSsAZkEE66sZGv3sEQ0VMXalDWxf0G4qwFLHxkCe05zMRpKieZ
 V518ffFJkuO6nNB5lxa7vRcPWdgBk2AIsPq8kk8+K/ZJbHfajfaXH49suiWJMUObtw
 aBFG3DJi0hiQKTInedNdr4A0qv5x19AWf6Bu5HQTJ5dtX+ayz4ojT7jH23kLQ/d8yu
 5zkpmX+rBH24w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=E6czhQO9
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix build issue since
 bump to 3.49.0
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

Hi Scott,
Julien Olivain wrote,

> On 13/02/2025 05:50, Scott Fan wrote:
> > As of release 3.49.0, the author has replaced the configure script used
> > in
> > the precompiled amalgamation tarball with Autosetup instead of
> > Autotools.
> > 
> > The "autotools-package" and "host-autotools-package" lines are no longer
> > available, so those have to be replaced by the "generic-package" and
> > "host-generic-package" lines in the .mk file.
> > 
> > The Autosetup configuration script does not support the
> > "enable-dynamic-extensions" and "disable-static-shell" options,
> > so the relevant lines in the .mk file are removed.
> > 
> > The Autosetup configuration script can automatically detect whether
> > threads are supported and set the relevant SQLITE_THREADSAFE flag,
> > so the relevant lines in the .mk file are removed.
> > 
> > Fixes:
> >   https://autobuild.buildroot.org/?reason=sqlite-3.49.0
> > 
> > Signed-off-by: Scott Fan <fancp2007@gmail.com>
> 
> Applied to master, thanks.

On master I still get:
ERROR: Explicit --editline failed to find a matching library.

With BR2_PACKAGE_LIBEDIT=y instead of readline support.

Any idea? I am trying to build asterisk.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
