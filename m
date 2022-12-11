Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C9AC4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6ACF60BC4;
	Sun, 11 Dec 2022 13:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6ACF60BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMKG9d2UGNlZ; Sun, 11 Dec 2022 13:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFBB60BB8;
	Sun, 11 Dec 2022 13:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDFBB60BB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4661BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 729154091E
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729154091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJGROQW4IMs9 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:21:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBDD40917
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDBDD40917
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:21:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA036C0002;
 Sun, 11 Dec 2022 13:21:52 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:21:51 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211142151.74caa9d6@windsurf>
In-Reply-To: <20221208202104.3041-1-fontaine.fabrice@gmail.com>
References: <20221208202104.3041-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9niGWznbwonhCYA57JiRX4mgKI08Cq009gCf6erH7lQ=;
 b=aOgaNc5eTIMCVBbdPe1Uhgu+BetfJSQCHDh1xe4zhXzE2rzUDsXduJrzM5ONgZQ9d8Rkiw
 EM7vh7s6oG2OkDKioZHVrQS6MC9bvSD1/ixA1hvxQDOFz/bW0re1Ie6vKT/QArtD9xyXa4
 YDep3NCw7w0oEjco4E5Zq8gMUPjRPe9bOK+a3qQPxGEPEfY3z74WdxfVD7DLqzO44WF+Sq
 eKj+FUzFhfJUwFqT/3VWHX8+Bvi0F36UqPA/TcclLWgIrM5pGOfLDq8N8glRcATqbCax/2
 R++dlJ2YIuDJ6iUw3mXOZ4jhORC+jaZtsjZEJEEoRVgfgFHGd96bBE78TN5NMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aOgaNc5e
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: security bump to
 version 0.9.2
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
Cc: Koen Martens <gmc@sonologic.nl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 21:21:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-46149: Cap'n Proto is a data interchange format and remote
> procedure call (RPC) system. Cap'n Proro prior to versions 0.7.1, 0.8.1,
> 0.9.2, and 0.10.3, as well as versions of Cap'n Proto's Rust
> implementation prior to 0.13.7, 0.14.11, and 0.15.2 are vulnerable to
> out-of-bounds read due to logic error handling list-of-list. This issue
> may lead someone to remotely segfault a peer by sending it a malicious
> message, if the victim performs certain actions on a list-of-pointer
> type. Exfiltration of memory is possible if the victim performs
> additional certain actions on a list-of-pointer type. To be vulnerable,
> an application must perform a specific sequence of actions, described in
> the GitHub Security Advisory. The bug is present in inlined code,
> therefore the fix will require rebuilding dependent applications. Cap'n
> Proto has C++ fixes available in versions 0.7.1, 0.8.1, 0.9.2, and
> 0.10.3.
> 
> https://github.com/capnproto/capnproto/security/advisories/GHSA-qqff-4vw4-f6hx
> https://dwrensha.github.io/capnproto-rust/2022/11/30/out_of_bounds_memory_access_bug.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/capnproto/capnproto.hash | 2 +-
>  package/capnproto/capnproto.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
