Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06F4C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6979880F65;
	Sun, 27 Sep 2026 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjoHT5PQEbpY; Sun, 27 Sep 2026 08:58:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9E56A80DBF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790499481;
	b=QElz+I1c3HNSnSMq5dfGteWJ1YMpfgTzTGewqZ8SG6l482fdffswcV3JEvgjjymfbR2T
	 E1+5dprQHC0YY/nKBVd24YtBnPcQctraOW44q4u7abvrS6rYcptSpBkgozohqFma7qV5D
	 O9BNZsEz+AF9HnDwLfV/ty/f+qevN16MwWxYRGaGLZSEiP31aOZibPISghF74TjvwxIDa
	 FjqHiszj58fV5SKsOV10hr/XMrvcEEpj5Ygd4Z1sO5XdgGRWmfE4mCfTnmw5zB1n5uSb9
	 EXLG2XDV8c1joo0bPcREhwJjV1QWe0PzycoPT3W5WAiilbXQQvyAiB9tsvzXxo3W8Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790499481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RnlAVf/xJ60kA7q3342vtVt6Kka0teKg1NScx+ndO0o=;
	b=Xn6SJj/YoM0rzWy+pMaOkCm+HWUD0zGc0BXXN/eA/NS2L0k74jERf92SWIsKtGAeGNgb
	 5cBL+SevNLaCN6xMmGCmvmdOMFbrS/8eA4y2SuPJKyMtfD0hCRaqvxemNvLxnuszUCmfs
	 IdBkXZkC6RVhRtkqZ399YujEmtfZbfrQdNlsHocsjJAoAoFyyb+iYUH5Oa08hGnl2I0o7
	 9qJPC/brs7GCnBmEt8ucjfAiulnhAFO9MBxTOGTwtAPzrYvK9qm6rx1PTlNXOWmHDjzTc
	 zTCCrcGfHQHsmQjgqWrWw7m5ylL4ruUJMBPExaLASt4t8BNMT4XueUaG6+J4RGj0HGw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790499481;
	bh=RnlAVf/xJ60kA7q3342vtVt6Kka0teKg1NScx+ndO0o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TTtLCREcl5Qsf5Z6nSn9Xpy+HCWM3AQS9J6JGPpB8YBLVyoQdVQzcWwj6uUHUDAfa
	 4mWmFxigWKZueAbItyk0d+7kOf7TuPXmuVW8zUTgh5i+Nelpm1Cvp2RBoxF5hCyEJY
	 Y7iJiL9dCjra1GnNbGg8qnGjXi7O429fU9ZnabXyD8W9/i3WyvRDwkRuFFbKLhRS4C
	 qlKxHzw761uwHjlDzdm2G3/zkv7IzGMMfz+/3+CsxlFt+uTxV0jiRtRB+rlNQ5Y9pI
	 rkH176Un01iJBzuY36XL9F0s1imcnKpz0URlIUNPIQ/T6VR5/svMLDNhaKGYogHr4H
	 0fSzyTupi14BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E56A80DBF;
	Sun, 27 Sep 2026 08:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EC2F32F
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50B50404F2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrKow0NjyT3m for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 08:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 04194403F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790499479;
 b=XElY1Zy5ptTY6Qejx4qvkkt334qs+XMf1Yl29pPtJeVuIhembD5cnRitiNVZzhSo3GNo
 kNI9vFPQBG99K+fRHoDglAy7qbre1leBBaF/o+Y6timYYb14YXmmtE1BVGzSf/43FttFL
 on4mui03A78A3k8ixum2JkuxeMpxuAawpmvbVH5gnseJQ2dTPy5NdH8NQ9LibHj/aDOD0
 Wp7X8xGmcjBsw/9T3YfAkCQ0rLRNmqDTZsiy5UJ0DdxQbGb2d5qTRH/oXrggGSZTqRZ77
 PlOFtMVPPWHMFl8AwMYcaWBLBy2n3QOmu6leLDv+KyDHropSY112M3f3sTVbc0RJcTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790499479;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=mfMU3MoEsNRfc05Whtm24Gmq+/LQOexmqXI62+KYrA8=;
 b=dhqYU2HkElSOwf0xgWbclXXo+zq4ysrtgUbTD5g+WdUGYutCndqijvlhHPqucE5fC0lt
 uP/ojeU5QCCpVlliW+G3y0PzUrDV2ClP+Y6VvS8WpKMhdYAXxjD5D24HiH8uA0AKuIYNa
 vHagnYZMT3hEMRJGgj1o76da/DKmxJneD+YtT6mtBOlNiSKNJ/dB0vkUxo0GXUcxIh9jK
 s/AhJUGdZ6VOIzkbmTyNyYXVz/HbYJ9IhuU4+eIu5G+yZ/5BUJhbzybnhlV642IKNxXCt
 1whY/u4q6LNKmWCRyQ1KOVaoGVJFAnMWGtQdcpJUqSqMlOpWRhZDarfhDiSZQg9Eqtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aCqEtUx5; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04194403F0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:57:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1E27719F5A7;
 Sun, 27 Sep 2026 10:57:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Sep 2026 10:57:54 +0200
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 10:57:54 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, John Stile <johns@msli.com>
In-Reply-To: <20260926200053.2093649-1-ps.report@gmx.net>
References: <20260926200053.2093649-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <41849929178376a2cbb9b33fac497d0b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/dhcpcd: bump version to 10.5.2
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

On 26/09/2026 22:00, Peter Seiderer via buildroot wrote:
> - bump version to 10.5.2 (for details see [1], [2])
> 
> https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.5.2
> https://github.com/NetworkConfiguration/dhcpcd/releases
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
