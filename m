Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83092606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V8K8q+ZU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FB46071D;
	Sun, 15 Nov 2026 11:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQ274rWeuTXB; Sun, 15 Nov 2026 11:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 563DA606C6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794742810;
	b=hsKrSUFf9VEn69gznGlt4uMVFd24T7h8eAdYDFJgSPmrI6gi0gtEoFmkXN9qUflMRcxd
	 HFa36uTZxyXJOGBk5FlgE5UEUjxVsxlnrbSGlZmwpYlmp0uBWFZJf2BOKqZQ/iub7OhAs
	 6bt4cF30YCZLvrR95UEiyWH9b+Z+yxMWAPwjRHqgrcJivtg2WEQ8ePq6PB157liN5k/EG
	 vKFGZe2pVmwB0j/3pXUnWnHa1jmxXQDMdQkyDv92RumR5amNlMnivsTmom3uUJY/DB9p5
	 bzIgbksx2VRvvlklZ+geu9PN4djV3GoyXzXyQOOUF8quHJlh9D+tNa0wGAx6PYAj8KQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794742810;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ByHi23pG0CLrgwxr9lvCRTaA+T6lBN5XC/k4Hin3mfw=;
	b=UT5o7PRAd36H+OiwkLf8TKyNowxeuB3Hoy66uyT+fYi9B2FVHkimHkGjgWi+455/TUY7
	 7D2Fyc6xodUaX3Fq/ZF5gKYaWeqLrUk4au9TfYOGyOJqgQByzaoSbzh9bpxi304Jp4nNT
	 cVERTLGYdsXnjxH6/AhRndLCPKcMP+VjjPY45IgfdZQ05siwlbna+6Z2c1aaAmknVPZPt
	 ph/EajPXV+ixb/639JBx2523bWKMSS7+m0yLl0QgY5cjpK05a3ZJDjZPzfWz97AxdNbDy
	 dy7ypTfWxfCveZgUWTQxbpX3LhkxwWEIxXbGsgQdAEQtyrh8Woo6wcaISVa29Rt65Dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794742810;
	bh=ByHi23pG0CLrgwxr9lvCRTaA+T6lBN5XC/k4Hin3mfw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V8K8q+ZUDwU4cs6nTNYpnAYOwCz/U7iMtODfculUoAWk7BuBmJH1Te5JM385LUjXv
	 NvFR04EzhhJhqQXIuiDd8edu71Zn9Royp7GrOOXPMlDiZk0HTXo4jGIftSphXbWLCK
	 B4XCyaYeiF0YalrOmob/J0a2kSSVPpjBAcxpcuOgKQDZ3LIuyXIB4iHY56A4CyIAD7
	 OojE+W42g3Q+e5aMtqcx+qUUpoo4TeVGQFetlg6whMzFhhcjxSFhNloKG+GQ8wrHky
	 VYxOKPRmUISmaNFFhsX1o0uHCmRBoDqi/FLsfvuUgIMjP79oNWSwRcOKNfIKCG8NJU
	 zM5pMtdHJvX4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563DA606C6;
	Sun, 15 Nov 2026 11:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BD72FB
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4689740068
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cziqpq-EIZ4J for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 11:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DD96740061
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD96740061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:40:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 21BFA19F5A7;
 Sun, 15 Nov 2026 12:40:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 12:40:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 12:40:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20261115082255.32679-1-bernd@kuhls.net>
References: <20261115082255.32679-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <949e7a42ebf56ebac0462a1d29bcd7b1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/wayland-protocols: bump version
 to 1.50
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

On 15/11/2026 09:22, Bernd Kuhls wrote:
> This bump is needed for the upcoming bump of mesa3d to 26.3.0:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/347b5c45fd2bba731a514861af15851ec7fee65e
> 
> Release notes of version 1.49:
> https://lore.freedesktop.org/wayland-devel/Sb0TL9RxdBgNMuAKZmlfhbXVQoqGTjMaoqWmu6S_JBcYNv7Aw82KvaXX5zHaBpjfl7aF9nzz1hSgtYxQalwMUTiOpritlvtoo_Q-wQCX9EU=@emersion.fr/
> 
> Diff for version 1.50:
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/compare/1.49...1.50?from_project_id=2891
> 
> No release notes were released for version 1.50 so the tarball hashes
> needed to be computed locally.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
