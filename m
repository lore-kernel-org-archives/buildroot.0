Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YXsKUp8N
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B59C680CEE;
	Sun,  1 Nov 2026 17:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjQ1pnjr_Wma; Sun,  1 Nov 2026 17:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D891380CF1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552991;
	b=XwawCb9XvgVQHdzJ2Nqn+6ytmwHhDx7MEUdZTgN0wxTQkVR8fDJQJUCanvlqXSSxClqp
	 v7bHLFK+Y+phhKG+kqw2hpp76TnJ5pCm41kJYvkOVlU65PY1jKElsTPYVD26IwuhmfOQa
	 gPz5G/wTXDi6sqke9nGY6m+o6oJTmaMFTIzWvlhQHdb0tJnbXeBAW55scMpgqPEtkAe4F
	 fHsO88Pn5UTczHk+Af37qRgqz/9K4Khz//J91lux2kAIfjNYMNftxZBVe/GSprn03seaL
	 nfCA8G823ovc3CK7ikBxEohwgjaiOIQdfeu4c7dwTVLiKUvB0f9DQp36sZaGDFQRCVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=cUOKsJVhqpcGozK56goEiLa45xxtFiQjlnYC4FGeSozZzHf08nQYQoo92RR11HpvlphZ
	 f5PB82EJNsetkoXYpCP8zeBH8w4d8mje4ILr8VFPPMF81jz9L9ow8buNYjx+9qYU7Hz1C
	 JDlrZvh20jIPjgX/TtxC8xQDcQn+2Lk0CDGITZvCAzgCq7OzUqCOxTObhBUeEcudmoW8U
	 Sz2Kp1B84CyaDLK0yHGNPEH2nmAk9gcqalsZ1pGhiZ52gjQZGND03YZ821tjhEuRR1TyW
	 spqfK+DrJNiRoKbsTbsMshPQk5gYZI1T3+GtbGkBsHcSZ24Mste+TucClgAiaJVoXaA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552991;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YXsKUp8N6zN6SK4F/T/2P6C/bwgZeiei8tkracDBmhElzh7c9p5uXxDpAcDWiv6xO
	 YRT6u/BJp7MTvX1mlMMzf8vRT2MxqQNCM3R6J8Oc8uzB8HUOS3vgv6sHh9hie12WuT
	 KhrYcnoU1Cu5UVcpYA5Ac2MWEqIqKKZcUFpiXE4a2R0YpfssMnkZ5YJAbRNZ09HaPZ
	 iwSOFv+ruqRM3GFDQY+ynXoKpKAJXrvT27c1ekzul10lStBoTj71i+/3tEJ5IfPdTj
	 yfTHL2hU1fo+ocrOHn96/WCCv9GtvEIXOAAN4ZYNUMnVzpLdc/GKnC/8FKzYB4B/ft
	 1cWB1KyqZtpqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D891380CF1;
	Sun,  1 Nov 2026 17:09:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5B0A323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BAAF40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9t4wSGuHkyI for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:09:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AB3074004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552988;
 b=G6GqXREfl4CPeRhqh8Fj4OMcTLq1MDVUDhvqbaMPYb4E8Q4XqvkOf9fHj0qF9mK+dD0s
 JLSv8OYx98ie03iKB2QAfqHkOmFQckD1dE7R0UkJASabZmLf4SJ0ePgQhKIJPlRsyRiVV
 qquWtGSgJ/VeHqe9utjufJG6bxaW5okgqtt5sbi6xffmX/nI9br3ZOH5z/5CYEr82v10+
 gTbi+8q/IzwTH4hZ5s8swc2irscAErCn+vONDPwzpaP8I8KJS9sM8aV57Y6KjxpUan5XO
 lx4BGC/DNcyLerTxC+lo9UPndLes52FjTVFaNL8ZYmNDBT2MZUPPfZy+Igc7CaWGBjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552988;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=lr5Eseye7fntQLQwm/SCGGRjwOKO/5LOh+LaZwuotmy2GSRAinWinINq3s2ACsnX0WTe
 2YyQSrHVkrqlA1eusaF1Bq8d/Wmap/W7NL6wrl+Z06JNKXlL9N43zRgd2W3kR3wwzVHPN
 7GlwZjpOJez4+tfrdpIBB7Bc1T49ZHc8z1KU37e8lTTaSJ5W5NdGDJvOTcYSusP1qwbty
 mWsD9atZLbKUI9dUr78V8/RFPlFN1ozO32ZY64bSrPMRz0i4zDC+Dj57K1YGsAer9v1GC
 zxb5Wv7W9qoLubjaRSx8+4pnRDZkgxlhpkMMruhW7k+CYD+5udCTyLUseTzhI+ROmzQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OvQ1WiSm; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB3074004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 59DCB2003C3;
 Sun,  1 Nov 2026 18:09:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:09:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:09:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
In-Reply-To: <20261031172019.2683287-9-james.hilliard1@gmail.com>
References: <20261031172019.2683287-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <3b17208dc556423f67a79315d4cc3509@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-ipython: bump to version
 9.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
