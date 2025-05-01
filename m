Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5275FC369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BC1417B6;
	Thu,  1 May 2025 14:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BwktZZ9wkcq; Thu,  1 May 2025 14:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434C4417BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434C4417BA;
	Thu,  1 May 2025 14:15:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED77113
 for <buildroot@buildroot.org>; Thu,  1 May 2025 14:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55BAC417BA
 for <buildroot@buildroot.org>; Thu,  1 May 2025 14:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAi9WQasE_WF for <buildroot@buildroot.org>;
 Thu,  1 May 2025 14:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:1c1b:6a1c::;
 helo=mail.ditigal.xyz; envelope-from=rutherther@ditigal.xyz;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A074417B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A074417B6
Received: from mail.ditigal.xyz (ditigal.xyz [IPv6:2a01:4f8:1c1b:6a1c::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A074417B6
 for <buildroot@buildroot.org>; Thu,  1 May 2025 14:15:46 +0000 (UTC)
Received: by cerebrum (OpenSMTPD) with ESMTPSA id 53aff9be
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO)
 for <buildroot@buildroot.org>; Thu, 1 May 2025 14:15:43 +0000 (UTC)
To: buildroot@buildroot.org
In-Reply-To: <87h624jv62.fsf@ditigal.xyz>
References: <87h624jv62.fsf@ditigal.xyz>
Date: Thu, 01 May 2025 16:15:42 +0200
Message-ID: <87ecx8ju29.fsf@ditigal.xyz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ditigal.xyz; 
 i=@ditigal.xyz; q=dns/txt; s=20240917; t=1746108943; h=from : to :
 subject : in-reply-to : references : date : message-id : mime-version
 : content-type : from;
 bh=8rhzrtXwn4g1ecjHLR41776Pj/RW3VP7EWW25gzANb0=;
 b=BXVex/fQex2gydgzAcpYOLRgx15J7psNvg3Iad32N+qN+KjCgOB5gWnnBxNMbuP3cE97B
 aOGWmmF62eX3PXMztDr/eb7hosXFryOjwZLaRJn9oyTtdCHGGOf7I8L3QaqKMtuiscEx9DT
 VoodsT0+dLlUKr0IHvgpq5HOJkmAKmc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=ditigal.xyz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ditigal.xyz header.i=@ditigal.xyz header.a=rsa-sha256
 header.s=20240917 header.b=BXVex/fQ
Subject: Re: [Buildroot] PYNQ Z2: new board support contribution question
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
From: Rutherther via buildroot <buildroot@buildroot.org>
Reply-To: Rutherther <rutherther@ditigal.xyz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hello,

I have made support for Pynq Z2 board locally (though most of it is off
of work of others that submitted patch to u-boot), and wanted to
contribute it.

The thing is, this board is not supported in u-boot / linux, at least
not yet. This means that the device tree and ps7 init have to be added
to buildroot in order to support it, so I wanted to ask:

1. Is it fine to put those files to buildroot, or does the support first
   have to come in u-boot/linux in order for buildroot to support it as well?
2. If so, what way is preferred:
  a. Patches for u-boot and linux
  b. Set custom path to ps7 init and device tree

  Currently I have it implemented as a. It will probably be a bit harder
  to do with u-boot with b as I am not sure how to pass the device tree
  file from buildroot to u-boot, with linux it's clear.

Thanks,
Rutherther
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
