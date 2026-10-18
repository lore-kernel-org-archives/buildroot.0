Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39950CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038CA60652;
	Sun, 18 Oct 2026 14:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwm0JK7iswub; Sun, 18 Oct 2026 14:29:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A9246061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333745;
	b=bHTcyTu3ItDqdaCzIfi0ZOEJVr8VWco90AtglHWjyS2XnDiYt4JxGIUHYrO+5NSl5QQd
	 pAYN/PstCT5x7YUUS9znpuZqJ5TMsLn+m42BOQeRzM0Bm8FQmPyX9FeACDQb1SVB9p3h3
	 TwFakk8mEE5FFGjWbgFAU7+ycDuPCSE2XeAuhLLuAh5e596wBqvycAiwBks45sUQzWcUd
	 ffJWzLmbi5gxBsqK9PvccDOOWVZhXOUR0O16fIt5uaSXd4MPoqpXWLFxRHTPXDLb1WlD7
	 FvAZ1mrm0pmJtqDTY3z69dNlPQkMUcNLa3lnqeKpZQmSyQAXCb2JPctuAln9naClBqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AnPqUFUe2bg7I5JoWFBiNzHdzOCBomJlHM6TItRIZvk=;
	b=I7bdPz5tpXeJXh2yqsXuP2OKYpNi9nIDrtcScRyRf3YyytQhoFPodDNxwjKdDCYqoprv
	 7ljBwv8XZul6FXlSb/nvds2Ku9ohmnUCMH30N8HMixK8fU52i17roG/SmQaPC8nIHSo2w
	 B2LuIKfjDeNoaJRyyz7SxhKL8oq/1drmtFKZdj2b7a/IjlxpnY1Vf+PvoeN1dqcOZSLad
	 cCHyN2z6XtXv02PARnEHcPVNLIqLafuUqgTFEKHJlpel+Itg+3Pb8a3Qu7PUItyxg230A
	 nWFnWYKmCeXPzsqOEttEa1SZ4UzXjugZdXFMa47KQ96/5jpCSR4rrwxoSACcaOTdQ9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333745;
	bh=AnPqUFUe2bg7I5JoWFBiNzHdzOCBomJlHM6TItRIZvk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l5BSNSvKoaIhdD5UnAoeCQU63BTEtXa4QO9H2yJDncAy5kuoWhPJFPBeRA3PfiU1C
	 oAZbotC6q60ocS+mB3aLzc9CqP3udbbMPbpffFM8B40BGKv4+9633OfnNWlLmNQFXJ
	 BQBoHLuQdlOvFRtStbRvC5FjyDAY4U+GzB05vr7pBLHe91FQ43pSn9HQoAUquWdMmD
	 99jazdjBoYLolLNWHDRt3LlQSKNrdIJq7qEvHWmm/K30ABxbF4uhaG5TlraPeS1EDT
	 lEomV+wRq5ZNDzY/kzykobgftfd7tJ8pZ+aTzfKHX7XD2sgZEjl8L/WQxN6GtXSXvW
	 ZA9ZLDbMG4wIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9246061D;
	Sun, 18 Oct 2026 14:29:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 360A761
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C4AB406D9
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-sCZo6J0QaV for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:29:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 43017406CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333743;
 b=mrMc7xfpprW2msfjilhP+oTVyT0JHD323xjsTxgCyGBNaKp/Hnp5h9q9x4529tyTiZ0h
 ndA7SLqJDuEfDdF7A9nql5E4mK06IAqlhetlAIUkkbVpV2QtW3NJZbOaFOB/G2N9iip3C
 jE9mwanWXTClVBUmzYOtHc2aphdIxcL/xIgSw/qhsmATjmoIJcH4ka068rPkSB480PbDT
 htfb2Naz48J7nopMaoCEfSewriJACdUI5DlS3KMp8KAEbO067H2bgpwLEg3CoLj8nroRo
 of1++PvhzXAk8AWAGm/gphgIlnGqvftdhT6DLTUY/P40v3p6WY7HgbRSj1uS0965kBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333743;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=mfYrVNHw9A73Vtv2VRM4sX//x8SApta9xmPj9HdFeeE=;
 b=sz7k2uveqvN3dK75nQoAt7P9J+ZF4isojgPU0VjrFHHMGAbkVTVVcIERvHwL/tnRJKTw
 jKHDUBBfBkiSEHUpF5+wiTSgIx/Xl1WJ2zSElZv+AU4GBHOnRkHxu1mbZf1P/W8XSmdr9
 LICo1qe069AMXV6vntEkM5hWx7iOEbuVN6ZSUOqZwIdrez6HmC/sLT772MWgrCbEQTagq
 Za7J9G/H29L4n3qwpYZBfA7XCq79sRMpqQ3Ru0sJtNyvLydoQXMg/9PCZ5Cv8Z98AoMvm
 /+w6WZogT0a+CRrnczgHL9q8I4Bk7xulKqFpBr2QIYRZ9Tu6B1FgPQ2/4X/U2vBGqzg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VILAGrFX; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43017406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BAC37B0056A;
 Sun, 18 Oct 2026 16:28:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:28:58 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:28:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261015215210.3426895-11-james.hilliard1@gmail.com>
References: <20261015215210.3426895-11-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <dc742240382185ef27e496d344df7e6a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.0
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

On 15/10/2026 23:51, James Hilliard wrote:
> Select python-typing-extensions, which is now an explicit runtime
> dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
