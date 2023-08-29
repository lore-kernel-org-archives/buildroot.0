Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14852C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9702260F44;
	Tue, 29 Aug 2023 21:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9702260F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_MOrPQlrHmd; Tue, 29 Aug 2023 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2B160DCB;
	Tue, 29 Aug 2023 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2B160DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E88C1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D668F60DCB
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D668F60DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTVl5_hS2tGo for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:31:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 881096080A
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 881096080A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3218AFF804;
 Tue, 29 Aug 2023 21:31:34 +0000 (UTC)
Date: Tue, 29 Aug 2023 23:31:33 +0200
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20230829233133.29a69227@windsurf>
In-Reply-To: <20230829191709.405687-1-bobrofon@gmail.com>
References: <20230829191709.405687-1-bobrofon@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693344694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CizvOdXaZhIBVwOkILp5KvKE0hAyOrXnUsHsJdGHMVs=;
 b=hq4lMrFxvAokHJOZfxpD3/VebnejdbylOHoqdCrv46IYw0K9LyAYl3AclmMjUf3+5fFPXK
 QMV7vlZOszgC1OxLuDFY/W+e64L9N0tuAwtAuHbz6S6UVVFD19swFCU3V3reZ7AcXYvS+b
 J4XOn6BPqADoCeui4w73qHvW3R2QvZ8aQMEnhGaBOTUQUCcve6dQvSgjbpV+jFiJh478uo
 qtX8uIj29EQtqeF9ogGT0hkh9oy5zVjGsWVLEOEW7XtNDStpiphr+OaYXeqOvgfX8XCm+k
 nMtTDTAUCjrdWLF/ue5EupM6NhDrpnWDa0ZNioCPGl0YVpox9h6waIGbcJwWNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hq4lMrFx
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.3.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Tue, 29 Aug 2023 22:17:09 +0300
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.3.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, but this breaks legal-info:

>>> sdbus-cpp 1.3.0 Collecting legal info
COPYING: OK (sha256: 20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331)
ERROR: COPYING-LGPL-Exception has wrong sha256 hash:
ERROR: expected: be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39
ERROR: got     : a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/sdbus-cpp/sdbus-cpp.mk:17: sdbus-cpp-legal-info] Error 1

When you update the hash for the license files, you need to explain in
the commit log why they are changed (by doing a diff of the license
file before/after, and summarize those changes).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
