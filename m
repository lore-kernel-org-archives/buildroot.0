Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98059CCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D15408DA;
	Wed, 12 Nov 2025 07:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5B5M3T2aNga; Wed, 12 Nov 2025 07:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE8F40A1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE8F40A1F;
	Wed, 12 Nov 2025 07:52:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA91FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16D524045D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NChy6RpiN_Nh for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F0264031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0264031C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0264031C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:52:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -309125906; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 07:52:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJ5ea-00Gne8-0x;
 Wed, 12 Nov 2025 08:52:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Laurent Vivier <laurent@vivier.eu>
References: <20251105185149.1601939-1-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 08:52:32 +0100
In-Reply-To: <20251105185149.1601939-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 5 Nov 2025 19:51:49 +0100")
Message-ID: <877bvvvgan.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=brPHQk+AnDTAdOzRtCjh0tjtizoZnCPucMBAKBKk0sUpkh7e8dnYPu0XJTVsNGMuXVJLQPbx1CWdUzYI5gfGPqpMqPOKRc5tetaHPRjlqyu/t5/60rFmoiiSIXz+9xJHROKcD3t83ShmuzsijcskybUJ9LLCbvDEZiTPe7EpTIp/T1lqC2oX0tnH/gX6HQzYyXuu/kU5eRvWiH08/ApzeZybjlvJEA5SL35OSRp7HuY/IvkxrbrXZu/XLS2zpVl56lXbzD394NOaEW9SznMXXCIoo+stNK2lBvBDFjp+8ydZj/1zd6dsUd4Jqw5GAQQDDQXkwJGP2FAu4Cc4XA8wQg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=2k5tC1chzSZK2Uk1A2+sCQuLVLP9hiNUigZoiJig2hs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=brPHQk+A
Subject: Re: [Buildroot] [PATCH 1/1] package/nvme: needs dynamic library
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit f75faf43506e5090857eb4a9d876d430ff34a972 bumped nvme
 > from 1.12 to 2.15 which depends on dynamic library:

 > ../libnvme-wrap.c:8:10: fatal error: dlfcn.h: No such file or directory
 >     8 | #include <dlfcn.h>

 > Fixes:
 > https://autobuild.buildroot.net/results/5bc/5bccbbd7ad4ce4a6898f6bcfd0a92c09e61324ca/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
