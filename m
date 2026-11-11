Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48DC606A336
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b3kZqhQy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E8460617;
	Wed, 11 Nov 2026 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUMOfF3xEWM4; Wed, 11 Nov 2026 17:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93D80607B2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794416613;
	b=esLQWRYcYdpQnSLYapJYeZDy+7ztAGG/tBtr0Bihs26PO1QWV8VSfgpjdZgp928bt3Ta
	 UVG4TvFXRRmb3tKvoq0FI9UTePkCt89NHGT5mai8OjfmXZ4g+FtyCD0YH0RzWajrSiAHS
	 U8juABokhGT821cWWaTsxNig5jMbNFDqKdALZybtlwYyyVHWyQkwU0L9+rsLOgfccHIsU
	 eWym9dyxxb7jYdV4dg533UEU0npxoaX9Px7Us9xaxrqKQhHNEflMe2kBAn6CvnpK3UgIn
	 7fSgCYI4DND/dZP8w+XXu51eIP9bivSl7CYBLIh757eRTTIpr4gUQXkyNLIxNsEznRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794416613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=d7f31+4uUCgQjOZtYyc5obqwUVP3AvXv/+dJQn9RBMs=;
	b=UwAijoCh+hdcU/Ho4EwTNiaznmY4zwWwTM80QhGOY0rWFjFfrmMOYUxZkLCLBfhn1qeH
	 6WcLR6UJ9NtUqHpbMyrXkCQO5pixgb+7klS+7lNF4+unpmKoO+wRzv0FJfJVG7Vxy0cJJ
	 xEmjTFXkwsn090F32nsefo92kC7MiGthhMaStuBuz6lIsDc984rskyowlqTlt5akskaJS
	 OvvBTfnXAkS7xQZsTEGg2JVUotM/pDBvGrvxo/Bj6veLoficmj2+wWatkywVaTG/a9RWX
	 iX4iv9eGtTyHi9RYQdxcjjq3hiwhvfOjMLXsRwXbW8KueyC8xjVury9IMowS21KvOJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794416613;
	bh=d7f31+4uUCgQjOZtYyc5obqwUVP3AvXv/+dJQn9RBMs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b3kZqhQyV3nePvogxHCpNTgTumHdk6sO3uXhcVRU6nWl1QlDRjrkKA4EOervNEyzm
	 EojIT54vD+I91Y/3fI8Hep2Muf7LAtcxjNc60y4ZlSvCZ8/dELQg0se7qcUSOVFZj6
	 /Yb4tWE4Vl0C9u7SYIhOlaJ4kBGcNYx+yPZsRmjM8UeDb+Rim6VEMkh/0Ednyxj2Vg
	 VhkPCx5QlF8siuNpMdPXrlzcn9jIbLVg1SVQZlJi8zEl1pVR7PA1Jr2nq0u462la7p
	 rhgbnag8gz6vvG026LAepnZJqDgMimSbXRENJYMJV8VolbFVqFEcLSoOLZ/WEf6Q44
	 h3FKU/KMvUGsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D80607B2;
	Wed, 11 Nov 2026 17:03:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C27B6F22
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3C10403A8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtzLsfFUdSpC for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 17:03:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 17A114006F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17A114006F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 17:03:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4E96413F86E;
 Wed, 11 Nov 2026 18:03:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 18:03:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 18:03:26 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261111140736.426101-1-shirokovalexs@gmail.com>
References: <20261111140736.426101-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <82638cacfece9bd7b82f316aea8d879e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.46.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 15:07, Alexander Shirokov wrote:
> Changelog: 
> https://github.com/zellij-org/zellij/blob/v0.46.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
