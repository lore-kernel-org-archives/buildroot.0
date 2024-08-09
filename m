Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD6C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E46180B52;
	Fri,  9 Aug 2024 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k8nq7baJ_nG; Fri,  9 Aug 2024 19:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C9780B6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C9780B6D;
	Fri,  9 Aug 2024 19:29:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B54E1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDBED80B6D
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVU7wIcDgwqq for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC49F80B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC49F80B52
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC49F80B52
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:29:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC686C0005;
 Fri,  9 Aug 2024 19:29:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scVJ9-000JRt-1V;
 Fri, 09 Aug 2024 21:29:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240713091031.B3410861E2@busybox.osuosl.org>
Date: Fri, 09 Aug 2024 21:29:51 +0200
In-Reply-To: <20240713091031.B3410861E2@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Sat, 13 Jul 2024 11:07:49
 +0200")
Message-ID: <871q2xpk9c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] toolchain/toolchain-wrapper: make gcc
 --help -v work correctly
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9954315fc5b2026552a0f0175307ec8784b51578
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > make "gcc --help -v" display all the options, some packages depend on this
 > https://bugs.busybox.net/show_bug.cgi?id=15231

 > Signed-off-by: Sagi Mor <sagimor6@gmail.com>
 > [Arnout: move the handling to the beginning and directly call execv]
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
 > ---
 >  toolchain/toolchain-wrapper.c | 11 +++++++++++
 >  1 file changed, 11 insertions(+)

 > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
 > index f66e588bfd..e436889760 100644
 > --- a/toolchain/toolchain-wrapper.c
 > +++ b/toolchain/toolchain-wrapper.c
 > @@ -310,6 +310,17 @@ int main(int argc, char **argv)
 >  		perror(__FILE__ ": overflow");
 >  		return 3;
 >  	}
 > +
 > +	/* skip all processing --help is specified */

Looks like an ' if' is missing before --help.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
