Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5710AC54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278A8820CD;
	Thu, 29 Feb 2024 22:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zy8ZQnmnZP3l; Thu, 29 Feb 2024 22:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 904E08223F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904E08223F;
	Thu, 29 Feb 2024 22:01:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B98B1BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 589E641D85
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2Yq0okrFPrk for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 340FF41BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 340FF41BAB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 340FF41BAB
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:01:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4223D40002;
 Thu, 29 Feb 2024 22:01:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfoSa-0052yn-2P;
 Thu, 29 Feb 2024 23:01:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240206204209.864622-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 23:01:00 +0100
In-Reply-To: <20240206204209.864622-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 6 Feb 2024 21:42:08 +0100")
Message-ID: <87msrjc4mb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.6.0
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

 > Security fixes:
 >  - CVE-2023-52425: Fix quadratic runtime issues with big tokens that can
 >    cause denial of service, in partial where dealing with compressed XML
 >    input. Applications that parsed a document in one go -- a single call
 >    to functions XML_Parse or XML_ParseBuffer -- were not affected. The
 >    smaller the chunks/buffers you use for parsing previously, the bigger
 >    the problem prior to the fix.
 >  - CVE-2023-52426: Fix billion laughs attacks for users compiling
 >    *without* XML_DTD defined (which is not common). Users with XML_DTD
 >    defined have been protected since Expat >=2.4.0 (and that was
 >    CVE-2013-0340 back then).

 > https://blog.hartwork.org/posts/expat-2-6-0-released/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
