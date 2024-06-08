Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C41C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10917845F1;
	Sat,  8 Jun 2024 13:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jz0cXveN2VSL; Sat,  8 Jun 2024 13:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12AE684601
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AE684601;
	Sat,  8 Jun 2024 13:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A04761BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC07845F1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMTQqBbyf1C4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:08:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AB33845EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB33845EA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AB33845EA
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:08:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A16A9FF802;
 Sat,  8 Jun 2024 13:08:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFvoD-001jrl-0Z;
 Sat, 08 Jun 2024 15:08:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240517144149.1642C8745D@busybox.osuosl.org>
Date: Sat, 08 Jun 2024 15:08:37 +0200
In-Reply-To: <20240517144149.1642C8745D@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 17 May 2024 16:39:59 +0200")
Message-ID: <87sexn4m5m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/procps-ng/S02sysctl: pass
 SYSCTL_ARGS before -p argument for busybox
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=60b02eb6c6863e505289c7f8200c80fe1596fa10
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The busybox sysctl applet expects all arguments after -p to be filenames to
 > read:

 > sysctl -p file -h
 > sysctl: -h: No such file or directory

 > VS:

 > sysctl -h -p file
 > sysctl: invalid option -- 'h'
 > BusyBox v1.36.1 (2024-05-17 15:27:21 CEST) multi-call binary.

 > Usage: sysctl [-enq] { -a | -p [FILE]... | [-w] [KEY[=VALUE]]... }

 > Show/set kernel parameters

 >         -e      Don't warn about unknown keys
 >         -n      Don't show key names
 >         -q      Quiet
 >         -a      Show all values
 >         -p      Set values from FILEs (default /etc/sysctl.conf)
 >         -w      Set values

 > This seems to be the intented behaviour:
 > https://git.busybox.net/busybox/tree/procps/sysctl.c#n317

 > Notice: The procps-ng variant is happy with both:

 > sysctl -p file -h

 > Usage:
 >  sysctl [options] [variable[=value] ...]

 > VS:

 > sysctl -h -p file

 > Usage:
 >  sysctl [options] [variable[=value] ...]

 > So pass SYSCTL_ARGS before the -p args so custom sysctl arguments can be
 > passed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
