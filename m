Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E51C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAA582C99;
	Thu,  9 Jun 2022 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeQxOxsUBCFg; Thu,  9 Jun 2022 20:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1307E82893;
	Thu,  9 Jun 2022 20:48:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4615B1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F4B41C32
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mTUUwNB2A-E for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:48:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FB47410B8
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:48:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23852C0002;
 Thu,  9 Jun 2022 20:48:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzP5D-002NMh-VR; Thu, 09 Jun 2022 22:48:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dimi Tomov <dimi@tpm.dev>
References: <20220605124749.719103-1-dimi@tpm.dev>
Date: Thu, 09 Jun 2022 22:48:47 +0200
In-Reply-To: <20220605124749.719103-1-dimi@tpm.dev> (Dimi Tomov's message of
 "Sun, 5 Jun 2022 15:47:49 +0300")
Message-ID: <877d5pzhow.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix missing CA bundle
 when wolfssl is SSL/TLS provider
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

>>>>> "Dimi" == Dimi Tomov <dimi@tpm.dev> writes:

 > From: Dimitar Tomov <dimi@tpm.dev>
 > Without CA bundle curl can not verify the remote peer and work with https.
 > This is fixed by adding a config option pointing to the default location
 > for CA bundle in buildroot. Alternatives like OpenSSL and MbedTLS use the
 > same path, however the wolfSSL build options for libcurl did not include
 > this path until now.

 > Signed-off-by: Dimitar Tomov <dimi@tpm.dev>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
