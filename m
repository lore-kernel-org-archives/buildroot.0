Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A031C25B7C
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 05:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461DC605DC;
	Mon, 27 May 2024 05:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 424NzvM31UOG; Mon, 27 May 2024 05:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 514F9606A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514F9606A7;
	Mon, 27 May 2024 05:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1FD41D185A
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A480A81E49
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twKSeyK1kq7a for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 05:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83A3A81E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83A3A81E47
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83A3A81E47
 for <buildroot@buildroot.org>; Mon, 27 May 2024 05:58:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3421C0002;
 Mon, 27 May 2024 05:58:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBTMv-004ye3-2g;
 Mon, 27 May 2024 07:58:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
 <20240506081959.330708-2-fontaine.fabrice@gmail.com>
Date: Mon, 27 May 2024 07:58:01 +0200
In-Reply-To: <20240506081959.330708-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 May 2024 10:19:59 +0200")
Message-ID: <874jajeqza.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/suricata: security bump to
 version 6.0.19
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - CVE-2024-23839 - Critical severity
 >  - CVE-2024-23836 - Critical severity
 >  - CVE-2024-23835 - High severity
 >  - CVE-2024-24568 - Moderate severity
 >  - CVE-2024-28870 - HIGH
 >  - CVE-2024-32663 CRITICAL (HIGH for 6.0.x)
 >  - CVE-2024-32664 CRITICAL (HIGH for 7.0.x)
 >  - CVE-2024-32867 MODERATE

 > https://forum.suricata.io/t/suricata-7-0-3-and-6-0-16-released/4468
 > https://forum.suricata.io/t/suricata-7-0-4-and-6-0-17-released/4534
 > https://forum.suricata.io/t/suricata-6-0-18-released/4539
 > https://forum.suricata.io/t/suricata-7-0-5-and-6-0-19-released/4617

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
