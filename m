Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA532CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7729E40AC5;
	Mon, 13 Oct 2025 20:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88Y5HoEHjSZX; Mon, 13 Oct 2025 20:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E6A40AE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E6A40AE5;
	Mon, 13 Oct 2025 20:26:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E338C1C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D48CF40AE5
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U1VaLV-K6U9 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83EB140AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EB140AC5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83EB140AC5
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:26:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -768657673; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 13 Oct 2025 20:26:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8P7z-00G6Gu-2O;
 Mon, 13 Oct 2025 22:26:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,  buildroot@buildroot.org
References: <20250916122005.30652-1-thomas@devoogdt.com>
 <87v7li9no5.fsf@dell.be.48ers.dk>
 <20251013225434.GI1422726@igalia.com>
Date: Mon, 13 Oct 2025 22:26:43 +0200
In-Reply-To: <20251013225434.GI1422726@igalia.com> (Adrian Perez de Castro's
 message of "Mon, 13 Oct 2025 22:54:34 +0300")
Message-ID: <878qhewnss.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qyXGRKO0CGh1iSbzMmqj7P4iohThgHGBFHKu1TyEdFvU8UBVlb2i+t+AaYRY3RNfpaAXfuWGDkr989i7Hb1UhI5G0kbDHDFrDReEtrwfpLKT+5Lp7e6lHSBIdN5YMG7ICJ1ta2HZdjmiTNoRn9Zjoq48QNv9oUdaMMi3e0rIQD+aBHhhDAiqmQGKD2VaJBqEa37axiKn1iNdNlRxfCeUDT31F3SooIiN8oaTTJVuhCdhPtnpVPmIdhV2vcXGkN8U0CY2s49tc0k4RDsyvfYwAJtpXNhTBeWyvZT8bllLAmQf6eRcTYx98BVINvMGcAp83PZcRSCie8UbHDmQOX2TnQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3IOl+qEsJGHU4LA9MiBXS8gH4B9pHP+gBDNPacipayc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qyXGRKO0
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Committed after marking it as a security bump, thanks.
 >> 
 >> What about wpewebkit?

 > My plan to update it to 2.50.1 which I have just released today [1].

OK, what then about webkitgtk? ;) Wouldn't it make sense to bump them
more-or-less at the same time?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
