Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B28E95A82
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 16:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F59417D4;
	Sun,  8 Oct 2023 16:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F59417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ys4CUvsOlx9G; Sun,  8 Oct 2023 16:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB5C6417C8;
	Sun,  8 Oct 2023 16:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB5C6417C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20C5F1BF3C2
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 16:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE8DB81D5F
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 16:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8DB81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM6iApXUmIKh for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 16:12:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8128B81D18
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 16:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8128B81D18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34E4FFF806;
 Sun,  8 Oct 2023 16:11:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qpWNl-00D1wz-D3; Sun, 08 Oct 2023 18:11:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231006095142.2051641-1-peter@korsgaard.com>
Date: Sun, 08 Oct 2023 18:11:51 +0200
In-Reply-To: <20231006095142.2051641-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 6 Oct 2023 11:51:42 +0200")
Message-ID: <87cyxpdrg8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH-2023.08.x] package/go: security bump to
 version 1.20.9
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2023-39323: Line directives ("//line") can be used to bypass the
 > restrictions on "//go:cgo_" directives, allowing blocked linker and compiler
 > flags to be passed during compilation.  This can result in unexpected
 > execution of arbitrary code when running "go build".

 > go1.20.9 (released 2023-10-05) includes one security fixes to the cmd/go
 > package, as well as bug fixes to the go command and the linker.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.08.x, thanks.

I'll also bump 2023.02.x to this as 1.19.x no longer is getting updates.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
