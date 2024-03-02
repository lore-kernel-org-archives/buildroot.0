Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6697C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 15:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534DB605E5;
	Sat,  2 Mar 2024 15:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GG-64QCkpPs; Sat,  2 Mar 2024 15:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A37960A78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A37960A78;
	Sat,  2 Mar 2024 15:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B54B1BF360
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33133418D5
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEr6DiVDsY0j for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 15:26:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBEE6418CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBEE6418CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBEE6418CA
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 15:26:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EC741C0002;
 Sat,  2 Mar 2024 15:26:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rgRFQ-007asQ-1L;
 Sat, 02 Mar 2024 16:26:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240301220016.427420-1-fontaine.fabrice@gmail.com>
Date: Sat, 02 Mar 2024 16:26:00 +0100
In-Reply-To: <20240301220016.427420-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2024 23:00:16 +0100")
Message-ID: <875xy464fr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx-naxsi: needs pcre2
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

 > Commit 722b84eafa5e3d9540e0a80bae0c971a3a778358 forgot to update
 > nginx-naxsi resulting in the following build failure:

 > In file included from ../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi_runtime.c:7:
 > ../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi.h:147:3: error: unknown type name 'ngx_regex_compile_t'
 >   147 |   ngx_regex_compile_t* target_rx;
 >       |   ^~~~~~~~~~~~~~~~~~~

 > Fixes: 722b84eafa5e3d9540e0a80bae0c971a3a778358
 >  - http://autobuild.buildroot.org/results/87bbcf946ccbd8e3bf1ca9f39464f4bb198c8d42

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
