Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD31C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 21:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5BE40863;
	Fri, 17 Jun 2022 21:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5BE40863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laiYz954u_ed; Fri, 17 Jun 2022 21:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF6940571;
	Fri, 17 Jun 2022 21:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF6940571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F4A1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3219240186
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3219240186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izZPRKQBQvk2 for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 21:16:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4930E40012
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4930E40012
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 21:16:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF509100007;
 Fri, 17 Jun 2022 21:16:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2JK9-005Quh-P3; Fri, 17 Jun 2022 23:16:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-2-james.hilliard1@gmail.com>
 <d1cedcd7-3f20-e2b3-f007-cc0e68c06f19@korsgaard.com>
Date: Fri, 17 Jun 2022 23:16:13 +0200
In-Reply-To: <d1cedcd7-3f20-e2b3-f007-cc0e68c06f19@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 17 May 2022 21:53:48 +0200")
Message-ID: <87o7yruh2a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 2/5]
 package/qt5/qt5webengine-chromium-catapult: new package
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
Cc: =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On 15/02/2022 02.53, James Hilliard wrote:
 >> This version of catapult is python3 compatible and will be used to
 >> replace the python2 only version in qt5webengine-chromium.
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> ---
 >> Changes v2 -> v3:
 >> - add kconfig entry

 > Committed, thanks.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
