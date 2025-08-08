Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A658C87FDA
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 14:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F5460BAA;
	Fri,  8 Aug 2025 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sanF94gyPH7e; Fri,  8 Aug 2025 14:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F17B360B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17B360B8A;
	Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9976E31
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97074405F7
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JReZzQCtNr8z for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 14:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C337405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C337405C7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C337405C7
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -808021456; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 08 Aug 2025 14:37:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ukODj-003h9q-2i;
 Fri, 08 Aug 2025 16:37:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250806202029.625736-1-thomas.perale@mind.be>
Date: Fri, 08 Aug 2025 16:37:23 +0200
In-Reply-To: <20250806202029.625736-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 6 Aug 2025 22:20:28 +0200")
Message-ID: <87sei1q3q4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LoYTiMTc82f24xrpmAtf/u5/Cn33addNR7WHa5rZDTO+ozQGqIQMqjqY8sf/F/r8OENo+90wmjXpub07YH0US5Z2bpvMQqQLoKoE+/Kq0tgqVfmxYaIkfDyJGgcJX/EL07BrB/Vjabjl/Y78GdLSd7zDbVYb1lwuoNcr/Og1o5+R0IabW19/egxYzerpA/qQcbVpeqnppkXEbyATASBqmzQ65OnhOjEwSjptfIcXZn6h5A9LTsFP224RQXwc3prZVs+szAfzgTJrrIUsORbw2p0whIDdh21dNx285HdO8/z0jM44YoVDP0dm1ej/P5UL7C+z97wM6A64l2r74VfgCg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=b4tmuNWUOQHm6gHA55F+Svfr/Z7gbCul28IoYLw7wZc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LoYTiMTc
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: add patch to fix
 CVE-2025-8176
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fix the following vulnerability:
 > - CVE-2025-8176

 >     A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
 >     as critical. This vulnerability affects the function get_histogram of
 >     the file tools/tiffmedian.c. The manipulation leads to use after free.
 >     The attack needs to be approached locally. The exploit has been
 >     disclosed to the public and may be used. The patch is identified as
 >     fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
 >     patch to fix this issue.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2025-8176
 >   - https://gitlab.com/libtiff/libtiff/-/merge_requests/727

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > v1 -> v2: split the CVE-2025-8176 fix into multiple patches

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
