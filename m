Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A6CCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93DF6068F;
	Fri, 13 Oct 2023 14:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93DF6068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIjANSc4i9Hu; Fri, 13 Oct 2023 14:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D90860687;
	Fri, 13 Oct 2023 14:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D90860687
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBD41BF33A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35E4061045
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E4061045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uC1UZbPn0RUN for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:38:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47AB660687
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47AB660687
Received: by mail.gandi.net (Postfix) with ESMTPSA id D64C1C0003;
 Fri, 13 Oct 2023 14:38:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJIt-007JJk-Gg; Fri, 13 Oct 2023 16:38:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231001100009.468927-1-fontaine.fabrice@gmail.com>
Date: Fri, 13 Oct 2023 16:38:15 +0200
In-Reply-To: <20231001100009.468927-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Oct 2023 12:00:09 +0200")
Message-ID: <87wmvq4mg8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libressl build
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fox the following build failure with libressl raised since bump to
 > version 4.1.1 in commit 683563da8095c2eb69e677402b9bef7217ae90d9 and
 > https://github.com/syslog-ng/syslog-ng/commit/bc05f28a4b511ac9090195280163a7f822712ceb:

 > lib/transport/tls-context.c: In function 'tls_context_setup_cmd_context':
 > lib/transport/tls-context.c:320:3: error: unknown type name 'SSL_CONF_CTX'; did you mean 'SSL_AEAD_CTX'?
 >   320 |   SSL_CONF_CTX *ssl_conf_ctx = SSL_CONF_CTX_new();
 >       |   ^~~~~~~~~~~~
 >       |   SSL_AEAD_CTX

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dc4d60d752e579ef054915eee3d7e3e73c25929b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
