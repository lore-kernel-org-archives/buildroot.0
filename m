Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F2606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UYKg6Vjs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBCE60AAF;
	Fri,  6 Nov 2026 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lkcm-fxUq2_W; Fri,  6 Nov 2026 21:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3985060A85
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999751;
	b=L6lqe5uO/C3t0lgpq1MtElvUOb0iMX14AJTx7Af0P4devCFS3Fh6Grz+zCxC+K5PRVQF
	 rezkBYGm1osq9//k0M0SRyVsf1oxLge9rNQP1IvOeqdu+z4tPfTEbOvQx3XP/Wu/MFFpi
	 NX5BrPXROu5uNtap7UId+9UbepwlYff39sSr5ITdxLKF8Onk43dFgqOR7cwC6aIWZEyAb
	 OiaGJIYOYv3xin57c+LJlzFCoJBw2D7lm7MAZHTIWGWG1UVXfpS6b+6GlMw+C+dvwdpCK
	 cceAKaKzU3Dph46kisAYt+ua+wDmxnKfo9lOYYynPwS+Thy9kLOKCzhSfM5FP5AFnVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=b0yt2TOU0BtTKmmQYRo+esbkghIWbYzcaKQpfDvJ0Iy5dU/F8m0ZoMUL78GirOY6RqT8
	 rCEwlIM5HAUrSQBc6cyvmgVpwXFzDVysPqkFg0XcwnBxkpvl7eEa5zdzWehKvNU4i7tus
	 Ttmv/3Hx4dGzBGHcLe+o3zqdEwG6OSVfKFRXdzwONAbgVzSUJovaW+9sB/Wl+nvRpznli
	 ygl8WdgFegC5CUvfErDGMdnJumveX1i5MxOd/eNZhFgPvjjYHC3IBLm0L3hW9H53AxEjA
	 jy68Pz7bYIhKwYAcRsJNhQ31aa9vuwY7MkytuJYoLEBjmbag3rJIdfNyTmmYc5plIDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999751;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UYKg6Vjsl5uavz2EIsj0lwjlnsmyeipVgZZvsCyYBy0gkALMwAs0kBj/6P6rLyPYp
	 +dFxmf3E9701SUPcMjXxDwnDhMjcq1Wm/gworWWLOqwvvJTWX2mh8DAgqre1VT9EgB
	 GlZohlLnJTuvd7QnhQBJThr3ywJscMDjSwp3tcb8bTiQK/9rZZXaTRwc2F0YA4f0qj
	 rvuiiSUkLqWRh0H87YCdf/lSAPSJp14KhGy9w1bCByYz9xYxixawsxJgTEEhv+rqAc
	 TxmK0p2e3sU9wT/OhaXSftg36ArSGxIV9r9Z2WepRiPwQhMcXNESNqZ0KOqS07iIQ5
	 AgJ1Aea5apVqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3985060A85;
	Fri,  6 Nov 2026 21:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E89C362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34D9B403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PFhRfldK8Y7 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4C884400A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C884400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:15:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 812442003CA;
 Fri,  6 Nov 2026 22:15:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:15:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:15:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261106191536.2120153-4-james.hilliard1@gmail.com>
References: <20261106191536.2120153-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <ad59f283efe2dfc4c8706ed296eafc96@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-botocore: bump to version
 1.43.125
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
