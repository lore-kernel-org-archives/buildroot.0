Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF2C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B4940457;
	Tue, 20 Aug 2024 19:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kd8heWwiv0IL; Tue, 20 Aug 2024 19:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1630A40B0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1630A40B0D;
	Tue, 20 Aug 2024 19:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E75C21BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D47564018F
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFnruTCR45nW for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE83A4016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE83A4016D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE83A4016D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:46:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EF0D1BF206;
 Tue, 20 Aug 2024 19:46:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgUoQ-000FKL-2B;
 Tue, 20 Aug 2024 21:46:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240212000058.3000442-1-buildroot@bubu1.eu>
Date: Tue, 20 Aug 2024 21:46:38 +0200
In-Reply-To: <20240212000058.3000442-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Mon, 12 Feb 2024 01:00:57 +0100")
Message-ID: <87wmkbdlk1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing: add python-msgpack runtime
 test
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 >  .../testing/tests/package/sample_python_msgpack.py   |  5 +++++
 >  support/testing/tests/package/test_python_msgpack.py | 12 ++++++++++++
 >  2 files changed, 17 insertions(+)
 >  create mode 100644 support/testing/tests/package/sample_python_msgpack.py
 >  create mode 100644 support/testing/tests/package/test_python_msgpack.py

 > diff --git a/support/testing/tests/package/sample_python_msgpack.py b/support/testing/tests/package/sample_python_msgpack.py
 > new file mode 100644
 > index 0000000000..1940f70821
 > --- /dev/null
 > +++ b/support/testing/tests/package/sample_python_msgpack.py
 > @@ -0,0 +1,5 @@
 > +import msgpack
 > +
 > +packaed = msgpack.packb([1, 2, 3], use_bin_type=True)

packaed? Did you mean packaged or packed?

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
