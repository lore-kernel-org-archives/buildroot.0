Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD22C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755DD40DAC;
	Fri,  2 May 2025 10:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEOuaGNEX-sq; Fri,  2 May 2025 10:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10E140DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A10E140DC5;
	Fri,  2 May 2025 10:22:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDAEEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E149940DE3
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_oc5LP8JH-x for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0279C40519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0279C40519
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0279C40519
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB4341C0D8C; Fri,  2 May 2025 12:22:24 +0200 (CEST)
Message-ID: <dd68e866-85d2-4536-a6c7-68c245f4405b@rnout.be>
Date: Fri, 2 May 2025 12:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, thomas.devoogdt@barco.com
References: <20250414090347.1895205-1-thomas@devoogdt.com>
 <20250414092213.1901858-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414092213.1901858-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M/opFxQZaAUhUtk9p9IzLmM3GmdS/Z6iuKQxGk4Vgto=;
 b=QkDirvU9FgwxJQiAZdYoUKpDMpmEyuc+/Trsl7NX8tVPWFdCcS/FWiWhi04l3wpvTuprFa
 ToRd1WF7sv049MLinosN5strPra3/7I0MmLIs/1Fd61Kuo5Z6GFrAczWEHi/IgNnoBdcWR
 6odHPTvt2/LtTs4X93Vmo3zDrT75R5MU23UNxQleHidthvWqtNvLrXROKRB8p/3aSMCMSZ
 4//aMhNDaQ+2l7lCK9YYY/xMA5txM4+csyE8S+EBvmV5AgkOv0Yn4SjvKTOIXeEOICjpwR
 Dh4BKubnctBTIdK1VzwVQhJDR0HURERSUs5wc9py87vo0hxN6hUZt/O8Umavjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=QkDirvU9
Subject: Re: [Buildroot] [PATCH v3] package/libfcgi: update to 2.4.4
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



On 14/04/2025 11:22, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Announcement:
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4
> 
> Notes:
> - drop 0001-link-against-math.patch as it is upstream [1] (by @ffontaine)
> - drop 0002-disable-examples.patch as it is upstream [2] (by @ffontaine), add --disable-examples now
> - update LICENSE as the name has been changed [3]
> 
> [1] https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
> [2] https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
> [3] https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
