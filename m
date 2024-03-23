Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9ECD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE11E4061C;
	Sat, 23 Mar 2024 12:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLembsf3My0R; Sat, 23 Mar 2024 12:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A3D404D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A3D404D7;
	Sat, 23 Mar 2024 12:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 190CA1BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12E6F60654
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56FAn9LV_khv for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAA6B6064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA6B6064A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAA6B6064A
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:38:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D35660002;
 Sat, 23 Mar 2024 12:38:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro0da-006rkh-1m;
 Sat, 23 Mar 2024 13:38:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
References: <20240310065735.1074171-1-fido_max@inbox.ru>
Date: Sat, 23 Mar 2024 13:38:14 +0100
In-Reply-To: <20240310065735.1074171-1-fido_max@inbox.ru> (Maxim Kochetkov's
 message of "Sun, 10 Mar 2024 09:57:35 +0300")
Message-ID: <871q8115u1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2023.11.x 1/1] package/postgresql: security
 bump version to 15.6
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

>>>>> "Maxim" == Maxim Kochetkov <fido_max@inbox.ru> writes:

 > Release notes: https://www.postgresql.org/docs/release/15.6/
 > Fixes CVE-2024-0985.

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
 > ---
 >  package/postgresql/postgresql.hash | 4 ++--
 >  package/postgresql/postgresql.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
 > index 4fc3bfcff0..c1ec8e89c8 100644
 > --- a/package/postgresql/postgresql.hash
 > +++ b/package/postgresql/postgresql.hash
 > @@ -1,4 +1,4 @@
 > -# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
 > -sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
 > +# From https://ftp.postgresql.org/pub/source/v15.6/postgresql-15.6.tar.bz2.sha256
 > +sha256  8455146ed9c69c93a57de954aead0302cafad035c2b242175d6aa1e17ebcb2fb  postgresql-15.6.tar.bz2
 >  # License file, Locally calculated
 >  sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT

You forgot to update the copyright hash (2023 changed to 2024 in
copyright info).

Committed to 2023.02.x and 2023.11.x with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
