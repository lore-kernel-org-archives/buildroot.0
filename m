Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C174CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3436109F;
	Fri,  3 Oct 2025 20:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ov5zqWWJTfgo; Fri,  3 Oct 2025 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF301611D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF301611D5;
	Fri,  3 Oct 2025 20:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42CE2118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34786611D5
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTfYl_BIeeRr for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E34AD6109F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34AD6109F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E34AD6109F
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:35:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E8BDF60147;
 Fri,  3 Oct 2025 22:35:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 22:35:52 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 22:35:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251003201200.2430182-1-bernd@kuhls.net>
References: <20251003201200.2430182-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e467d976bc6bea7adace142464eda7e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759523754;
 bh=K31eaZEk+HoIilbm+6R2C0LBMUZA//z/frxNIoLQNB8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jvk9VN6qmrZsYasmcdmyjyl8trUaCeI6rGP9y1Y98r4ljpOHUwm2YkDE0VkkY8stE
 cJKxo+mNchtvNKzb4GEE1jPFpsFAVLcpAF87yNr+unv4d5aJKo5Adiz0mhxdOzY1NE
 unyLFbOQMFOB24Kgx/O6RLOsEQaKgTEDjvJyVng18C6gYKy4P7jgSDxnHXctWfCOen
 eArqwZCQhu9goQwQj/v2P/rZnhdQsxnepVNGCpCEFjWB5BNNJ0S8DviRrqdFL1IAke
 W6hseTYIToQPHzSXGm0H8y/TXAUi9FRXoMrZFFBiDe7sovsCBqo2uUD9pFIj9tZT5t
 mw6qNTuePX4Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jvk9VN6q
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250812
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

On 03/10/2025 22:12, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250812
> 
> CVE-2025-20109:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01249.html
> 
> CVE-2025-22840:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01308.html
> 
> CVE-2025-22839:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01310.html
> 
> CVE-2025-22889:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01311.html
> 
> CVE-2025-20053:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01313.html
> 
> CVE-2025-26403:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01367.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
