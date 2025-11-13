Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633B3CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034D38376D;
	Thu, 13 Nov 2025 09:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MHEG47l4wZt; Thu, 13 Nov 2025 09:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6FA83753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6FA83753;
	Thu, 13 Nov 2025 09:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87185158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79145406E5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N3M0L__JvLk for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E6AC4085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E6AC4085D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E6AC4085D
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:51:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1893215301; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:51:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTzM-002Bl2-33;
 Thu, 13 Nov 2025 10:51:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-13-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:51:36 +0100
In-Reply-To: <20251106204522.3273683-13-bernd@kuhls.net> (Bernd Kuhls's
 message of "Thu, 6 Nov 2025 21:45:19 +0100")
Message-ID: <87ikfentuf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Tw+xKUiM2C0kkqW9YUrF6LIX3+dj32ECC25gwkx3UMirdpDMLd6bMKYW5u3TLeMCaMIacxMHeHk3qJWyuQwNipM7kkXK6Gl8cqVG5Z4NFlvg7qx7Al/ulNEutFtuUuWCHjEyn9b8dEVHYyLf9+Sx/lM/cao8GsS5TRBlGUo3D+Z9DIvpZrTXcaqw+fts7pNS5Q9STycBTlL/1iUGp3Y0tisw2Hq2afK7KWtRr7Ni1OMFjIvWq+eU3lHfYDgW0fDjUnTqdezQpuFoBhvqfckj2rrh6ZGV965p3BdgrdrjRzweQ4V7V8kWmA2SXVHjH9ufoxWj+ap06MxfGGvurZLI5A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=dxEXuAuf8DTohQLg1aq3oACQVnE4aMfe8z7tjprUb8k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Tw+xKUiM
Subject: Re: [Buildroot] [PATCH v3 12/14] package/dvbsnoop: remove package
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The package is causing build errors with newer gcc versions:
 > sectables.c:331:22: error: initialization of 'void (*)(void)' from
 >  incompatible pointer type 'void (*)(unsigned char *, int)'
 >  [-Wincompatible-pointer-types]
 >   331 |      {  0x00, 0x00,  section_PAT        },

 > and many more.

 > The latest release dates back to 2007, the latest change in the CVS-
 > based source repository[1] (downloaded as dvbsnoop.zip) is also from
 > 2007. No newer or maintained forks were found.

 > State of upstream ticket system[2]:

 >   Bugs: last update 2012
 >   Support Requests: No open tickets found.
 >   Patches: last update 2010
 >   Feature Requests: 1 from 2021, the rest 2012 and older

 > Instead of fixing build errors for an unmaintained project which is not
 > used by any other package we remove it from buildroot.

 > Fixes:
 > https://autobuild.buildroot.net/results/ea6/ea6786248b9ecf0eb1c1c1f7cdd0202462b75e00/

 > [1] https://sourceforge.net/p/dvbsnoop/cvs/
 > [2] https://sourceforge.net/p/dvbsnoop/_list/tickets

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
