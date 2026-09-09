Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB2C79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D184560820;
	Wed,  9 Sep 2026 21:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o6d5M4_TAND; Wed,  9 Sep 2026 21:28:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16D2D6080B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788989331;
	b=aCUmGv+59oKh5K0dQzRS3FXd11OnyPvgKzv2WNluACJnzm2p3iX5mwSTlFJ/0Y2dhAWC
	 TA/BiREytxJpGAkojKxQ8gMr0RsyGO19mBkRFH4pDoIgdHINXtuXWXc/bcNRQ7co442Xe
	 1iHaYeAP0m1POkQRB8r9hG1JSt/WsIfivALkM+iMJewvcqHaUmRWAXuvbLCbBORsXtUE6
	 DwlYv6rcl9FQPYPeC9n8jP5Xw1h4O1wKeEu44tMu1rTOEO3dOwzmy38wG2hFt+plkG2V/
	 1a10+NliS7tU6HjyggwF3+R0ou87bbySxE/oHjhwG0NaEM+KKmwmssDehEoOrXB+1EQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788989331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YEAuO/HnHS2VzXy4DiPawFm7m2ze9pqSWhxabIPQ+Ho=;
	b=Ixvb8E/sQy+PF1qQnfoucDQMca/4QyIZV6UTNP9+QLyQe6bInihb6d58URmreFTRaZAq
	 JakWC9yQNyX7CJ3kP5iPaYFm2fzrGhwMs77ImWPMR/EwjkRT3c88iAI6uewZJOQGei3gS
	 fZvIJ+D1YJN+P7e2bnIHyZxUIFd5qYK0mm8dWnU99gaojmIbCUczZv0T4JCMxhWgVOdcx
	 MoAp/0q6+spTxGacbXUWtf3+PCCv6wcyMdjMDpWJWFFeRZ/E7ShlisjcLXySzIcsv9y6V
	 dtl/PR52bJ4LS3NZPBQODBl+KeIGTOcIviO1CN0PQlnWEmjujBKHVezckB6gEch8ZXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788989331;
	bh=YEAuO/HnHS2VzXy4DiPawFm7m2ze9pqSWhxabIPQ+Ho=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OFUKpXasmoahW3LvCvD/itkY7PGi0BSX6Wehfqktx5b6pOn/XasTimwovBjbtLdQk
	 XWYP0AKdh5XTne56d00YK2SKcZ5wNpo04JZ3/DeAMLxpuJ8mAUc0xdGqI7Lwb28wf6
	 XkykkRsj/u4Uv35urA6NU076/WjQfepYJ7rU5IO59ugaN8UhdAgmq+XJfZ7qOk2uAQ
	 +3/n5hc6cgv7g3CTkSwccC1PLBf4hlxJoWqffRVvaF7+ejRxpcPOvN+l58Tv0VF06x
	 dYFk0rGcpIknuDKDe32w9e4aMev9A/q0PNRzBwL/Ci0fiHj3Jw61qZ7WtpoTokZszv
	 bnHu180e0z1Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D2D6080B;
	Wed,  9 Sep 2026 21:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8507CE2C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D1B40AFE
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NA-v_AfYIxqU for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:28:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 41A2A40AFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788989328;
 b=HyInXxFcuDYPx7SoKzhN0PXNZ8wGfkuWLSMO3gxTNUQre9bbUK/J/7ltkoBTv0x/izuF
 iLtYS2iolJgtcPWGWD5rl0GK2CLj8U7gvD2EOGuJkiWdRVs6fTxhU6iquV0lxGYtvkr8a
 R4EcBtLmowINEsOoE4T1H/0Nuvf1cPoRh/B/kKFXChErOvgfzYW+SPDQnN5l4Lqtc04R+
 +pOVmInQ8YOAErVLUNEckQwPZmoiUDFBaGVfzcD5ArmpNrdTgjM3UsQuOZ33DRYsyTPqu
 EwX+R0jKmG09Jeq0jwXT1578FHXM6CnrlQULa/SIbYFWGQ/YD83GFTBFhUBTaU6YAHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788989328;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=VMMyF/yB0N0DjYvvjBrrH7aZ2OkNS5z5LIQyghUh+7k=;
 b=hi29qiLBUtZgrnA/IRPvtAJ/1TDry3tvXedl3T0mqtzlllOwe9p8VEgEaXpd836KMpxX
 RC/4BPJ8tytFq4U91DdySoOh1zK0K2NCkNYUWZ9AWF0XVZn9p44UcVODA87X+/L/5Uvc8
 sBb6AfXkLpiJu+4UkZAnCfYh926ScmgYp3+BEAAgoPxU4hbQ4AJ+TEzpijpua4tRuYkfy
 LWqUmbzCjWXUIc0qnEBbRyUuxz+i0GsnL6cPl9RdZDoNTbad3YRSXDjA2GlDdk4M6Uv7i
 ccS5bq6u3KqRJB6Kz001/DVPLYW7g2bY1Wj7bFwmRdSd1khKHZaLBbUmg3Jhjcv7UFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bY+7xnS7; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41A2A40AFF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:28:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C3E0F5FF88;
 Wed,  9 Sep 2026 23:28:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Sep 2026 23:28:42 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 23:28:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260909102955.3878896-1-bernd@kuhls.net>
References: <20260909102955.3878896-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <6c8778d9a95bc48a03a4d0248f0509b5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/turbolua: security bump version
 to 2.1.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/09/2026 12:29, Bernd Kuhls wrote:
> https://github.com/kernelsauce/turbo/releases/tag/v2.1.5
> 
> https://github.com/kernelsauce/turbo/releases/tag/v2.1.4
> Security fixes:
> 
> HTTP header injection: header values were only checked for a literal
>  \r\n, so a lone \r or \n could still split a header. Now rejected on
>  either character.
> 
> Transfer-Encoding requests are now rejected with 501 instead of 
> silently
>  mishandled, closing a request smuggling avenue.
> 
> A real default request body size cap (128 MB) with a 413 response,
>  previously unbounded.
> 
> Secure cookie signature now binds the cookie name, so a value signed 
> for
>  one cookie can no longer be replayed under a different name.
>  Verification failures return the default value instead of raising.
> 
> Constant-time comparison for the secure cookie HMAC, previously a
>  timing-leaky ==.
> 
> util.secure_random_bytes reads real OS entropy (/dev/urandom,
>  BCryptGenRandom on Windows) for WebSocket masks and util.rand_str,
>  previously math.random.
> 
> WebSocket: unmasked client frames are rejected per RFC 6455, and
>  fragmented message reassembly is capped to max_buffer_size to close a
>  memory exhaustion path.
> 
> StaticFileHandler decodes the request path before the traversal check,
>  closing a bypass.
> 
> Fixed a 32-byte-per-malformed-request memory leak in the C header 
> parser
>  wrapper (found via libFuzzer).
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
