Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA0FE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 08:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD6D612DA;
	Thu, 19 Dec 2024 08:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-nKlh0LuKVB; Thu, 19 Dec 2024 08:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1493612DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1493612DE;
	Thu, 19 Dec 2024 08:29:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9316C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBCE812D4
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQgAhTDjDFiW for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 08:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52E908130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E908130C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E908130C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:29:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 742B46000C;
 Thu, 19 Dec 2024 08:29:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tOBuV-003yQS-38;
 Thu, 19 Dec 2024 09:29:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20241214141430.3314872-1-peter@korsgaard.com>
Date: Thu, 19 Dec 2024 09:29:31 +0100
In-Reply-To: <20241214141430.3314872-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 14 Dec 2024 15:14:30 +0100")
Message-ID: <87r064hy8k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2024-53907: Potential denial-of-service in
 > django.utils.html.strip_tags()

 > The strip_tags() method and striptags template filter are subject to a
 > potential denial-of-service attack via certain inputs containing large
 > sequences of nested incomplete HTML entities.

 > CVE-2024-53908: Potential SQL injection in HasKey(lhs, rhs) on Oracle

 > Direct usage of the django.db.models.fields.json.HasKey lookup on Oracle is
 > subject to SQL injection if untrusted data is used as a lhs value.
 > Applications that use the jsonfield.has_key lookup through the __ syntax are
 > unaffected.

 > https://www.djangoproject.com/weblog/2024/dec/04/security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.11.x, thanks.

For 2024.02.x I will instead bump to 5.0.10.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
