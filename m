Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4229C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 12:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 838FC60655;
	Sat,  4 Mar 2023 12:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838FC60655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMlwy4mIX3_i; Sat,  4 Mar 2023 12:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A0A605DB;
	Sat,  4 Mar 2023 12:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A0A605DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED48F1BF228
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D45F080DB3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45F080DB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PenZ81d3MdRb for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 12:58:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A018136E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6A018136E
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 12:58:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEB42E0003;
 Sat,  4 Mar 2023 12:58:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYRSb-00GikI-EE; Sat, 04 Mar 2023 13:58:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230215213211.C420185EA0@busybox.osuosl.org>
Date: Sat, 04 Mar 2023 13:58:01 +0100
In-Reply-To: <20230215213211.C420185EA0@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 15 Feb 2023 22:28:58 +0100")
Message-ID: <874jr0ekrq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] docs/manual: add 'menuconfig' to
 out-of-tree examples
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c77e31e0b360fffbd893807ccfbc4f35bf2558d1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > If the examples given for launching an out-of-tree build are executed
 > as-is, this will result in the error message

 >     Please configure Buildroot first (e.g. "make menuconfig")

 > Even if "make menuconfig" was run before, it's still not going to work
 > because the out-of-tree build doesn't use the in-tree .config.

 > Therefore, the example really should start with some config option.
 > Since "make menuconfig" is used in most other examples of creating a
 > config, use that here as well. Extend both examples with "menuconfig".

 > Reported-by: AndreiCherniaev <dungeonlords789@yandex.ru>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
