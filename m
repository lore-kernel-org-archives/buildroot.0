Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BA606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A0VuY2oL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC5C81CDC;
	Fri,  6 Nov 2026 16:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT_27J2Ft2J5; Fri,  6 Nov 2026 16:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C720481B48
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981403;
	b=OGyX0ExF/Oa8CAm7mX3+PJxK3EQn1Im1mcxEqefzN3ei4anUmpQ+QbyakqjIRhJBWVLB
	 3DubujYHV62j1BoLb3szCgAMSVA5/DHncMdZlLrS2+fXq0vWQo44ucZ9caAkbY/WS9BSB
	 NoTYGl7uvZ3PwFo0FMFoSKWNzGy1Ggdl5Jg/CGhwndKbvDqRFfPpmFmwC3xtABs9Lj9ba
	 69MP8duzqeO9QD2izZuV8Y6+CV+KTv1CP/OCnzV5Lr3ZCO0fd30xScIdRLud/taiJK/d/
	 4QLhB44eIZ8weGWcrKc2lJt/iBV1tjJTgd8m+/pI3G4of2p6Ih+EDZbpMv5hRgOwkhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Okqs+OUcztpmXwTuDge5kMWiLeCGsnMg03LZs/KX5LQ=;
	b=LwHu8A9pGf9MFghewsyGHMbfASmIwO/HH/VReTWnMrH0ha4kuTfLF64rwu4n41pHyqXz
	 NRIKVEKOE0DpmrFADgN4iJa8ftX6kows46Ehg6JOPDMEpXQ/WeroDrRVmCgVmObrSkjf5
	 5SFvzrFe1ejlKiHxf3YYbtfJy1AG5d3pGVvmnTwaI/4FlEYRN7ykNQWKpkHwivvz3UBX9
	 qYV0/TLkqYUNfHlyJxd4QDvZE3VoQFgd9V666u64bgKjXGp8a28anx0wtvAQqJ0vflSBf
	 rL0/GTltK9zQYQFiQIJ6jBskUeFBdwQqRr6ZcNcM1Y2YT/xruy8WJE4B0jkPhvJ5OeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981403;
	bh=Okqs+OUcztpmXwTuDge5kMWiLeCGsnMg03LZs/KX5LQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A0VuY2oLNk+yUwyfxCS042OKQ7sPJdGRokGiztLa1YpP8EZLsmku7SIJCOfnty8JE
	 hGwRQ+RSWpFwJpbit5EHubZHQJutBolXPRGN2ceJC9l483IAuKO/LAoD/xLtRUPccZ
	 6L8uOfylrhZeG1D+wosI4KlzfuYmAr6S0/o18cynnvmTBKjrZ69Ce0A2VG/Y0KSAnJ
	 xSzZVQ0DhJxQsT9hGXq/m8PQcZpjQvrNk7HnDDfk/l6wmbewbLX+/f+N1qJWxvDAkl
	 0JhVvi9lufadD8JJz4pp0+5RPsf53O5n1brsX+19gkeCUDK88hD5uurUFcrrrDosyG
	 cV24WwbuN6dGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C720481B48;
	Fri,  6 Nov 2026 16:10:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FEE2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE6660A4E
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_eyPS8RbJlC for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3DA4A60A8D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DA4A60A8D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso515954f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981390; x=1794586190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jJJZ7/t/tsPqjuz7HvqF17T77B2nUfMcP4J0lxbzBiM=;
 b=oaIjW6YttpCGa9ZfDlaL401j2Qhq2NM2HFTGqg//Uw6KO7/m0dx4EFD+9NbjF6qq4a
 /6Xlt6g8iEUL3SMSlisNIUzSfpaa+/z9yyKmsbW8SMXnW27a0Om/hzzg4erOSTXr15CX
 JwDPjiww9t+eV0XUvAJVjLTgB2Y0NXOwG4aZ3uyulpUky1seUtD+7LaUZW+pLGMKqLGC
 OBlWGJTzaQR4631RNeY44hwmZeRCtoOR3qQyuX1ZCkkIHh/mK0stF/9VvfncrFN7MfZy
 BkxtX7LOjAzFP8Pt2vvuE40uNj5aJyYndjldypzO3XEL5hkYQ1CxN2spo68f6mUD6SUv
 CVLA==
X-Gm-Message-State: APuU4Z+e9xq94xQ8x/hBSYyXle/MjIVVIAWzW63GvF7xBTUviHQnHv/o
 d0mHP+t/iQ1snvJNvSXwxf4V10SwNoN9/m5Vc8ajzM8eRdjW0HI3o75Ktv0jkurcPlPJFS17pbm
 SizCRirY=
X-Gm-Gg: AYBFou2x+3BcKgQa47OWY+RTjLWP1hB+d9wJBPgLyGMIyazTRcrn0Rs8avV3/CqF7p0
 15M2cVMfij7h8N1x9/DhZL36bt+3hCFcuRDdyxpB8WxSRV9KK4Gwp9H6FvibUZ5SGIVS5mZvOhH
 10mcV1+aU4YU24h09uYi0Irq6S7jeA9WvWbS0ox/N50TCnajSX8fsZY/NW8gplcz7Qt3AzW+34+
 +cSSs9G44MpHXVnhlz2ya8in7dZxYBpDmrLh/OUG/EyrQ/3jAbpABp1eGUJfVJWkYBoxSWRbBTA
 C6VMGG0mPblDTKQvTF7g1R6pGkR24La3Vrtn2H60BC6SPrf7vHXZ29Rl9ho3KcRjDMVOkUCN9R3
 KlkzVqNMMTYZT2xXRZ+H5XCGZyVWJv67l1Mwgq+V5/83oCltkbX+QDFeyt/S1qBiN0FLdjQuYmO
 bVHkul5msn3vLqaaBIytykN63qgFj8nZxDHQucVhNTGVITZ4HYvqBqOA0k1Xqm/ImBrs2SFiQnb
 EVTBzlVbZRM95LyBN0mFQzEwPYf5moqkGpodN9feJuC+ZnrdFO8eDZ6VMZfIanG1856wXsytpyw
 CWfn6g8/xjTGv3RoLvl3TpO4xIjtkofq2G++zQ==
X-Received: by 2002:a05:6000:2893:b0:492:5ef7:5dad with SMTP id
 ffacd0b85a97d-492764aee51mr6001773f8f.10.1793981389409; 
 Fri, 06 Nov 2026 08:09:49 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d809df21sm4394710f8f.54.2026.11.06.08.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:48 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:46 +0100
Message-ID: <20261106160947.607347-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027101235.2876416-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/mender-update-modules: fix
 LICENSE hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The SHA256 sum of the LICENSE file was incorrect, leading to a failure
> when running `make mender-update-modules-legal-info`. This seems to be
> the case since the introduction of mender-update-modules in Buildroot:
> the license file hasn't been updated upstream for more than 7y [1], and
> the buildroot package was introduced in May 2025 as Buildroot commit
> a474642fdcd8 ("package/mender-update-modules: new package").
> 
> [1] https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.08.x. Thanks

> ---
> Changes v1->v2: indicate commit introducing the breakage
> ---
>  package/mender-update-modules/mender-update-modules.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
> index ec879f46a1..f6de69c42c 100644
> --- a/package/mender-update-modules/mender-update-modules.hash
> +++ b/package/mender-update-modules/mender-update-modules.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
> -sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
