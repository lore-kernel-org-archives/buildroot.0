Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B87FC25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED24060873;
	Sun, 26 May 2024 20:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOIv9WDRee1k; Sun, 26 May 2024 20:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06B5860789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B5860789;
	Sun, 26 May 2024 20:46:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B03461D140A
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB874024A
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2seV3M1OZkj for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 900534023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900534023F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 900534023F
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03D8120002;
 Sun, 26 May 2024 20:46:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBKkz-004S5u-1D;
 Sun, 26 May 2024 22:46:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-6-ps.report@gmx.net>
Date: Sun, 26 May 2024 22:46:17 +0200
In-Reply-To: <20240506144555.31709-6-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Mon, 6 May 2024 16:45:48 +0200")
Message-ID: <8734q4fgiu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 5/8] package/x11r7/Config.in: source
 argument needs quotation marks
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following error/warnings with kconfig from linux-6.9-rc5:
 >   package/x11r7/Config.in:14: syntax error
 >   package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
 >   package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
 >   package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
 >   package/x11r7/Config.in:14:warning: ignoring unsupported character '.'
 >   package/x11r7/Config.in:14: invalid statement
 >   [...]

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
