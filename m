Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B609D59F6E
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF28D608B8;
	Wed,  6 Nov 2024 20:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxRki42hyYG9; Wed,  6 Nov 2024 20:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF9A860732
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9A860732;
	Wed,  6 Nov 2024 20:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36A733B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B406074F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVlcEeH1HwcW for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D717C60731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D717C60731
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D717C60731
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F04AB40003;
 Wed,  6 Nov 2024 20:10:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t8mMU-000ORR-1P;
 Wed, 06 Nov 2024 21:10:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB06086CBB5E8C0ED17299DE82A9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Date: Wed, 06 Nov 2024 21:10:42 +0100
In-Reply-To: <AS1P250MB06086CBB5E8C0ED17299DE82A9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 (Michel Alex's message of "Mon, 4 Nov 2024 12:41:44 +0000")
Message-ID: <875xp0f7i5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 1.0.1
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

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

 > https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.1
 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
 > ---
 >  package/libzenoh-c/libzenoh-c.hash | 2 +-
 >  package/libzenoh-c/libzenoh-c.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
 > index 3472494355..124128736e 100644
 > --- a/package/libzenoh-c/libzenoh-c.hash
 > +++ b/package/libzenoh-c/libzenoh-c.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  80e3144ebd82bdbfb43ff10e7f22047826adbbe0d0ed0081b215924a6c1bdb6c  libzenoh-c-1.0.0-cargo2.tar.gz
 > +sha256  7765bc1bdbab608da4770db7624ec868ac3cdf7e63707d7aff406d85558bfc15  libzenoh-c-1.0.1-cargo2.tar.gz
 >  sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
 > diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
 > index c474d98b07..4b3982525a 100644
 > --- a/package/libzenoh-c/libzenoh-c.mk
 > +++ b/package/libzenoh-c/libzenoh-c.mk
 > @@ -7,7 +7,7 @@
 >  # This 1.0.0 version is really newer than 1.0.0.12, so please don't
 >  # update 1.0.0 even if release-monitoring.org claims it's a newer
 >  # version.

1.0.1 sorts after 1.0.0.12, so we can now drop this comment. Commited
with this removed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
