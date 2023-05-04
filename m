Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07798C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 17:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7D140C13;
	Thu,  4 May 2023 17:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7D140C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8ZKVIJpjoFu; Thu,  4 May 2023 17:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5D3E40C01;
	Thu,  4 May 2023 17:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D3E40C01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46A351BF3BC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209208140B
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209208140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nw33rPVlkYCC for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 17:34:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD80813F1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CD80813F1
 for <buildroot@buildroot.org>; Thu,  4 May 2023 17:34:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19B5320003;
 Thu,  4 May 2023 17:34:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pucqp-008rFV-4u; Thu, 04 May 2023 19:34:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230402090500.74334-1-fontaine.fabrice@gmail.com>
 <87ildce0f5.fsf@dell.be.48ers.dk>
Date: Thu, 04 May 2023 19:34:43 +0200
In-Reply-To: <87ildce0f5.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 01 May 2023 13:49:50 +0200")
Message-ID: <87bkj080gc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zeek: disable with libressl
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Disable building with libressl to avoid the following build failure
 >> raised since the addition of the package in commit
 >> ea36681572255ec906167308c07adc42ed2ac9f9:

 >> In file included from /home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/analyzer/protocol/mime/MIME.cc:7:
 >> /home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h: In function 'void* EVP_MD_CTX_md_data(const EVP_MD_CTX*)':
 >> /home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h:22:12: error: invalid use of incomplete type 'const EVP_MD_CTX' {aka 'const struct env_md_ctx_st'}
 >> 22 |  return ctx->md_data;
 >> |            ^~

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/2db2988d495f9d06d058fb532a2dcfa9ef6e207c

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
