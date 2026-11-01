Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oSMeEVlq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07F9605F1;
	Sun,  1 Nov 2026 17:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6zjnx0P3qDk; Sun,  1 Nov 2026 17:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 29F946061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553178;
	b=sRtOhPZ7zVsVspUg6zgsoVBKOuKVj18Be0G/2ZiyImMn89Xs2R9nH57hc/OTxUjyhvUZ
	 nBOu1x3El+yxT5/rYTkkiMxVIlMRkik2MdCS/WnKDx/4zraLrgngnrPss4tDGoIgmA4Kl
	 T/WvR18xXHjc/ntqEAsdAHxzKPsPAEhHV2f4xEvwZXUhtJQBpwXuHAVgFWdwd4hvHNCqW
	 Zb0p1LujL3v1qx6jnehNarpF+0XUp02KG5k93/pfQjy0LiTaxdda0g1JpygHuR3fw0mhU
	 AokLMPr3tp+eTT/3T6R11UmynLZkkItpO6hksHloUtUMU1rXAiS+jnlhl69K8SVmRCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=e6xauQTM2yPA/h1aiGjL5AtdG5oszuubHcLg/8IhlsEAfW/+cMDrmPXJsHgz5Zduo95n
	 2kobq0kpqNh/R/gga5/8yXwU2N9/Gyz800cgoBDMuG3h8BX43PySisujcYWxgav7SFOiF
	 jbmU0CTeL8CRTQEDHRzowztBVrgxVowC69qkrWfzVABUhiaf1IrDboHjWiM2v2DTXq9RG
	 azzwVbyuQInSJpmvgu9oM8nat2OBfReo1iiLhXYFAPjsWhM+f2lD1MVbnZDjgiZLUVoLA
	 bh0bi8ZYES2Jd0DH1FxzPUIhV/a3JrE0LdqL3TKACKJ+m9oZh+bs/rzGs7C5NttiBWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553178;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oSMeEVlqf1Y4QuDOHglDuZN9neykAiA8XtvD8z9iuuKegxmS2dFurnbvBqbdsBBGu
	 nI1qtlNNEo6fMBBexQkOBdAbOobzSXhAhMspCe3FoUlA1PRWlvWSTk4RsLyP0yM8OA
	 n7bwWLP7kI32+1hoqxOtAjEmzBIjT9bYJ0q8rsqcfm6Ckl7fJwtIXw7edpvRP1js4c
	 eToE41gWfq6i91N9G8SgVIKkmcBViZ05WO+Wa4IPLx/6UeEk4EPObHtWPDKmflZYAw
	 nausy01KWwpl43pU5qOX47eVPwuRyvcy2JsU/6vq7rdwM9bSKZvGcUi06PFrz3TJDH
	 VGc1nuygpfVng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F946061B;
	Sun,  1 Nov 2026 17:12:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B53983A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23FD6061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4OYfBIkAT4b for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 249A0605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553176;
 b=JgEBxYeLxaTbTohtGYzugPXoXZ+ftCbsExLNqUaZ49F+DibcsZjLB69YiU6qy+9enJ7H
 0FfL0Pkm4Tz2xogXwLoQ8T5yjuZR+QKOzN/7SvLA3YikDtzRkyDJfFtd0U8FYwwXOQWYD
 AzyvvDHja341sluNv0T7INgaIOa3h7oFT6c5Nx9LlZfV8VNA0+G25nUuV0tM39ZmAs3BT
 3K7o1/2N9z/5hV30KuExdIzjtcUtBDqjbJ77jKzEnSucv2b4DziCeegkdeSiSkclWlLPl
 Rd1zGDB9VgQEwOqv0sASztoBcQMD3h99/t9ESo348h44zPoUynvg4kZTfRAT+jxqk3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553176;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=AcIN5nHnwK6fcGlalc3/M/diV6xbTqideIaPWSNMo00lN3n9vJkTAgEjHS05UGJnLCxo
 J11TzoIzuf8HAeLT+KkW9s/78k1csm1HyCYiFn/zTpOd6OkHbpMxdGZk2HOBw9ImRC39+
 nrIqMxiLRIs5Pb3noMltI0SxMKMXQxVN19AocXBOtHIFxWEVZSFGaMxuzf5rKTGdf8lDD
 I8qPF/1eQ57eILHzexUhEYkRCeREYYcrh6/88n9Hkpl+Z6Ajih80ejZSqTuVKAS++1UNv
 /8d5Wx6Jhh5x5dIuhCLMlue940dn0+KWMFZzyyJQ7BbfTV2jCLejTsC63nsJYtivuPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oUvTVsZI; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 249A0605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3477B19F57E;
 Sun,  1 Nov 2026 18:12:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:12:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:12:51 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20261031172019.2683287-18-james.hilliard1@gmail.com>
References: <20261031172019.2683287-18-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <e0949abbb90f50d3aa70c4b7fe4aad53@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pytest: bump to version 9.2.0
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
