Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD1606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AXAYUk4P
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FB86072A;
	Mon, 19 Oct 2026 20:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHcBFYzprc60; Mon, 19 Oct 2026 20:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 66B10606CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792440479;
	b=S63nBUYgQMIFpLdoxDNiSQL2dyRFjlL0fVNhAG1R0eLwahw4D+K0ulg2+Ba8lsqhdAkX
	 1GJ7WRQQr+fawtdhmsqRm3VvJJxQqQBpXkOfdwLZ1bEf/wnfVSH5rErSL0+OSlnNthYUp
	 NgF7uf6q+Kqx5aaz+wdpTTJiKGaAyKUALZtymR0VExTfESR1NTPxOxPwmeX4CmTFRZooY
	 VvtYfZiECzPbrld40eOEcwDQNztui5jxMf78L3Ggt0dSP7j0yMZlvz2Xmo3D6KwedHMII
	 J3VFxBxrVsyzEr4Y5Hl+PaG7NoL5jvTpbhX6RqvAx6zoVoo8K+GOOav8UlhSljH0+7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792440479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=KzBwD9FZpSkBi9NFe+o5YsaMy7ipH1FvPVwtcD561LI=;
	b=VkBGNv5gOuQABgJgG00NCidpUpw4+XLXTwi/qJI5VYgo4cVWwmbxCRYZCU7+KMyBX9dJ
	 Vf1MdwWqqipZRSDAoEcn/4G0hjexQccVNV1lJTRy+02RTdF4gO4TP6onH6pqGhNrm58Fb
	 xKNXjuCzPXBzGe+2tp8Gaas/S3r6iWOazPLltW0Y+DnyhirrR8N4A3sb1EtOp3xzVbk/L
	 Dr0qkNdKwrxDYduyBFKv2aiPJD2kOgNNZ4+e2hDl7JrkzEllGQbIcHUgg1rPBo0TJd4vM
	 uwERVnvcxyA4wIZosyiP8H2rhuoZobRC6Qrpt6L1OV5WSxSFElwOUqF9jnb9t1yt1SA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792440479;
	bh=KzBwD9FZpSkBi9NFe+o5YsaMy7ipH1FvPVwtcD561LI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AXAYUk4PNhaEbk/ZqQ8ypNLOCo3zghJ7jI1YkApMOufRlaEwAChlTOGg/4AtU7R2Q
	 d+PdYFJdIgtg2RFXUR63BJPEdvM3697Su1WkFzdNE6sUDE1vuK4BKBsSzGbMuJtoY4
	 PK9s6BP3+vwYhHRKgbBsr2OFN8h7qToHwgzr5o4XXyB+XkwKCLi581vwhNlLtq4fCR
	 7P+G+HEZHyyEpjjHCQ+cTMCfvtA7uCubEIMS6UHri6ITuUG8VGOC+yIK1Kj6zKR8uc
	 3Mq8ztFpEweiY9xqf+QDCSLj8fOAOVAopTK9953TukWyRgmmGPRsXOmq3zcU06VLIc
	 8XS/AST6JqjEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B10606CC;
	Mon, 19 Oct 2026 20:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D4F279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6953A406BC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53fYR37myeya for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 20:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E444E405B2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792440477;
 b=R8hIic+Y4XZz6EFvdlW6pgLcxTmBpE9oJTCUkXVf+z7B+rMyIfz1wzcOwoCWfW+S1Vkp
 q9oR4VXyOqYe4jlrCZhb0ij1NUx0ofosYCPVpZJko0GX/nIhF+rZ5+xzUivQyysQ8+0qu
 o5+ki7G/YfHOrwDUdoBlW8Fh7tum9ts7WHoPbkXjh+ao+zfq5FgG0vM1Ldk4dpdGtysRw
 3QPel8iraHOrcvYAu5AmohZbT/qqPP2WL/V76MptHBwNSrus2QNoPqJoGTNPr3jvpfSXx
 vxVtfS53+U7YMcYJJFpnm4IDbiwrxmm+dt+3PlJEzGF7n9FVTBACJ0X83MyGBSXwu8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792440477;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=oI1O2SnmhnN/2g0nj+VyuCNtK4cagtPX1PFqJRL3A10=;
 b=bIzHN4f/Tm/J+/hyaGntRJAaNTGLRzaBpcYTfQ2ZWkvq+3ZOSR/P+1Y3X+hJdcCTDv/h
 EVxRiWhAaFJCBqOlJOFrXIxGTaCwCC1Pd2HR6HY0rrTVFfnK3IrW7jG7imJHmVHRb0niV
 rAx0BLRNN9f17CJF2uy6L2k71E7fa+P07T7WVcTc74ER9HoYQg6vTeiWx2fFSa2wHBqVC
 uCkESxYHU6K5/FxBVRxMbh2ditzr4CH80L2N0zAOBgFif+7zebJkU+hegdhm5nG+pogpd
 i+SQcKfPAoiAVMhfNUEuOg2vWHKbFbRNRqNZPVur5ktY1I/YJAytzQEDqfW/qSKiiMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="GzY/IIDp"; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E444E405B2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1xDeyn0KNp-00EkJJ; Mon, 19
 Oct 2026 22:07:48 +0200
Message-ID: <26ea1931-5244-4e1a-a578-4b32305a8ccf@gmx.de>
Date: Mon, 19 Oct 2026 22:07:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20261018232916.3896517-1-fiona.klute@gmx.de>
 <atZRLNEv27mHGuZP@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <atZRLNEv27mHGuZP@windsurf>
X-Provags-ID: V03:K1:G8RAYppIcBITekXPAbZm8E1d6IfZL3nDLHsLotbTGiS++4mHVW8
 1fm9MBwDCeZlNP9gHy13pCSNNsjAWps7gQX5pGIXJ8BckNiEm0BicShcy+BRzlQf4o6KewD
 ACdsCMbldFZXi7yMauXNKwJOjBnc8+SAKafAGk9pB8paDeTug7TKEljVO+YFNrc743pG10v
 khsFC1qKFnDPsm9kwz5lg==
UI-OutboundReport: notjunk:1;M01:P0:zkpU27wyd4U=;YHQmZnj0L0BsyzsggcmIosqe+pb
 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
 IsJAwdrunOI=
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build without
 FIT support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 19.10.26 um 19:25 schrieb Thomas Petazzoni:
> On Mon, Oct 19, 2026 at 01:29:15AM +0200, Fiona Klute via buildroot wrote:
>> Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
>> fix target FIT signature support") changed how options for FIT support
>> are written to include/generated/autoconf.h, removing the
>> unconditional "echo" call (possibly with empty arguments) that existed
>> before. Because of this, include/generated/autoconf.h was not created
>> when U-Boot was built without FIT support, making the build fail
>> because of the missing header. Add a "touch" to ensure the file is
>> always created.
>>
>> Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> 
> Applied to master, thanks!
> 
> Just reviewing the previous change:
> 
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
> +       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
> 
> Seems a bit heavy. What about:
> 
>        $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT), \
>        	   (echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' ; \
> 	    echo '#define CONFIG_TOOLS_RSASSA_PSS 1'     ; \
> 	    echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1'  ; \
> 	    echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000') >> \
> 	    $(@D)/include/generated/autoconf.h \
>        )
> 
> Something along those lines?
Seems reasonable to me, and maybe make it a snippet shared between host 
and target, like UBOOT_TOOLS_ENABLE_HASH_ALGOS.

There's also the option to use kconfig, but that's a big can of worms.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
