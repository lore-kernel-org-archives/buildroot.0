Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B6C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 09:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0DB418EE;
	Sat, 18 Mar 2023 09:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0DB418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEQ0T0ORCOHD; Sat, 18 Mar 2023 09:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070414192F;
	Sat, 18 Mar 2023 09:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070414192F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFFF51BF3A3
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41A2419E5
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B41A2419E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0zbr8V3sseO for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 09:31:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51722418EE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51722418EE
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 09:31:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3E5BE0003;
 Sat, 18 Mar 2023 09:31:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pdSuo-005rni-Va; Sat, 18 Mar 2023 10:31:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever <frank.vanbever@mind.be>
References: <20230220145747.53482-1-frank.vanbever@mind.be>
Date: Sat, 18 Mar 2023 10:31:54 +0100
In-Reply-To: <20230220145747.53482-1-frank.vanbever@mind.be> (Frank Vanbever's
 message of "Mon, 20 Feb 2023 15:57:47 +0100")
Message-ID: <87jzzexv5h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2022.11.x 1/1] package/libmodsecurity: fix
 CVE-2022-48279
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

>>>>> "Frank" == Frank Vanbever <frank.vanbever@mind.be> writes:


> In ModSecurity before 2.9.6 and 3.x before 3.0.8, HTTP multipart requests were
 > incorrectly parsed and could bypass the Web Application Firewall. NOTE: this is
 > related to CVE-2022-39956 but can be considered independent changes to the
 > ModSecurity (C language) codebase.

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Thanks, but I have instead decided to simply bump the version to 3.0.8
for 2022.02.x / 2022.11.x rather than carrying this large patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
