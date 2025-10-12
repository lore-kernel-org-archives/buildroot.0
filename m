Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21105CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7CDD6103A;
	Sun, 12 Oct 2025 10:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dCq6Z9fqzp4; Sun, 12 Oct 2025 10:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95F760F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95F760F96;
	Sun, 12 Oct 2025 10:53:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4930ABC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39EFD60F96
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h823nLoWDN2q for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62ECC60F92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62ECC60F92
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62ECC60F92
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:53:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4543913F8C0;
 Sun, 12 Oct 2025 12:53:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 12:53:01 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 12:53:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Reynes <philippe.reynes@softathome.com>
In-Reply-To: <20251012090508.3444244-1-bernd@kuhls.net>
References: <20251012090508.3444244-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b717be0ac0be8e52b3db54ae854cdb06@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760266383;
 bh=4/iKQdKKMP1wyV2vKRat5m83/tS2vS2AmiX4NcCkYg8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d2yzZi3Zeurggs+icq5FfTSU4uSY0IELfyYiu92jDTkzMtD7KMrrN3jQ0oyxYgIu5
 47pS3wCyMykUanysz9CPbppXuJKsFdZ6cpa3XTj4sO2Kk/PfW0vAVxF3sKF9bD9/FI
 ivgd/qoTZNkpDc1bK0Iaf557+WYldKQGHS7Ki2CmOlrPq/4jSMV19b8XCeR4fxayY0
 8G4zykKYjM+H/uSukByVvfQUFUq7NdGiPZnd9z69Tr2b25MPtdM3+25AcFroPkPFdM
 nYyUQkytIGkT+jP7J0qmpCOvzJZNZ5w3a1I/AZYnOTyHa/dWmMhk7jKMjGmnn5+z7s
 YRvrh6NXI60Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2yzZi3Z
Subject: Re: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: add patch to fix
 builds against libopenssl 3.6.x
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

On 12/10/2025 11:05, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.org/results/4bc8df69ddb9533de7d877c42e5f7c39192ca454/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
