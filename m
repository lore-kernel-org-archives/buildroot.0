Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52738606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s3SoTY9q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD42606AE;
	Mon, 16 Nov 2026 10:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSDo97EpN-N4; Mon, 16 Nov 2026 10:46:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BE5360739
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794825977;
	b=nsOQJPpnf82XZMAaDwa3q1BSALnooE7T6F30lsPvRgpz62x9KX0YM5RogWPRWzWbF8fR
	 jAh6eEynmX3XpXKHYHc3kMabQRxZAHgFf4ezydzaUCOvyZApUwcj9uVRCFiSz4xvBOFsF
	 xh8kvYCV92D+JPZmV+XAqme8zMmEScfijZOfhNcArW63Cqbyd27xb9E8i6e43kGeFDr5V
	 cdlwVSUiZXI3EJ7JXRe889I4h0MmekNb4jHb+3ZZpywftH1mtQvubA2vJo5/2BTUE4HfG
	 Mrno+a5NNn2LGPeCT87rlQBs8i6G4/PJJnmJ0o2qO5zIABtfKgA8kZe1BRODDhAl0gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794825977;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0iSg1tRd60mMrwVE9aFV7JLzNu7DYHP/gogJPnTEMcU=;
	b=FG+0vKil0sTzuVgrrk2fyjPZujbIQi8y4vtWCOVJvB4cHD/jQqH0/Hu+aX0nc5TWjUEF
	 9wZ9I69oWqbmDhHOsNx8+18HPB3PX/k22qw/PSCy5x6e3z4Hx/FProhy1roYYsXTD1Q+X
	 xEYwiU5zsVPZnMQStEMLpV0CkilB2HxtCThInUyuCVkyMTlJPng5rJDPSV3xa/rxGfKMR
	 KoXOwA67qkEVwY1P32KgIkNpFK6CCb28s9pcvL7F5WGFmaMFr5F8aoM7IKgcB5Xkoo6F7
	 3VhbnfO4KWx/KYG3PaYqYnTlWsChMnTAzagFSC7u7mOw/zyxt50aV4AMKICguvhsvqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794825977;
	bh=0iSg1tRd60mMrwVE9aFV7JLzNu7DYHP/gogJPnTEMcU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s3SoTY9qdhzQGpDAs6V2YS81S7dPuJ6cHetl3idaxs1uZGVWn6hHC6TjwWX3LOz5a
	 r84OnUhvUdtVfFiKLmNdlXS42iDVdwcodNtHr6Sw6Vt+YQrBNnei9wS/iKeGvlPkx+
	 k0HtlQIrwj7/UqSvCBUonQeBQQSTESpC89eL0yszJwW2b9iyifQdHOg8Zbza9whS9E
	 dCAHQRpAPhgtPMLkv7rd+PILHrdquaKE9iZPZxO6X2ADyFoTSEww7uPU2AmUsdVILz
	 WXKuK/+kKieQZ8OB2bUAwfhkWHUgsMRfVvaDCdSu6UW2iuEqEfNgmJIIBEVQlY5mZ1
	 IIsfHrm3Jr8kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE5360739;
	Mon, 16 Nov 2026 10:46:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D31584DD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D3980DF7
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYrtMOiQQdSn for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 10:46:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6C0580DCB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6C0580DCB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:46:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so3478359f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 02:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794825971; x=1795430771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=do2zlQTvtnxHQgauarOGqYSqb1+YgqbYsvgyOt0JpRo=;
 b=Dg/qiv/KXpczXTQcVsN7++Nbso3KoFnMThWxU9MYA2z6dj1mimYca/tH9EsuL5/1Ed
 lT6pYQJe+9HYu9PB8Blp39vGqhr6MuFFaVzPATGButr3gZPHCtROi/GS8JwTK5v8qr4+
 2hK6zAcKzcgfUo+2C04OjhZ4Kn3PiporEkqUv/wBSZbDJNTl1Zdl9aRevu3pAM9xYN7j
 Rs3Ohaiff3JCK7fAx6B2txB5acvzw6WTpVH9S6wlIYhU6Z5CGnsOc5+Vl2iVWVqlhFaJ
 ebLplGxwMFquvLm3XgB9SwTzjG2dlj2Ka2jTkDKXcTSjuZ14n96hivxNyktv6J3rgruX
 fSgg==
X-Forwarded-Encrypted: i=1;
 AL+hErEzyAAGRc5NEexYHedTIA5Tf156pmz+puL8Zvgb4vlLTrJO3zzh6hQ3J0wEPo+TtcOnzr5TSf2sHDo=@buildroot.org
X-Gm-Message-State: APuU4Z8q2B1MVriaea18unjlQK2YBwxHAP7KXTZfPGjGrrPKcv692oJt
 KQEAEaQkd7Ew1LNYZRHhv3fDBrtpQfP/OvvKfaG1jomDnleik/2cch3dKu4pwI7GmwY=
X-Gm-Gg: AZFdTZekrbZ98EqzN32pFPPTcecnHziGOgJbFEpF4Oc+kvDN6/KgaTuOkF1xqkU+HGz
 NtjML/fTBwQUTAljFP1+LZ/rZCZ/HPjd7AE5cnUgUoiqNwvEzLlHqDALMtoP0eHqehfHozeNrYh
 L9cBWWt1T7EclMpBk33wK9192luQgnwvJ1q/e/Bfa+PO4aF/4l98sg2SXjMpfVAOEYBlHebaFQe
 mk8jklwFArCOTC3m4K/EC54fUPu5gTP0juuKFz+AONHZq/fwVsBLLWXs/g34s29ImiagYEnPGjQ
 Qwbi3ufKfn35jdtgFWbVI2Wzqc77MpbqSi94u9HqTI6N1xMd4Kbxu8aDJ0MbVg3a/EqvG16w5ul
 7fgwf+5nNL8+El8wKtaB5CKEStUdj3dHRCDWNXqtEgHFCIv+HHfLyFSd77SOYUnUmIC7szEZCnc
 jTof0WfF9wXv4r6Pb8iT1K8ZsjEUIuxCg8Gg89V+z69D6mCvQQAvbFFRDabWu1I6JQYjumOwoQI
 0eTDbmHvid5c+fjsXa48LlvMConKMDXNJj1foO8PiVBhp4yZMtzxiaaAps0+9+DYVQrwjwybsLH
 ggdjipcSCF453YXGRRO3XQ==
X-Received: by 2002:a05:6000:18ae:b0:48e:752b:9f90 with SMTP id
 ffacd0b85a97d-49c711b7eb2mr22074445f8f.38.1794825970568; 
 Mon, 16 Nov 2026 02:46:10 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm20770152f8f.15.2026.11.16.02.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 02:46:09 -0800 (PST)
To: michael@moysys.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon, 16 Nov 2026 11:46:08 +0100
Message-ID: <20261116104608.75394-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4a65b600f69b00a8366293ab1df6a2bc@moysys.com>
References: <4a65b600f69b00a8366293ab1df6a2bc@moysys.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [2026.08.x] Incomplete python-pkg-resources
 backport breaks U-Boot binman builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

In reply of:
> Hi,
> 
> The nightly build of my 2026.08.x KV260 configuration has failed since the stable batch of Oct 29. The build stops with:
> 
>   make: *** No rule to make target 'host-python-jaraco-text', needed by
>   '.../build/host-python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf/.stamp_configured'.  Stop.
> 
> The cause seems to be these two commits, which were backported to 2026.08.x:
> 
>   c58cbe478a package/python-pkg-resources: new host package
>   c647377c53 boot/uboot: add host-python-pkg-resources dependency
> 
> On master, these commits come after a series that adds host variants for the packages they depend on (760fd221a1 "package/python-jaraco-text: add host variant", along with jaraco-context, jaraco-functools, more-itertools, typer-slim, typer and others). That series was not backported. As a result, on 2026.08.x:
> 
>   - python-jaraco-text has no host variant, but HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES requires host-python-jaraco-text
>   - host-python-jaraco-text would in turn need host variants of jaraco-context, jaraco-functools, more-itertools and typer-slim, which are also missing
> 
> Any configuration with BR2_TARGET_UBOOT_USE_BINMAN=y now fails to build, because U-Boot pulls in host-python-pkg-resources.
> 
> I tried cherry-picking the host-variant series onto 2026.08.x, but it conflicts (python-shellingham, for example, does not exist on the branch).
> 
> As a workaround, I reverted c647377c53 and c58cbe478a locally, and my build passes again with binman working. That is expected, since 2026.08.x still uses setuptools 80.9.0, which includes pkg_resources, so the standalone package should not be needed on this branch.
> 
> The 2026.08.1 tag predates this backport and is not affected.
> 

Thanks for the notice. It was indeed a human error and those two commits
shouldn't have landed in the 2026.08.x stable branch. It's probably due
to a confusion with the "Setuptools version 82" that was once present and then
reverted back.

It's now fixed in 2026.08.x (`85dc4d06c4315eac4850fcc138def8c5e8aab259`).

Do not hesitate to send us a message if you see anything else.

Best regards,
PERALE Thomas

> Thanks,
> Michael Moy and Claude Code
> 
> michael@moysys.com
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
