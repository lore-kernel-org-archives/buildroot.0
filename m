Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2751606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MAPdLXic
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2416405F4;
	Sun, 25 Oct 2026 20:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz24d89OLycX; Sun, 25 Oct 2026 20:51:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90E5C405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961507;
	b=P21zL1fxApZJOiT03pmg2u1ftE4wDoLINIk+TREjouWdrGrvp5GnW+lZlYeHf8mjJxqZ
	 NJV63fVahnIWdY7uJ9rHGNrId6e5CjeNfobZGhCkx8TQySFAiJv/jE/DUYm/2X7PXnYGq
	 0JNHHhDyEV30ozhiqpyjcxbA/2SmBgIXyakzA8DX+a8VBFkhqumK8kET4aEDIymzMAYsq
	 /nJ1AVvIxvcIUisB/4oQSZS0j8xf7aSg9FcKiv5HqBnmH2mI2+mI5gkbsUk+7yUo11pMd
	 E3ZEzm79saPgIClPY08yN0CsvJZxI7U3VnuB8yaETeyoFAfOHghpGALP/l8KpBKpbkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=omB/L8V6I6hyVB6Vzjc6UUQUyZ4agNfDlbktgQ7aQl4=;
	b=IvlZUOEcPqH8hR4vDhw+U8PgcbCuYMffpKTpXoVS8X031X5/e+trT8IshV+erAoCmtcs
	 pCrH3m1+XG+pFz1/w5BzgGFV1BO0/+va0gVNgsDUZ7U5XrgsddzVLXQ3nPbnxng60u76Y
	 WWDUOww8LiUts4jh4QTdkNlPovw8vSEeaNAI2suBqV42KTzRsTpxQ4SD3yVTxHgFRCZF5
	 EUodX001/lJqqmKxYRU/Y8H2rW245pX/QTk41NaDKI7bzM+FnqmqzFW90pMntj2RIjxjU
	 YqU7Jp4hMM4yL4GNebGIJAv6n470Aq0TgHBbpCibkjNDTjVRW20nBuIg+FWjy+ccSsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961507;
	bh=omB/L8V6I6hyVB6Vzjc6UUQUyZ4agNfDlbktgQ7aQl4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MAPdLXicC5Un/I5nKxodQjMNzNA8sy4blcOUsJ2gyE6cURAdZI+q7E+PzttBG2bhj
	 8s6iTOt/3z9eyrq3ZgyxmDtUl2zgoiAbjtwvYUD0Z0fKFkGmTYwAft2Yq7FXZe3eUO
	 u6iEn6mh/MkHeikgxi9MhnCzD+whjNqfCOX9EkbmFlew/FhTsBu/H8AzYLf4+3W71M
	 bijT8H07gNX8c0wUMsfJ3OrqjvPDoj8qMwfH72z4eQ4AJ+aGfmTJ6yvPTGbT6hTvkT
	 94MkLSO1Zw/6Ut9ZNjjFFHBttnaYfQQ3qEp4oYYtZYgxMfVB76X1L1kBsFlRS/3/LD
	 Nw/RrF6h4eP7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E5C405F6;
	Sun, 25 Oct 2026 20:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE9C356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C9B0605E0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIUKqqBmQfkc for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:51:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F00A6060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961504;
 b=iQ6DZdbLXl+wHgON7jo/XB7N2a//0tIOR/wQbF9ZaIYUuujNDvfBK/MPjn9xZ7JTzvvR
 fq6CG0MjA759HjGasR+9ZZTgGKlIu40TbRiJmrA1Lrd8/T1N0esS9DzKelBQNNaNsJbdA
 xr++hnZNXbFgGEqSIFkmy/uXDHesAagK2Eb8up1lXEpYp3NcDNyyFHoM906n1GVwD0dCn
 6CmRhmqFoStVCzcX5REFIpQDmTnC+bBxP/xZ85GSn9IRmXsmNAMiEIufkhT0KiEdk5JK1
 3S1Rg912SxKxXIqB/NEolBnGwdJdkwXV4EvGwfhJJtrvC5VZzruwis2MmCh5ruIURGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961504;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=etE+lNIhof4r0AdDmplSDYAkLCXE/b8diuWC1KrNvyM=;
 b=DzJ/lJKO6fecOyMCVIf1AR4D7ZZxITAOUK5E4uwZ5eltXg6Phw71iiMdTPpe+32gbNLt
 sNgJtcApnMbYGE1Wuw0O7ms+Rd2Ms2oszSHMJkY75Ft3xqX/qE+QgbgoR5QR88aoP22/X
 m8vSqQYjcGCkvGnVcNLY2XlxUMcwQjZozWOk52RMy5hdNw6l1SNz1GYdm1ZIafpVBnL6L
 /Z2lyNHuzmlfgOUyGEkyBX5b/NUJDCxa0UpKDuTgsBd0WCSLEybI0hdbuHSZfi3k8gyRO
 yLr9iPeLynlxwLE8uuHV/ZRUan6Ge2khnu13YBVcbKLlX0Z0fFMq/65MfSxWw0nBXrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AKnRuACY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F00A6060E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 52D184E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 294C560740;
 Sun, 25 Oct 2026 20:51:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32C411032902C; Sun, 25 Oct 2026 21:51:39 +0100 (CET)
Date: Sun, 25 Oct 2026 21:51:39 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Message-ID: <at5r17N8MTwdRaFi@windsurf>
References: <20261024164906.3150226-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024164906.3150226-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/msgpack-c: bump to version 7.0.2
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 06:49:05PM +0200, Thomas Devoogdt wrote:
> Release notes since 6.1.0:
> - 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).
> - 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.
> - 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer().
> 
> Switch to the upstream release tarball, as upstream now publishes its
> sha256 on the release page.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

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
