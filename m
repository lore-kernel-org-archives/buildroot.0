Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A36CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCA6606A6;
	Mon, 18 May 2026 18:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvih5bgP8ELP; Mon, 18 May 2026 18:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F4A6069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127864;
	bh=femvXSohB7fesVBq6CKJAR2A9u6RphMIOqkXdp/RQFs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=MbwEuWm9f8Bf+D1Lp9RnbO6EW7K+s2BszPnjHZyf3+dVB6Z/QEaIrOEGvhIXmWsVL
	 liEMkm/nNVusmVdbboAQK0ex22yISRpralrjtrW7PBtaoi2RqdYkxizwoQvWPKZT43
	 OP9e/mPFa8AFFSixb2+Vb/wvtRPK5kqHOQzlz3WO6MZJRTaiIJk+4q8HrhxiqaVO0D
	 0iPEFpl9QPt3L+oAL2lMj0CF6JfvcixmWZ+7mLzYI0LSaCBOn9g6H7MINYumRyGK3s
	 iXENfsShrHgheJOPMaw+PbcRqMk1u5otLxPFyANZvMiWkJ73QkBu3CiR704QVdhg8c
	 hbp6D4tb04Dtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F4A6069A;
	Mon, 18 May 2026 18:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB94E282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD78E408BA
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jvb7KPmlDu-P for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:11:02 +0000 (UTC)
X-Greylist: delayed 350 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 May 2026 18:11:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7E94407DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E94407DE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E94407DE
 for <buildroot@uclibc.org>; Mon, 18 May 2026 18:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BADDB97BDDC; Mon, 18 May 2026 20:05:08 +0200 (CEST)
Message-ID: <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
Date: Mon, 18 May 2026 20:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Vincent Stehle <vincent.stehle@laposte.net>
References: <69fea782.050a0220.8af99.ac9e__38452.1139830881$1778296731$gmane$org@mx.google.com>
 <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779127508; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=fogtXKfsqDTruOzIwWDgzcB1lRBXqGmyuko68oWFAb0=;
 b=eYZRrxRMFGZXbNRbqbmQNLNFcyKttPr3VTD2jHWdPWta3M/rW0vx83+jruiCHWrlo69isi
 y5kuXNsPNsLZfU5BrFH8ZzDyjksFf/bpfdEna5pgJI1VZay7polu8MgUJX2HSbNrqXbyYm
 YRGDdzN2yTQGjI4iqS6mdgyuZKDYbZ5tAbGkaa6jCplBQKXu4vK4IxZRKEPyp6pWhT8iFo
 ydZNlTdLrPK/FtJuPlWEwBv38nPKVDxJK70GbcDkE3rWoB7q4KBwe4zFTh1Hjs2TbHkXp2
 erDBhzl61rCdWcrSkfb4vlsxgDzfJ62G0h+J+kPuByBbzCZ+JQgmRCPQj8LNvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=eYZRrxRM
Subject: [Buildroot] HPPA fails to build , was: Analysis of build errors,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-05-08
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Vincent,

On 09/05/2026 09:00, Bernd Kuhls wrote:
>> glibc-2.43-22-g8362e8ce10b2... | 2
> fails only on hppa, no upstream fix in sight, what about reverting
> 1822f07e94951c5a37f78c1009d54fc95d01d39c?

  Since glibc is the only libc for HP-PA, I think this means we'll have to throw 
out HP-PA entirely. Or do you see a solution?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
