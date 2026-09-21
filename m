Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449AEC982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 076D680DB4;
	Mon, 21 Sep 2026 18:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxkJKmPKVswp; Mon, 21 Sep 2026 18:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E662180DBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790016336;
	b=d1MbpJkVIWppcGSXgsjou5YI2caRJQWOnCOM2TogH+7ptcEL9xhtyHW/hyuvNljZVNAS
	 bHm8JPQPLyAwOBs05vqPHmQyZJo3eRW/8XuQE02cL20VH6iADc4P/PY/nDPQeT44YLBAO
	 7yoGCBYKASJabEqEiIDn9gaoopSYXQxLlnh7MRm4jiY6VVwqwHLc2K4030GEsLuV2vnqX
	 AudSLhLYVQFxsNNeanBHzE3is6HBRvHbRflkLw+4HyZswRIFmuok/cjNhxxbH8WwgusVZ
	 XdnFllelP88qhPi4OciIQydnMzn48kq7tyd7vfzC4hNuyv0phmzv55pHf6CtBvwJV1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790016336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wbge6IZYAeunz5Wf9PChCb2Najo1TjE/CPhdxwYpQXM=;
	b=bvwhU/gz4zqJl/HMH4E6pX/Lk+vFtEwosKofhHRkSbznMJaKOXM+pHGlBnJysetA6uM2
	 pAiiBmMGxeulXe9kFjoiI373/z56UeyA4wOGt7VWNDSE2Xd8ot1NAKgHcTTVEHnR4C8B0
	 ZA7fbosjShLrjAxT1qADRtQwwfAOt8AyD39rEHLjWqF5Iyov/gVbBvkcP7/MvL8hE9vYE
	 LY5/BNXhyChT3T+VCYUyuvGvSilnRnp8bB7SDKzv0whYw3zelgzO3L+LztBsvgWCz4r2V
	 QwgjNkIXvj+3nYb9avpNK/OjtO1xaXJogruIBwbsQlg1YeVd702WoyrwvL0SMDgBBsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790016336;
	bh=wbge6IZYAeunz5Wf9PChCb2Najo1TjE/CPhdxwYpQXM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XSV971SuQgJU0L9Y/mAew8EtlfsNMXpOsGwSgy4KNNdRu4oQgBOrmwdY2nLals4v2
	 tNCuRYOswuNuQOHaHFFogQRTmNwTtmHU5ZRbzlbaz0iRs3+oUip3gKKm9plsZ3Ql2s
	 l0HnXIMh4j8R/Y1ysKDS7A9SgppDicFUAl2lM/VsvaYofgfZh7qWxghMJoPyEk0InN
	 T1Pn3Uge0dzRrdESXy59lljmojxnJs/RiVWNFF2IiPGt4C67fpCPAT7BF4bfuJZ5kT
	 ZLk5Wrn5X0LOpPPjydgGDT3i4vPDK7KoOiQAraY6szopy+EImBWPPwyZxe7rKV/y7+
	 uqtTuRsoZ0MjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E662180DBA;
	Mon, 21 Sep 2026 18:45:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 846BB224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F687400D2
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5rO-XfSTPP6 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:45:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4FDC74005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790016334;
 b=MLDBSHPXJthpwP6oejknG3/zmZd627PoTzgBKhbZ3vg/O1hlqETg1OhTJcyVeakYRCsY
 3Cg13c13zT9K3cJ7XL+1g93krcae41MCJr+79pluVTTXg4UZoNl480QR16EwCCTqgN+rh
 Wk4/iI1IgCxInE68yOgVpQkpIfOewLbSnT++cnZvO6Y7o+Nx/zMZ0rOa2dGuOIBMjGWTf
 QPcjTXYe4Xj+97fkYt33CfBcNRdKs3v3WBpr6P10UtZYPsfou6lN5+3DaNy4Cy+antY0U
 u+RKljsnrDYBcUXZKQArhs3BaT6M2HGAFjgOmoBKhOcrXr2Jr8GX8AsgKAC2rwoX2Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790016334;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=e9KH2UW7uoSHertzZ9XW0Q1VQJXv9sHHDm9lNJ0FdhU=;
 b=P0T5bFUc+wJ5yoJOzkr0zDRnlRCNqbIwmhRixj/WspRQ0XhZ99vfmIRZ4nx3dAeTow9Y
 aviyl5EQACBoZ8occEogyTQY3ACcUfGh+0Xiul7E/8mzlZByWFFkHw6tqReKdxVk8LWcD
 9tJOPFClmEZnKryLMTUs6jztB0de3eKFWQLJ/P0sdoqDlBd+jKk/z19ImNApZjSkI4IXH
 /FPERDbwEAsGNou9k8Y6jYlikuKTPjmX7bTSmB/i/hnvS58Xf7ZXMPHwH3v+CFRNSruv9
 UKKyema78Bd6DuRy4pfPzgn7SFFbnYATUJBxhLwkmpwZjBSqcZcRlUzHNocGesTYUvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LY6HKDrf; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FDC74005C
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5B8AC19F5AF;
 Mon, 21 Sep 2026 20:45:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Sep 2026 20:45:30 +0200
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 20:45:30 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <79fcf083efc142ce08b4a877e8d8bf60ee568ca8.1789971481.git.yann.morin@orange.com>
References: <cover.1789971481.git.yann.morin@orange.com>
 <79fcf083efc142ce08b4a877e8d8bf60ee568ca8.1789971481.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e8da1a4f6de325a5a5334170dd526d20@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/distribution-registry: security
 bump
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

On 21/09/2026 08:18, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> This feature-release also congtains security fixes:
> * CVE-2026-35172
> * CVE-2026-33540
> * CVE-2026-41888
> 
> Drop our backported patch, included since 3.1.0
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
