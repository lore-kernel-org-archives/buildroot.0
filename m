Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2370BC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 09:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5804054D;
	Tue,  7 May 2024 09:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEhwRGBFcwxz; Tue,  7 May 2024 09:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B534240276
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B534240276;
	Tue,  7 May 2024 09:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF8001BF30C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 09:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4A340284
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 09:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFF3kpHt14vW for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 09:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D3294023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3294023E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D3294023E
 for <buildroot@buildroot.org>; Tue,  7 May 2024 09:10:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E33B120004;
 Tue,  7 May 2024 09:10:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4Gpy-004GWq-0q;
 Tue, 07 May 2024 11:10:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240411152016.1185109-1-ben.hutchings@mind.be>
 <ZhgCNMQXfxPXuqvs@cephalopod> <Zjiv9wzmqtfy8DYr@cephalopod>
 <ZjkiIepSLogcd1zY@landeda>
Date: Tue, 07 May 2024 11:10:14 +0200
In-Reply-To: <ZjkiIepSLogcd1zY@landeda> (Yann E. MORIN's message of "Mon, 6
 May 2024 20:32:01 +0200")
Message-ID: <87zft2vvgp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Buildroot: incorrect permissons on /dev/shm
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
Cc: oss-security@lists.openwall.com, Ben Hutchings <ben.hutchings@mind.be>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Ben, All,
 > On 2024-05-06 12:24 +0200, Ben Hutchings via buildroot spake thusly:
 >> On Thu, Apr 11, 2024 at 05:31:02PM +0200, Ben Hutchings wrote:
 >> > Buildroot is a Linux distribution and system builder for embedded
 >> > systems.  Starting in Buildroot 2011.08, its default /etc/fstab
 >> > included an entry for /dev/shm with incorrect permissons (sticky bit
 >> > not set). (CWE-276)
 >> > 
 >> > Buildroot 2017.08 removed this entry for systems using systemd, and it
 >> > has never been included for systems using OpenRC.  So this only
 >> > affects Buildroot-built systems that use sysvinit, and some older
 >> > systems that use systemd.
 >> [...]
 >> 
 >> This has been assigned CVE-2024-34455.

 > Thanks for th efeedback. The fix has already been committed, with commit
 > 0b2967e158 (package/skeleton-init-sysv: Set sticky bit on /dev/shm) that
 > I applied on 2024-04-11.

And it is included in the recently released 2024.02.2 rlease:

https://lore.kernel.org/buildroot/874jbaxb7g.fsf@dell.be.48ers.dk/T/#u

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
