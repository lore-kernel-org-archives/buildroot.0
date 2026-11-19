Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC70606A324
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vn1zpNaf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=CRQTLDnh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ADB960DE6;
	Thu, 19 Nov 2026 17:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRXNx19L3OJW; Thu, 19 Nov 2026 17:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D8AD60D98
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795110914;
	b=IXsKUOUt98Kko68VPekwMSXMKI6cwwrQ/QY4gQps6/HesWij7wCkPpG69DVYQmraMZKO
	 Ro8JwZhdT4PjMUQry4MMalMrJco3pVS9i9EVi37SI37cHMYB9xsQ7ZhrbgVXHGnenYvjl
	 SWgVLCxzsOmnXKYqD4moZoauXiVJxmV5ZNr5dIk7lG5BMHh7Kp51tRJi6z2q44AjwAwfi
	 EEjCXzUdGa0tXkcIskVCkGXBUsMCDdHG5KKhaMceMj5y54P8EKAzbYrH3tU7siwJzCYmw
	 JiUQ+d2ovFdB11ShrlVSTNtR5AiyDZ4ohFaKx+E5FVblftCvDNYn1yZoFJ/g9bzHl0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795110914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fdSb9vykNwDZCygyXPwcyuZsoalXjOZQIMc+0ttJ9hk=;
	b=Un2TdW/9W4O/EdTdzyQlR3pahIIddGErByYJ7xTv3njdVb1AV7bavftWT0RALif8myL+
	 pwfWfRvX+ZTcyspdzS9bwWf54oO1nd9zbF5jqbxjU73ZDHFotTxAK78PHLPmu+iIQYERd
	 nVyzBsgNJ0lZZbiNEV1pLKLE1om8v5icA/llmd6VThost/BNppiKFv6NtF4HKmSsZY+0N
	 qPW2Ajlfxz9qAL7XgOy1u4QMaaco1tPn21vSBD6undFy7v2rhdQK7OvnzQVd7h2iYDlUd
	 vQDdV5NlQJUBbuoe8NwWe6jMV9aOYuOY1t0Y2UZafMdbEDuQilCM0T/SRsuUw/m6ufQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795110914;
	bh=fdSb9vykNwDZCygyXPwcyuZsoalXjOZQIMc+0ttJ9hk=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vn1zpNaf0moz//4ZyKvkQDTVDxWWBRRTQkabTuLBFK8ZDg9PzDfAQNphm0eDX9n/f
	 wwNwwesfyDHworPYZOu3LffbuAzDdDLP/x5IDK6PrLXfA5u8ighjAbuIoPYVQFH6WV
	 Z+Y83Qmo+QTawYyE3hd5OnH2oP/bW51yQtdYNgVgA534hPktF2vqwj+0swN+QJe68Z
	 VVOipgTH1KZs2fiL6hxsWQgYCdkmywjs5vwN9HpoayEwatT/PZe9I5HqwXK648IZt8
	 PwrTbBb2j23LOuTgvXN0plhUap1Bh3J/h/k7evH6ZRJOmIrCy5TzQ62TkX57fuGZdI
	 ofvOLNHDH5U3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8AD60D98;
	Thu, 19 Nov 2026 17:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC61F22B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 17:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B222B4059A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 17:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKJ1ujaXP4Mu for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 17:55:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4759C40596
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=CRQTLDnh
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4759C40596
 for <buildroot@uclibc.org>; Thu, 19 Nov 2026 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0RwGVfCZqtLMxVhyRWrP6AsNMqfxC/anQJ66vq9zaY=; b=CRQTLDnhIuLVEvx7CcjU6L07hv
 GxgQKBn6A2TxvQzTsgxQhvipxe21IxjXNAAATJSGv1ZL6sWf27UZxZLkGVOJO+eSeqhrxaaKX+1gZ
 JOtWd0dq0J1B5wWG9po7mcFOIfLgvHqvV4NO2VIDdIaLMoMY7lys7sP3tEXGMqMa8gBNXSIk3AMgn
 tHEIz+CHze2AJ0KMFXgkdDfwB4Yq14QGjiHg8tjQXInyMQSZo8O6yQTG24P3GOJUQiH43szkGvFk5
 xU+UiF1QrArIfU1c1z8tXuOgiMovjbK4K717IbUMbpkfh+dXwJt+qPaiDBUBNUcHDJx/mVwiwb21H
 YXdxoSTg==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xU6Li-00000007pdC-1dWh for buildroot@uclibc.org;
 Thu, 19 Nov 2026 18:55:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 19 Nov 2026 18:54:42 +0100
Message-ID: <pan$22eff$a88b2205$45ef2643$69b0f428@ID-313208.user.individual.net>
References: <20261119075949.253474-1-slaveze__42668.8676512399$1795075221$gmane$org@smartandconnective.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH] package/{rust,
 rust-bin}: bump version to 1.100.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Thu, 19 Nov 2026 07:59:52 +0000 schrieb Sebastien LAVEZE:

> From: Sebastien Laveze
> <slaveze@smartandconnective.com>

Hi Sebastien,

trying to run the bump through the Gitlab pipelines showed a run-time 
error: https://gitlab.com/bkuhls/buildroot/-/pipelines/3066872318

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
