Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C56606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Onmx/iWk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMt0eyT/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 935FE8104D;
	Wed,  4 Nov 2026 11:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sdQBgXys_1Z; Wed,  4 Nov 2026 11:57:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9813B80E95
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793793451;
	b=o6olNpFCEU2SpQGJOz0N6VhjRbefT2l9ejaiJNKRPC5arLNW+ohezMMSk3ecFWTYdEwI
	 BML09Q5dHkTjn/UFZ0pwNOFvjqPfHyhqaDA6XzdUGKYFhl/M90PgzcLLmbiR7VAlk1u0u
	 0OeUFNsAKicy1V2aQzvQwvEZvJC6dHO3BfF4UKMI4/oWLiW2amk1M+/nkh3Upp28C0o7i
	 oAz9mqpW8O8QTYge8TIfMqscNoAwQdODML+RvnYrpPvIOCYfd/sld/KLpdjbLNYUfdeCh
	 niIEVncOmb2803CvU5BdYiFm4jLOMvz33RoFp7DYlIrfNKwbGyoiGTlkpWnAVn08jTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793793451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7ZRlJh4uOwd4fXjU+GNAQUeAG2a6lxXxZV1DKmbgApY=;
	b=Bhs0Azk++PKZQ6K7NmpY/I+lrGm4gnXFvf+LVMeysaDV3FNh9xYsmx4MCY7YuC8MfLoW
	 KfPBxqw00zzneru2x/pbaddPs8rT4hSNb/WDfVMwRU4T4wfAWDgBFNAqQivlOO5y434EN
	 NpehYpYXx/fOS2Y2m8M2TvYIAyC2evqCOuYsZi+bYNHvAkGIjFSomnEl7JN4sJnlBTyx3
	 5RC33+a95Sa+rHvmJmOLXg63Mg5lttEpmCAc1b2YqoyUQxgLmB7Li6i7DUXuKpa4fuhph
	 26OcCq/EFEf6+5F52qTJUPPOvwpO9N8yufJe0aALbp+xuGAeL7LBx3dnUhrIntGIjwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793793451;
	bh=7ZRlJh4uOwd4fXjU+GNAQUeAG2a6lxXxZV1DKmbgApY=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Onmx/iWkblTv0A1y1nUBo6CV6HyLhGp77c89Ft3tT6s12fg91gdcrjDmm2JLb6RAY
	 sVIxBmklORUiE548gWCoYRB7Kug4E2yqzwBHDqH2f863QeXIW4ixph17LO/DwvBteL
	 ao+2sjsE6sM9WEpoDjg8NV5xRZrxvyx3D97Nf49KvXn8OhHxwqcgY5JnSg6WzMe3l4
	 f1pcD+kAS13sgZipUcySIIqk4vqqfc7I0xqn6h2uXIOBe97PZJaayRQ132fP9529tx
	 33J6C5JkAZQrfHgyWg7gZPFyN2Ea5q2Rf1q1yt2JtWaKxwBHv3B57Y5gUbImNXYS81
	 3t7y8Ajnr+3TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9813B80E95;
	Wed,  4 Nov 2026 11:57:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 112CE411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0252160755
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si-FSvB5Bqgj for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 11:57:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 051D46070E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793793449;
 b=I5Ak5ihku6vpN3ug2GTfkpHFFoQG+MIdU82nvmjAGfxe1BwgHAcgPN2p+VGslJKNWFPM
 P3uzy5GmJrPqkdPmwx7syaB0dVgF+LOTZPpuuvoBZ3E6KEtyz69FVOzOVEeEPHXgWmam2
 1GH+PQhmRIZkjGDrfDUPoD12pLWIH0ayr8U/GViQ07he0zvjGMlS3MPL3Yx/U8jiiUMEK
 2K8QFu9w9qfbisgK3a1v85dpOmCeTF8uJCFrgSNQcokzz+OLAKG7nBt2YT25cPUhg3Phk
 BoLpdtVGx6Q/cLb2DMpgXgyKTB3HuXC0MOkC82NjJY59n/NNTYcwtVaY7CZ4oOPei1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793793449;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
 bh=z3zSKhiNrFHxG1fspyzrlvsmDhcwvGwceaimjWph6Q0=;
 b=dFczmKXBP8XmX3PLMbDaD8G5v5l8dhbzv+ZEejH+rwnA1msI0oQrgVlO/TtbjwZtNuux
 IqEi1JdMZU7691OkrUNZuZRXOhGO4z06Q1nefnC3m3BC2bddyQgaG4UPc8WU/Msyw7T7i
 DzriPEMbS4TPLaTGZdSsIAc/CvI6zdDAQwav9VKoPnYxSw4K1pJS2QFEuo15TT682kDcI
 SxqyUxUrin45wd3IhpsGhk/Lf7X5LUjFBb5pIhFmWxznOsaG7W5XXyGxUgCYmIBiK6jsX
 vuupaKgthgFyDNrEM4Ck7nzr6vUxd4FA8oHA+UY6S5lH9h3D3O/PJLB0Uj7jqvi++vw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="BMt0eyT/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=BMt0eyT/
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 051D46070E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:57:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so373246f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793793446; x=1794398246; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z3zSKhiNrFHxG1fspyzrlvsmDhcwvGwceaimjWph6Q0=;
 b=BMt0eyT/nxlOx9BcxTLcXzch4WQNRd/0AVFI4yGJITuzHAYJYBS9BOBQVKLCMhzCAV
 Tshi3Yijuid9jaGnBd8M2F2K13bLOcCkoA+cthYm6imcYbiy1q3SkTDDAb+YSf/6tEZY
 xRbOP6KUbTSiW38BuKmfGK3GoutlXJ6c1u3m1wn0jItEf5NHikBuYgfocF6Cme3A/8Fh
 6qZiUTtoQQnIdyfX34JfkgaEFBQf3RYC7+1kzPCEDEMa5igRanNYTtE7D6FUXM20SlRt
 X0oK1xsiRnLmwTB+IEFfEKuG7kIn2lCWCX++/id9I/9lQkenGsicxh2uFJD4fzKiYoi7
 WLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793793446; x=1794398246;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=z3zSKhiNrFHxG1fspyzrlvsmDhcwvGwceaimjWph6Q0=;
 b=iixl5EQ1lHi6zFRHPeb5VSxb4o4qpzBclowYUq/I/ya4qUMW+krfSSKkBqpds0vu74
 txZoPmow0tsmYvICF+O86XU6bUZvmJl+hCQPAS2KQa3DP5vJ/u5r2Xvb7a3HbVz7XiDN
 29UHxtVjt6qcBBP34PW65s7mi3Fi9a14J/6lBx668TxEz7WXdXJZKwflrU128cf91pIr
 cDadzVIhfWfjbIzCwvCmIejZA5KADQGZKvAhikSo2PRo7DA3TT47W4k6QyKsOx9EWqll
 eWcSLImPpb2HRgMoTxqcFAtBmwxth3Mum2/DwiGJcKxWeC8lp3AouyDCiwkOudP1PHrb
 /9eA==
X-Gm-Message-State: APuU4Z98iYxV/88S7vW+Sei3HOIzOgpI5KjSCbJSsFCVpzFO7Dhw6OBj
 2/7nZgpxBQB+bx5vBafJsh+Skc3nEv1s/3NHSjL03d6K9SBNcO/0EFElHhYegA==
X-Gm-Gg: AYBFou0X3OgKrQPBwV3iWPwkdFnk6XFO5Vj/b945Xwy4lYlidQsJIMLG/82ajcDdOkC
 AFFVlRElGuVFFKFIQ3nbPqMzSRkUfnMFJ5k3o6SqbKpuH5hCDMl8oA68cO9LM2T+HrwHRzGekfY
 +aHvfNwxD7Rqca4S3h57YgNN847hWG5Q8CMArPkKk2XcLM1eCVOqXYAZmOwEOmycWhSTzRalmiT
 63K0Y8wtvxE6CEvpnu+CJtYk2sesGZi1LOzIHCX4PZvN3skLpNROT0Au8i46RqvgMICn6kSC4pk
 UWHi1V11iULGmqNd8p24fC9oEV62MBsCX6NBUULPXJcBkpMuDwU4Uyr9tzNgJmz98qi/IDRldDM
 S1orBuhe6mGl1Ey3wBJPTDOBHpox+QYjocxndVYIQBV4b7Vnq+VJz5wBH+y7VTeiJ2JqPve5jwO
 qGu1TC4k4b9AyMmvF0ebujKnlZE72kzb9D0wzuFh/CwkHBezvca14zlclN/JJoSId+YVBOaDVma
 TAV+p5h8LoSN18/8uVfYrCRVxGW4vHRDJXfyjW3eXSoy1Eric4PzGiV0GDifuUzOGAbnSz6H4wI
 tK1WodYKAeAiYWBJCPxr18i/nbpx3gBPKPZN1RQuj4kBzIqyF9X9pXoE2PsJl6ILnTjyM7aQZ3k
 g/xPTWjkEnPp/IOoSg6E8qg5ffexuS5EmQhRZhxTDEA==
X-Received: by 2002:a05:6000:2587:b0:48d:dec7:974c with SMTP id
 ffacd0b85a97d-48e6e2bbfd3mr35552226f8f.7.1793793446265; 
 Wed, 04 Nov 2026 03:57:26 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed551dc5sm3575392f8f.34.2026.11.04.03.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 03:57:25 -0800 (PST)
Date: Wed, 4 Nov 2026 12:57:24 +0100
From: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Message-ID: <ausdpCXz_QhSTWXa@leo-ThinkPad-P16s-Gen-4-AMD>
References: <ausYh9iXygm_IJ5A@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ausYh9iXygm_IJ5A@leo-ThinkPad-P16s-Gen-4-AMD>
Subject: Re: [Buildroot] [PATCH v5 1/1] package/qoriq-cst: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 12:35:36PM +0100, L=E9o DENIEUL wrote:
> NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.
> =

> Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
> ---
> Changes v4 -> v5:
>  - reducing the number of patches
 =

On Wed, Nov 04, 2026 at 12:35:36PM +0100, L=E9o DENIEUL wrote:
> NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.
>
> Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
> ---
> Changes v4 -> v5:
>  - reducing the number of patches

Please ignore this v5: the version bump and the patches are missing
from the commit, so it still builds lf-6.18.37-2.1.0 without any patch.
A v6 follows.

Leo Denieul
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
