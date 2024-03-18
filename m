Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B06BC54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 15:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABBD1405D3;
	Mon, 18 Mar 2024 15:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaHoTS1X6TOu; Mon, 18 Mar 2024 15:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF5240A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDF5240A46;
	Mon, 18 Mar 2024 15:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA7C1BF48B
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1883B404D9
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uW-1q5HxybY6 for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 15:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EDE44030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EDE44030C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EDE44030C
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 15:19:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D650BE0008;
 Mon, 18 Mar 2024 15:19:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmEle-002lay-0U;
 Mon, 18 Mar 2024 16:19:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240301195619.863853-1-fontaine.fabrice@gmail.com>
Date: Mon, 18 Mar 2024 16:19:14 +0100
In-Reply-To: <20240301195619.863853-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2024 20:56:18 +0100")
Message-ID: <87zfuveff1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump to
 version 2.12.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2024-25062: An issue was discovered in libxml2 before 2.11.7 and
 > 2.12.x before 2.12.5. When using the XML Reader interface with DTD
 > validation and XInclude expansion enabled, processing crafted XML
 > documents can lead to an xmlValidatePopElement use-after-free.

 > https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.5/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

For 2023.02.x and 2023.11.x I have instead bumped to 2.11.7, which
contains the same fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
