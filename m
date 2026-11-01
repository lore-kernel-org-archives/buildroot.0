Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D6606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sZ90tqnC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1159D6061B;
	Sun,  1 Nov 2026 16:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D14GzPPJrlzj; Sun,  1 Nov 2026 16:57:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C9E77606C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552252;
	b=nEJPAVWjweIV8XH9fHOhWe9wKewUz8zhTYxtcrQCB9MWEbckQPeMslWjkgEBFJ27PxZD
	 ET2AQOlx1Aj1UcQ3TeWZT8+n40rUy9jr9iHB3u8kb9hiapg7G1LJR8flVGnhxWF5I257/
	 i0hjOc6k2XOuHVcsvXj9Be77MzsdpLvF3ztOMI8dDAhqcLxtbNWYmYFZkXjC0a9tF7kK7
	 QDfkZ6CpDneVh9+1jcscH9yFI2l6G4uLCvHZvpKAXA9i4n5dqGmTroIczAbVjQLoTbBDM
	 8EymbnBf1bLTBQ3RkS5PvmWBFVLHplWAupqxPj01wkFWyG9MbiYN3IK8hDo8r0foQoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J9vkNdPzZb/hJQKyLa8j5srjLTptlFKStRQsqaAdglQ=;
	b=qyvPJxUjhSlTQ87BTJwSQ7D2At7pPkbnERvkFI7d4RQOWait6nS7V/28R1wHG/Z5zLwg
	 vbBdcxCX5kIKB7TFLnH4bIXq2XKm+1kqXIujB6LH4XLkyI6E8TW8szwljbsczaaEWlcqk
	 7yewq7oqNn+lEhLtXbtLKg/Eb4eoDd788Bth8xasqBQHFvG0MK7xtBVzvAUT8YwTrKu9G
	 Oo9llV9XIi6G/SS1C4taxRxc82yFX/15ZU5dIu0xbTdUSWrnDx2PNb8y0dfpEkusJm5hz
	 0mOBEvZfwMh84ml80SCH+puDKSQr7M8nn6GvdoXX1n8ao7wXiVVU7HfBMou1ycgFh0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552252;
	bh=J9vkNdPzZb/hJQKyLa8j5srjLTptlFKStRQsqaAdglQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sZ90tqnC1otIJdgUVg718IZGPSoHtkJwS5UQAydfSrF8sT3yU99yzb2Cu8/rN39a1
	 gyrfN1INbimZf453Uv+3VwbQDffzosYYfS2ZL1rGawtqGqbMD2PqxVcM2OQfcHcXKC
	 6PaZIwkKVPBTWk+V4lALBKUVLR+e69oM1yT+SqlePOP2SEf+kNSqYFfMlDeYFzpHrB
	 yqK208CKdZ9tewzrBre3sdiffbrVb0geCFjb9cpSbxHCQaZaeWyfOSP435YQK+ffcr
	 MTOrlEXdt29R2veYU6d2zhVYuCrQwFtFddkmNOvNA4lxDjo02rvAFeO/khU/DTpwsZ
	 HvjPL0wUfSl6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E77606C9;
	Sun,  1 Nov 2026 16:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 660522AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BFBA80DC9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHWQqfTjf0k3 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 712D880DD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552250;
 b=G9EKReHijH8rmXEO6T8WvnMJa7TnXusbRVVWraEhI6hr+RW6+BbfWyQQBWYFZ0Iqb0ob
 VLwPYQeihbIzzMedBvXnz6bCWscz0vAATmGTxoY8v9QhDkcvdBaG7jhjMli1G0X+AZpS8
 teBSGTVfGuTDxv96wsoW5wRzmSRBUbSbri55Gc6aBmsZ5MkfM6AEKXZc0N/4zPe2xHl82
 wqXMxfoxLrMG3y/ix+c0zeoSk64rS/ET6tyU9ataDVtAn2pKQVWXH26QblZsI/8X4k5mb
 RMS99Xf1zCJlDs/97d3htxccyqmzntSiHtwmnMeUnwdyA+TXPul15BLxTgESGhtZY1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552250;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=r0fu2B94Sj3pXqaLG3op6vbuEpJ8hvXHkl9n4LViW8o=;
 b=PImbNIw4WjxDc0nF34fJVl/kOsCsBUe+3ipuV2EiaTv0CmdXcENByyqekyWxcg11imiO
 Edl9fPoohNhoeV5MKLGHOMhlwfkygzt6hqhLlZg+31FHfobUsLQomw8C7NltrpYIoFOXg
 Sig8Oq4aX+duxSVIwstr2CJ026B8eclNIfV7hiF4f1FEYB8WjmGeNCF2ZIF1WsCZ2NNcg
 +n9JI102+8rsdZ2QS8ACvBF3UWSXlF12rlEjJ8tWWXS7NHu57qtRAn0m+hOQL7KMFafzN
 Gv/VfjT5Y4nLm8Zd8fLS7JGAVKBkPM74/GVDRk/u9WSQNsrJTZxvTomaucE9xv1YRnA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="wRrAQ/w1"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 712D880DD3
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5A06F4E41378;
 Sun,  1 Nov 2026 16:57:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 276DB60750;
 Sun,  1 Nov 2026 16:57:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F5751032912A; Sun,  1 Nov 2026 17:57:27 +0100 (CET)
Date: Sun, 1 Nov 2026 17:57:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <audvcvM4a3O8Yq45@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-2-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/6] package/gstreamer1/gst1-libav: fix
 build with ffmpeg 9.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 11:45:30AM +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
