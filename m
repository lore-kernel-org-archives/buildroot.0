Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BCC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C93415FF;
	Tue, 30 May 2023 19:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C93415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGx_Lm1kwMa9; Tue, 30 May 2023 19:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 642EC415FC;
	Tue, 30 May 2023 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642EC415FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA251BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34108415FC
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34108415FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXtwrzppQpoX for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:25:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B24340289
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B24340289
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:25:41 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E07A81C0004;
 Tue, 30 May 2023 19:25:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q44yQ-009rGL-2C; Tue, 30 May 2023 21:25:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230325181958.25542-1-ps.report@gmx.net>
Date: Tue, 30 May 2023 21:25:37 +0200
In-Reply-To: <20230325181958.25542-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 25 Mar 2023 19:19:58 +0100")
Message-ID: <878rd5pqoe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libcurl: disable NTLM support
 definitely
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - do not only disable NTLM delegation to winbinds ntlm_auth but
 >   disable NTLM support overall (and drop enforced libopenssl DES
 >   dependency introduced by 'package/libcurl: make sure openssl
 >   supports DES' (commit f25c820a4f93ad0ca7eaf5e504667bd4099b878c)
 > - change man page hint to https URL
 > - rearrange configure options to one option per line

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Patch works for libcurl-7.88.1 and libcurl-8.0.1

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
