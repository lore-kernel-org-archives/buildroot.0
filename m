Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03EAD39019
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9624F60DB8;
	Wed, 14 Jan 2026 20:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k4eh8NEG6BW; Wed, 14 Jan 2026 20:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB1E60DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423163;
	bh=uU9dJXXEt5zU3js/MTX2/Yhiyz/qpU3SGJDMBkXdOJ0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IkDCYm7q4eEDKhGber1GtkpjtAjeL3D8J0u7TwHrjGQV0LWBup545wexO+jLroE/1
	 D2mUZYC4HgcXKTjlYEegGPXCddf+mNuuqu5slJW95opMEMoO6KDvrtPOcqgZIsEy6h
	 hcG/geNyk9uHkxI9WsEAhUNpAmwtd4fm0xDNO1iu8eP2fDbHjxscCny5l16bqqIsx5
	 ajHJyO99qNkDu53JjojoGtYv6Z625MZ92Y7Ua2G3DHDCMUhIJAsL3xtgLHEz08auJa
	 bpDGM5uasv3vx3OGVxTKkMwGqAn0X0kgkxWq7B+a15R2hQY1IEaE492Q7z/6BDTAM2
	 lnCMO99ycBjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB1E60DA7;
	Wed, 14 Jan 2026 20:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BAD9232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E535784028
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ep-nkoPymgH for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12E6384026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E6384026
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12E6384026
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:39:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D8F2220039C;
 Wed, 14 Jan 2026 21:39:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:39:14 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:39:14 +0100
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260114155946.70930-3-gilles.talis@gmail.com>
References: <20260114155946.70930-1-gilles.talis@gmail.com>
 <20260114155946.70930-3-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5349d1b24924a0795efe47b19fc36d90@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768423156;
 bh=zj2zEZC2PKFbGV3nR2GvYBrktnxeNmMxxb/uuHL5C3A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FwfmDedZg9ccZOAd2kTPxTDT/xu9LUxRXMmhH6xhnP7pMIFAEJAO3vOVttDTc+uNd
 sePbeZuX4rR6WbVmBJ83G8BJ8AN0SkAb0QFLqnCJkKkOEgNBGm4KYg6SYoxZF/uyqH
 p1ueKscOH6HKmQ63yYdmaPLl5+AvEVjUQYLer9crqW9UdssHtlBWNQNduYd10RgGYt
 RVSzG81eb2HQedCvcKC7aYbkdkiIROtPp8Sl3uo/J4G/8SxqhZcZarojZuSmoj25vt
 +IOPBnq4/DleyTLEB9OKXeTnjR/sOv8tnPmCZJnzEDh/2miI3aWm5IlpEl9XKIq8nd
 mg1cu1bX+F/JA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FwfmDedZ
Subject: Re: [Buildroot] [PATCH] package/xapian: bump to version 1.4.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/01/2026 16:59, Gilles Talis wrote:
> ChangeLog:
> https://xapian.org/docs/xapian-core-1.4.30/NEWS
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
