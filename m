Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB013C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B022A82219;
	Thu, 25 Apr 2024 17:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5QAXaDtVbRZ; Thu, 25 Apr 2024 17:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95B3822DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95B3822DE;
	Thu, 25 Apr 2024 17:21:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E103E1BF39A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB42760ECA
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvpQ7K_6gjtW for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A707760BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A707760BAE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A707760BAE
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:21:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0617FF807;
 Thu, 25 Apr 2024 17:21:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s02mw-0005VF-3A;
 Thu, 25 Apr 2024 19:21:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240418170934.7437-1-fontaine.fabrice@gmail.com>
Date: Thu, 25 Apr 2024 19:21:38 +0200
In-Reply-To: <20240418170934.7437-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 18 Apr 2024 19:09:34 +0200")
Message-ID: <87r0et9x3x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/freedrp: security bump to
 version 2.11.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following CVEs:
 > - CVE-2024-32041 [Low[ OutOfBound Read in zgfx_decompress_segment
 > - CVE-2024-32039 [Moderate] Integer overflow & OutOfBound Write in
 >   clear_decompress_residual_data
 > - CVE-2024-32040 [Low] integer underflow in nsc_rle_decode
 > - CVE-2024-32458 [Low] OutOfBound Read in planar_skip_plane_rle
 > - CVE-2024-32459 [Low] OutOfBound Read in ncrush_decompress
 > - CVE-2024-32460 [Low] OutOfBound Read in interleaved_decompress

 > https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed after fixing the s/drp/rdp/ typo in $SUBJECT, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
