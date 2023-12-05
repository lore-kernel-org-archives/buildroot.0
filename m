Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC40C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 09:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27493820B0;
	Tue,  5 Dec 2023 09:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27493820B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRvSB1qF8ISE; Tue,  5 Dec 2023 09:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D9E81E86;
	Tue,  5 Dec 2023 09:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D9E81E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 726BC1BF2AA
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 09:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49C3C4012F
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 09:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C3C4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GaUSx-BcsHxH for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 09:41:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8598D400D6
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 09:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8598D400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C75A240005;
 Tue,  5 Dec 2023 09:41:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rARvk-00C0W6-2Y;
 Tue, 05 Dec 2023 10:41:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
References: <20231205055144.74622-1-fido_max@inbox.ru>
Date: Tue, 05 Dec 2023 10:41:28 +0100
In-Reply-To: <20231205055144.74622-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Tue, 5 Dec 2023 08:51:43 +0300")
Message-ID: <87bkb5t29j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 15.5
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:

 > Release notes:
 > https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/

 > Fixes CVE-2023-5868, CVE-2023-5869, CVE-2023-5870.

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Huh, you already sent (and Yann applied) this change back on Nov 23rd?

> ---
 >  package/postgresql/postgresql.hash | 4 ++--
 >  package/postgresql/postgresql.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
 > index 0640f883a7..4fc3bfcff0 100644
 > --- a/package/postgresql/postgresql.hash
 > +++ b/package/postgresql/postgresql.hash
 > @@ -1,4 +1,4 @@
 > -# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2.sha256
 > -sha256  baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9  postgresql-15.4.tar.bz2
 > +# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
 > +sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
 >  # License file, Locally calculated
 >  sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
 > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
 > index b951b14aa0..3108fe65e1 100644
 > --- a/package/postgresql/postgresql.mk
 > +++ b/package/postgresql/postgresql.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -POSTGRESQL_VERSION = 15.4
 > +POSTGRESQL_VERSION = 15.5
 >  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 >  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 >  POSTGRESQL_LICENSE = PostgreSQL
 > -- 

 > 2.40.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
