Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB7C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0664D6078C;
	Sat, 16 Mar 2024 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAwrKYeVpsXU; Sat, 16 Mar 2024 20:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B62606C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B62606C7;
	Sat, 16 Mar 2024 20:47:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA3AE1BF391
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9492F40151
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TR7TtmiIv6rY for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 20:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6884740141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6884740141
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6884740141
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 20:46:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81BCE0002;
 Sat, 16 Mar 2024 20:46:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlavd-001H8B-0r;
 Sat, 16 Mar 2024 21:46:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240211214348.E9E8A877CD@busybox.osuosl.org>
Date: Sat, 16 Mar 2024 21:46:53 +0100
In-Reply-To: <20240211214348.E9E8A877CD@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 11 Feb 2024 22:43:00 +0100")
Message-ID: <87o7bdnbuq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.2.1
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ce4d278739953c830cea0c017836f26ceabef63a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > And drop the now upstreamed patches.

 > Fixes the following (low severity) issues:

 > - CVE-2023-6129 POLY1305 MAC implementation corrupts vector registers on
 >   PowerPC
 >   https://www.openssl.org/news/secadv/20240109.txt

 > - CVE-2023-6237 Excessive time spent checking invalid RSA public keys
 >   https://www.openssl.org/news/secadv/20240115.txt

 > - CVE-2024-0727 PKCS12 Decoding crashes
 >   https://www.openssl.org/news/secadv/20240125.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

For 2023.11.x I have instead bumped to 3.1.5, which contains the same
fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
