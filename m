Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F0C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2376141C7D;
	Sat, 18 Feb 2023 11:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2376141C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRyQmlxoseE5; Sat, 18 Feb 2023 11:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2749941BD1;
	Sat, 18 Feb 2023 11:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2749941BD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8EA81BF3D8
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 963ED41BD1
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 963ED41BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLe7xa6th3fC for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:49:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F18941BB9
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F18941BB9
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id C9DC81814B9
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 12:49:01 +0100 (CET)
In-Reply-To: <20230218112449.1753677-1-buildroot@heine.tech>
Date: Sat, 18 Feb 2023 12:49:01 +0100
To: buildroot@buildroot.org
MIME-Version: 1.0
Message-ID: <10cdb9-63f0bb00-3-1c95df6@32750985>
User-Agent: SOGoMail 5.8.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676720941; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=3+0dHK+I2IGqEjSLs6MJJQCTDbxeRNarsapPnUEBGPs=;
 b=WxRUj/Zve0yb+YmxUvztbdMaC5C0ND6gUQLS/jd7TQRui9SInPfOnt+m4zZywyySdv6YGA
 s81sQetkNUXOWv8808m/C+XmFuCG+Xf13Gse0TJWyVZa5EpJe0JsL7P1HwR/tcMpdK703b
 IvO3rXIMMa3PSmux+ehjP2rvf/kX4UA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=WxRUj/Zv
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/catch2=3A_bump_to_vers?=
 =?utf-8?b?aW9uIDMuMy4x?=
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

On Saturday, February 18, 2023 12:24 CET, Michael Nosthoff <buildroot@heine.tech> wrote:

> raise the minimum gcc to 5 as stated in release notes for 3.1.0 [0].
> 
> [0] https://github.com/catchorg/Catch2/releases/tag/v3.1.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
