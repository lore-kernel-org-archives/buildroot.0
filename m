Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF7FCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953A341A1B;
	Sat, 30 May 2026 12:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SSOEJW8Rt7Y; Sat, 30 May 2026 12:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5447C412A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145173;
	bh=6APsRGnjwkXUVkkLu/EJqWdslfCP73gN0bjA7gnoRtU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oeYWbaxxcATTo81NIZpmqZWOiAwnL4zxRH6AqPXBN0Ni3iM1yFCKtiMtYlg4WssrB
	 d1yk0FGRnD3AlO+kW/j6/rzUsCLf8U60MW4zctIdqzY7J/LdvJ3IuSWvIOSk/OB4x8
	 6tMmUWbn/X0UdMsahqhIdC9o5KgeG+bEbd67zMw7sRe3nXv95fZiF5i+nowck0tE2u
	 /2ytEiVLqE+rLG5V7T5lEdp6beWIkrB8qZ/UV+dM+KDttzfVmt8+1n8MPk9Vjy76/S
	 CauHeIrH+ccnz4olm3PsKYOgG5yFAt9cgr5Xs9tun4IpjHFSO0mTC1Dn/h9Bv6tnzX
	 OATXQItoDvZyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5447C412A6;
	Sat, 30 May 2026 12:46:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6788DD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DD5C419D0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOenx-f3HCtd for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AAFF412A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAFF412A6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AAFF412A6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C5DAB97C67A; Sat, 30 May 2026 10:34:37 +0200 (CEST)
Message-ID: <56f4fcd4-634c-46c9-bb48-ae419c8ebe83@rnout.be>
Date: Sat, 30 May 2026 10:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
 <20260529183024.42619-1-chakrabortyshubham66@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529183024.42619-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780130077; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=htEr8e2flMvXLsTjS/2KUhGzDabiDBHMlLFcO4ltbBo=;
 b=aeF0kqcZZL9E3tRAXGInm1IvEBveqAZ6ChiSQbrcU4Fnf4suWBvS9rw5bPLPNT7jEwwLJH
 9y8SLY8BYSRLlsqyVceTO6shizWU9Iu0XSCMOWLMr72b8kx5YinRComF/7TSlMuJZDmPfA
 TJrEL6TMzZRVSKLXAYFQNZvch9H7MpV1+sgPWJZls2zLIl+Ox3Q6heEUOYy/4rs+q7f+Cl
 N6lf5nLdcRCXAl1UGGAF08kNERzCATy3Rto0HQ9vbF4r572ddTXi6b0gQ4ocsJBqQDxOqs
 zDj93iLY7iYXSb7NJb0wWRc9gDULMHGdh27k2py9OD5ieX8+TsX+yDVAjtZZzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aeF0kqcZ
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add entry for Shubham
 Chakraborty (unrar)
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



On 29/05/2026 20:30, Shubham Chakraborty wrote:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a00627b28c..0f47e5e80f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3049,6 +3049,7 @@ F:	package/dos2unix/
>   F:	package/htop/
>   F:	package/hyperfine/
>   F:	package/pv/
> +F:	package/unrar/
>   
>   N:	Simon Dawson <spdawson@gmail.com>
>   F:	boot/at91bootstrap3/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
