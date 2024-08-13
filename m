Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3707DC3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 02:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C496084B;
	Tue, 13 Aug 2024 02:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExZhLjfyrAaq; Tue, 13 Aug 2024 02:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A636082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A636082E;
	Tue, 13 Aug 2024 02:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9CC1BF484
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 02:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5358400D1
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 02:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkVzULQqS9V5 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 02:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 601E6400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601E6400C6
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 601E6400C6
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 02:38:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 261AC35211D6; Tue, 13 Aug 2024 04:38:17 +0200 (CEST)
Date: Tue, 13 Aug 2024 04:38:16 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrrHFxKYcuOWR/Cw@waldemar-brodkorb.de>
References: <ZrkCqifa1uXZ6QBQ@waldemar-brodkorb.de>
 <20240812212947.1c5c11cd@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812212947.1c5c11cd@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723516698; bh=+uHAlC05R/cNOoz0WL09xfjuSAUS27INCH1zWnCYInQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXEgPi+LWsl6JA3J/7y41d7fKmS6jU0QDblRAe1dOAiAk2i4LIKxH5o6o9zYdSg4C
 CMfQYSuuClZnwCVz4r3cxJQ0v7OSlN3uCJ5P52M2B2WKFjrzGwh0z+a1DfAmDbbiOc
 ww+uMu1haz8xoxOGU3AIqXezcvVdJboUWSWOw+mPXudMUGwGRmFHTi5mH9yisogyzH
 f6gLPllyO2Vj2atQMmViU8zaEhCtZZTRIOOFvCAoC8BTgKbqXRHU8/w/k22ho+kg8T
 VxeXW1NhkqsPN24zsyLC+Vs20lTu3kLxXPuUJmA7F6u9EysSRZjxP5GBxHoxVmTION
 Q84MWQwzRVvUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=rXEgPi+L
Subject: Re: [Buildroot] [PATCH] package/uclibc: add memfd_create syscall
 wrapper
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Sun, 11 Aug 2024 20:27:54 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  ...005-add-memfd_create-syscall-wrapper.patch | 467 ++++++++++++++++++
> >  1 file changed, 467 insertions(+)
> >  create mode 100644 package/uclibc/0005-add-memfd_create-syscall-wrapper.patch
> 
> Applied to next, thanks. What about cutting a 1.0.50 uClibc-ng release?
> The number of commits since 1.0.49 isn't huge, but they are almost all
> fixes.

Yes, you are right. I have cut a release. 1.0.50 is out.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
