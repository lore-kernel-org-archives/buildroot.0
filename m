Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF65C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09277820EF;
	Mon,  4 Mar 2024 11:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YR2klDIC6O-D; Mon,  4 Mar 2024 11:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7C9820F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7C9820F7;
	Mon,  4 Mar 2024 11:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3851BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 076466061C
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXdLg04wREHh for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 419A760634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419A760634
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 419A760634
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:57:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB00840003;
 Mon,  4 Mar 2024 11:56:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rh6wC-00CfZe-1G;
 Mon, 04 Mar 2024 12:56:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240303204642.2836507-1-peter@korsgaard.com>
 <20240303204642.2836507-2-peter@korsgaard.com>
Date: Mon, 04 Mar 2024 12:56:56 +0100
In-Reply-To: <20240303204642.2836507-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 3 Mar 2024 21:46:41 +0100")
Message-ID: <874jdm2os7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package: drop mysql virtual package
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 David GOUARIN <dgouarin@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>, Kamel Bouhara <kamel.bouhara@gmail.com>,
 Alexey Lukyanchuk <skif@skif-web.ru>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Now that oracle-mysql is dropped there isn't any need for the mysql virtual
 > package.

 > Adjust the other packages to directly use the mariadb symbols.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks. Hopefully I didn't miss anything.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
