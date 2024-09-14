Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D1C0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E5940204;
	Sat, 14 Sep 2024 15:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f08Y4A8XwdUJ; Sat, 14 Sep 2024 15:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3289A4022E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3289A4022E;
	Sat, 14 Sep 2024 15:20:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1311BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA4B4022E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZLBEo0HCdGR for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 588AA40204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588AA40204
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 588AA40204
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:20:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F36440005;
 Sat, 14 Sep 2024 15:20:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1spUZI-0058Ib-39;
 Sat, 14 Sep 2024 17:20:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240827084331.252928-1-peter@korsgaard.com>
Date: Sat, 14 Sep 2024 17:20:12 +0200
In-Reply-To: <20240827084331.252928-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Aug 2024 10:43:30 +0200")
Message-ID: <87h6aiw9cj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH-2024.02.x] package/python3: security bump to
 version 3.11.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - gh-115398: Allow controlling Expat >=2.6.0 reparse deferral
 >   (CVE-2023-52425) by adding five new methods:

 >         xml.etree.ElementTree.XMLParser.flush()
 >         xml.etree.ElementTree.XMLPullParser.flush()
 >         xml.parsers.expat.xmlparser.GetReparseDeferralEnabled()
 >         xml.parsers.expat.xmlparser.SetReparseDeferralEnabled()
 >         xml.sax.expatreader.ExpatParser.flush()

 > - gh-115243: Fix possible crashes in collections.deque.index() when the
 >   deque is concurrently modified.

 > - gh-114572: ssl.SSLContext.cert_store_stats() and
 >   ssl.SSLContext.get_ca_certs() now correctly lock access to the certificate
 >   store, when the ssl.SSLContext is shared across multiple threads.

 > For more details, see the changelog:
 > https://docs.python.org/release/3.11.9/whatsnew/changelog.html#python-3-11-9

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
