Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C44C88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834A8809CE;
	Sat, 12 Sep 2026 14:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSJObhLckYc1; Sat, 12 Sep 2026 14:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 88338808D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225074;
	b=HRNWfn4hl7zrDIghBl0AkvBbSzJnucKxHyECxSos14eGqlVTRMxyAhYQEHpJVYi/0L/0
	 Cb/wZ/V1cgQiSwYGYNnZL4qfzaHITemmKiuGG5LvzcZm7bbWC4b4ImesMMJv4NCBgd5hM
	 pKPuUf01IsIO00sVEm9nnpQRhbHu3/0mBlYtr2hUrNUagbkqFZklwoKWrntl6V9Dgv/iz
	 OAyKTnOiQCeDzA2jwVmEtvGkyJ5af8geLkKEa3LmloLYHILMNnGw5p1XOM7VwOQrYFy5g
	 XnzJBC0obaaK5MF0YV+qIrJl834pF8jzNFB5ybiXLHuxhKE3mQ5KlRU+UnzWDGWZX9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kjIf8CUChElT6Yfq7n5E+PNn9Km1QY5xU+szreHrjek=;
	b=mmoWgnrV1MnzkDUzD8vG/nFDLjyfxSwNznP7x/fzCTKiW1ApurNPMX5PetDme2HhGBUb
	 JsQhgp2PhBZHffDLtQaNfX71BA9ZjNMSd/2OI4bx5GleH1Js0VAdEYIl8T7ZNSTIaCzdb
	 INg2w3G+aOlpfuRMG2JzlzIkDEf/Ud7vFuTCW/FwdEFut8Yf8O2vZz/LQ/4cNSgwHdVJs
	 fCKnFAjTpwKeOa6bncQVY5Rs0XizEt8888aD2pmZK6g5Y1jp7fbO49apPhr2ybLRXRqDJ
	 joi31UeCeclQLiO0j0xc4QfldpYjr5+ld/tn9U02l2M0nx/ayM7epHe04Vev70WS3Bw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225074;
	bh=kjIf8CUChElT6Yfq7n5E+PNn9Km1QY5xU+szreHrjek=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MY3UY0ub9dlu86bbvphD9dRY3mtS5qMM///K+DN7cAuHMWmB15BEM+kbLSGuI7E90
	 8NCvhVOXG+hpdTVifA9C0XFU59/mvBpHr2wf7agvgi10HOKZXsXlfQoTdk8qVpPOPx
	 qcZex86prDQla5eNEYkvrRTXj9IqRI3S+N+eV2SxMegpon+VvfRNUzrNDYhG/Pw6J6
	 Lo0QELKUlt1Xu3rbWMkUB/HF4XZ8lDfTU/fwa1xH2GxnHb1lcL5wP8hny9S8yw+Y1q
	 +R6Ix2qNEUOYAKqOQyjGddOersVst87f380GxQqCeHeZQaEtiiptZ7897yGz1+1bDC
	 UTZmuUEYZ3vkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88338808D1;
	Sat, 12 Sep 2026 14:57:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2765D32F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D0BB60608
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo6MeJIoN5o4 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:57:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 08590605EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225072;
 b=omPdt3F6Xdc2FTq0FjwQ5Eum+83a4iYHmZUURhG3AgGnigey2ZlEF3cAa/sER6B1Trtz
 64mc8qaFpaVluaHxw3MjZUMpcN1JWa4xzcA8Ost6r7mBvx7UbzEDmuogtLbVA5RmM18Fr
 S/z6fTheRyDEZKnnT7f0tJr9O3ht7Mebf//3z9mtdtiJIH8leoWU8/hXMf/AAj+M86pOL
 Q+8TqUUe62eKcmr7uMrDDZRl1jXU7TBU+vlybSkV06LjZUbUb53vUbHD5J+5uPESKJiRr
 CndCS17k74x1F7VCPTSrdEv5750NBmA6wR8on7oKHrwI6FnYaNTvNU7COBjL9GkfTiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225072;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=VYjKkcBnThO78byEqmVJnWOCnaDGFJLlxBpclWQzpUU=;
 b=QQYRqScH/+QYLV+b6aHGo9ZZXHt8NyahfQPHHYwQFTEl+Gx61nNKp2og1gNoBKuUIMy+
 57oSiMrHtwAwO6DuTx4kwaamOwojyYvRd+1+fTMoqyy/7/qJ9a1DeIu6+OHn+dh1ZN88C
 5v3XOfnsN0s1Z2w40+tHZY9Bbw/QjkqlvzCT8hdxyysP/1OJ52FiNMchUc1chddnK1s9c
 rVbMUojjQ92+G+Z4+oJNJjuSvU9+bYl6IrU7BfbfaX5bzwUC3rGEmfyKTSTUjWLpNVahw
 lDnCScf358ZfA0TF+0PPTsM/Wsm+898hOpb6j1DMYkzUvvdocajAGqUHFCUIusjOtog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iTp8CAtq; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08590605EA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7B45CB0053D;
 Sat, 12 Sep 2026 16:57:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 16:57:48 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 16:57:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260911211316.775727-1-bernd@kuhls.net>
References: <20260911211316.775727-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <0c6ade08e84607195ea9d0e6def9075b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tools: security bump
 version to 5.8
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

On 11/09/2026 23:13, Bernd Kuhls wrote:
> https://github.com/tpm2-software/tpm2-tools/blob/5.8/docs/CHANGELOG.md
> 
> Fixes: GHSA-v7w4-4gc9-qcgv, GHSA-gwfg-w3jr-xh66 & GHSA-qp88-8f4j-wv7q.
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
