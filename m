Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D3606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lj+WHQAr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9454E40581;
	Sun,  1 Nov 2026 17:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXC4jqesIxND; Sun,  1 Nov 2026 17:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCAAC40556
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554932;
	b=PyoTq7O53DyvwaVWLEsjioUs00KOKspx1BdnzYcDrHCsMx5/I9/9QRdX2eq1TpNf5PCl
	 ah0mX9V24xIp5yWKMwXO1BtsCO6NbyZM6Qlq0wqKqjZmK0kMK/k3RpxFyQwSqkgLq4Z6m
	 OuISCha4L/+ZuleGXv+2CV8nFcQPaPSXu1mc5RUprtJ3wwRPPnFimRDdZosQJYpritjkp
	 RaAk5lYKaa7Q+uwQBJKRb4Bn/9MSgKD6V0Hb+ZccPk6QRzQFsvJDKYhQc7JBs6Fj9TyMK
	 SK6oP3PwVnekeLHv9jF5m/2/oHSkC0VJeTITnikdRkdUoPFmTvvQCcUUq5GmrzQgcow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554932;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qBM0RN+aTe7MzZtgBeYAyHAA5imVpRF9FsI2DOCEGNs=;
	b=T99CIJYPGm2Wrvq7YEmtU5qwt6ikPxAPBIC6qg/3b9r0q1kdCdLHNptfzx25cwrL/VlI
	 k9t6DvaZjVMnY8qJjC5AvShOrNL6E/0cxovOxSDec3ldgnOA11t1pvP761lRox4X+BSWN
	 xYdgPOcftFSJMf5wZC8Q57Jc/tgfyV5ZY6bWFoyZyBSZIARP/iNdk4kPpDb9CHXvJW0ZS
	 7i5ehrYgldx4AjcnI76jfvkEswt1vWJ9vkKay7jGdbhRj80Y0J65LrbEAO86Mu0EGF6UJ
	 ZUcGKa61Zkt6A9y24aaZVTY5w9MoSpnymzCofUYCR0sjsJ5+XBH05TwJEIahaVXUkkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554932;
	bh=qBM0RN+aTe7MzZtgBeYAyHAA5imVpRF9FsI2DOCEGNs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lj+WHQArVM9EObUtu0ybHplO5Baz8xWznL0JDl41lw05mlk4wtfB8zJRTPw8B4lIS
	 0U9RNvWviJw0H0DzaSBvH93kYCxBFv5Uy8Mx4YoAVfcj1IjHdKplNZvnt4lvXxhQN3
	 O+F/U6IaYWfodql0yrOYMVdJeDdyr7S0qQEBglMWpb81h6QQpr3M+FbZEyrRHO35AW
	 30llHM1Say6Gpyz13fwxvordYSiNtlCxHm69OrTFWzqdhmOc74CVFhwZ7k9Og0xirv
	 BfZrViw9yrMd+KJyW9IHnHk/thTvbKXfdmQ/bSbp7tYPj/2AqjyqpC+JhGDxiz68Hw
	 mXruqBBiEMMSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCAAC40556;
	Sun,  1 Nov 2026 17:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 162783A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0726440556
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJDXwJlmpdSw for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:42:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 816A240523
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554929;
 b=i/DnasjKLLxPeFgilsI2CMFur7V1VcR8DbfI/KFR2/E5mFKyvJ2gdPrSD7rRtSJe08vr
 jh5GTU0Oa94hD0pWu5N6mKkPL9GkD/KzDYWtd95+aNc/4DNTzwvYvdtx4l1yFxSIXlFOp
 LfMnly4s2SiKqJfEgyyrfOMl/ExusfLuvxNj5D8vCxjtbSgS0XT2D3BI9ciSBWbhn5WMo
 JGpCwe2JXVSvNnhqrY76+i1JocH8E9inj1Iyuw3hU1fUVVXYi4pj4KkhMU/4cClJ6Sb2h
 8OwxNU50AXPitroTAakXJIPzbTT4FEEhgApoG035N3jZ3WmS87AD2CcRdObYWF6xMRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554929;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OwZNwzkK9XgDlB26jwR08krviuXjY9HT+i4U9lWxo6Q=;
 b=FBSSJy6Zvgxh1GaKVmDiix7FrFQN7HRYzQY2/fbOV4P4o4EA7EdtBxN5SvwCSTvZYKap
 IJNQFO4KHoqDDntkCQJdriQqtyY/DiAo+GVtKXVmKf85qbL0nhMYpn4/qvkWaGENuacUe
 lm3IJDVHy9UOJQxemXVxwYeKljNiFxz28lZQywJZ4uRxC7piXdflRDoQoKc3oGQ9CmXUi
 M9LwBBtkVc81SE0lIvOm296d9i72yUA7rSNw/nknLCm2hcA6+dZ5aHR99DrWn9o247tuj
 UKcLEWmgq/jdVuDiUb22xhUZbQCOdFJEGc4L7mGCcsKX5L0Szovv22ZNagzDeXkixsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pm3pO5hg; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 816A240523
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:42:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AA689C49F77;
 Sun,  1 Nov 2026 17:43:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CAEF560750;
 Sun,  1 Nov 2026 17:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C4AB1032855F; Sun,  1 Nov 2026 18:42:04 +0100 (CET)
Date: Sun, 1 Nov 2026 18:42:03 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aud56IjetXBf33td@windsurf>
References: <20261030173714.20684-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030173714.20684-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2026-10-30
 version on branch 5.11.2.1
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

On Fri, Oct 30, 2026 at 06:37:14PM +0100, Giulio Benetti wrote:
> This version allows to build with Linux up to version 7.3.
> 
> Fixes:
> https://autobuild.buildroot.net/results/772/772d3c85a05336b8702ba12094ebe70457d87469/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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
