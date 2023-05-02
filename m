Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A2CC77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 06:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D5D820C9;
	Tue,  2 May 2023 06:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D5D820C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57TmE5R6HP5r; Tue,  2 May 2023 06:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9C782070;
	Tue,  2 May 2023 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9C782070
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 232FF1BF3C6
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 06:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A59E82073
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 06:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A59E82073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cJRK_IqbJfd for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 06:48:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D4A8204A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7D4A8204A
 for <buildroot@buildroot.org>; Tue,  2 May 2023 06:48:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ECD6724000A;
 Tue,  2 May 2023 06:48:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptjo9-0073EX-VS; Tue, 02 May 2023 08:48:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <20230322162538.19202-1-ps.report@gmx.net>
 <49584ffdabef0920a692639448a2a145@agner.ch>
Date: Tue, 02 May 2023 08:48:17 +0200
In-Reply-To: <49584ffdabef0920a692639448a2a145@agner.ch> (Stefan Agner's
 message of "Mon, 24 Apr 2023 19:34:37 +0200")
Message-ID: <87o7n3b55a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/readline: add upstream patch to
 fix crash with invalid locale specification
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > On 2023-03-22 17:25, Peter Seiderer wrote:
 >> Add upstream patch to fix crash with invalid locale specification (see [1]
 >> for details).
 >> 
 >> Fixes:
 >> 
 >> - https://bugs.busybox.net/show_bug.cgi?id=15456
 >> 
 >> [1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > This fixes a crash seen with bluetoothctl here.

 > Tested-by: Stefan Agner <stefan@agner.ch>

 > Ideally this should be applied to to LTS Buildroot 2023.02 too.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
