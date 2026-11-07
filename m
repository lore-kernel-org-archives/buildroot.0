Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25B606D83C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IndW4VZi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AF9940600;
	Sat,  7 Nov 2026 10:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvNHnEmiMVEg; Sat,  7 Nov 2026 10:31:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A603440609
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047485;
	b=GbH56Yseg11LrxN/NN6h0aFRuHQhJNwENtuI+1T5HzRjLE1w2TPkEGbRbR0HrOvRDgSC
	 4YbibpUDD0F5LuCaJI3ZZ1ppk9Iz5Qi7l04uOA7XSlI1YwWR5J/DiDFBSGdWmg+fM0oGA
	 7kFWrpxX6KIqlTuDnPJGQAf1/ZcpwqQgiEoKyINTjEqjCwkxQXgkqNgYcEr8oGOkyRKAP
	 xqIWjtQt7yKN05Olzd0bc+ed+bFVyRv1whI3v06vidcMQ0ebiW+uQzevEZoXJA+V7TbOd
	 J1lGORrcWR6htBHcBqgnlvnKIalQNWur4/GxaLlcp14Z0JC8EmczCsBDiZ2F8h3BqDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gIT9i6FXxQnpWvaEGsRrwIll/DtPwcSCArOu2aFYP3o=;
	b=lr9BcSH+n2Gd9rPXoZO145vWAgSk+xtPwuZ8UlKx09Mp5fhZyXIqXAM7qK8LH7lX8P56
	 4UbK9VIfS1Xu5AqiVajIuD9RPp2cR8wm4ZH/YWlsn0fYL0/0qJYJAUNJZkUglPBeHsV/d
	 HcVA6X5fmfjlDfBD2rKLsL6fTWXMjjHIZIejXLRQ1gFraKVs4zB/nMUImuBSC0lYEOmVW
	 GPtR+FgfMKotfVWdn5Xg+ntJsTE+hdNKK94+/VXkAPhge6RnYVYAxrJtargYvRrgiY8ER
	 LU5JnCG26ouA4H4cI97JVC7CR4BU424aZwyv747mYsarXJbFO/SPlN0oiplAh1KLG6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047485;
	bh=gIT9i6FXxQnpWvaEGsRrwIll/DtPwcSCArOu2aFYP3o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IndW4VZivMNlfmrFS8Pa+BWBX/6trIiU8Iweoggksy4QMu34DpRi9rGUFQLuWYyo2
	 NUP+HbavNa8mpheFyjciIc5hqiegRK8NSABxESk7PWzITKcQGLQ7Ay+JNyNoOHjuvQ
	 kwC+2PVR9gGBi8LX43Aymo8xcXmgWZyHdlj0a5OcDj0U3yGFss9JWyCqH7EWB9Sa6k
	 nUGiRZPezfWs70kRKqdzjrH8lQ4/nq51vP8T9Fk7mTQwmO06LpLIsecORiXvGLYBrs
	 hsNFU2D56UC128THNgfH3aHTsYJgUVQzEvGnqKAo6osyXFN/5hK5xAN1fS2ua+FnMr
	 24HNyES5iIKOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A603440609;
	Sat,  7 Nov 2026 10:31:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FF6E32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25B64606C0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkcbKFwV91pu for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:31:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8AAEB606BA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AAEB606BA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1E2E85FFAA;
 Sat,  7 Nov 2026 11:31:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:31:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:31:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106214913.2687317-1-james.hilliard1@gmail.com>
References: <20261106214913.2687317-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <620c41600b8284cd22d75f3be8b65251@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2026.11.7
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

On 06/11/2026 22:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
