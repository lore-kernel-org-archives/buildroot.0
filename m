Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C032C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 22:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6405605C4;
	Thu, 16 Jan 2025 22:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msZpaQ7bXAKy; Thu, 16 Jan 2025 22:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A7860664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A7860664;
	Thu, 16 Jan 2025 22:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D1031
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A66460652
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kvdq1fIwlVQu for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 22:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B486760664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B486760664
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B486760664
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:38:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4E2C12003C1;
 Thu, 16 Jan 2025 23:38:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43502])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Jan 2025 23:38:05 +0100
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 23:38:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250116161115.1798900-1-james.hilliard1@gmail.com>
References: <20250116161115.1798900-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9a726763033ea28fe7d936548407a9f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737067087;
 bh=WlMe2i6nVp3zdNYUQu21WZnVGm99aKn3rAfbvQgYjBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hL3BvRTjn20qPo6Ka108GDqQ9G2O0GB/cu5T/69kmhtWdmFs/+EdwLkFD7+O5E29s
 Q6Zd72Arv0VVO0mt7+QGalPgxWLVcr2mZOnle6ze2K0uV7/s/HvDh9dhF0wKiYHr+l
 M9LYhdm78sBbKNIdr0j82A8Oyo6xpFv/7Cr6mPumLgvNYlpTy6o9yXMKGrQSf5KEm8
 YWidSA+qSmPJDjy44uzXUYjSNvDKxTWoGzZN6ZbMpKfeBea3emZmfhFwzItuzyggSo
 E6h+pJXe+6kHFvizrO/MXWFgH1zXfOhz96qUglFoSRFRiXMzVpZHJsLtiqKWVoCtaB
 tze2QJaRa/44w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hL3BvRTj
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: fix segfault with
 python-lxml
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/01/2025 17:11, James Hilliard wrote:
> Backport a patch fixing a segfault first introduced by
> ca63c4409b3c811e8c4ee19c2860c53af35c4ce1 in buildroot.
> 
> Fixes:
> ==4792== Invalid read of size 8
> ==4792==    at 0x4FE7661: __gconv_close (gconv_close.c:33)
> ==4792==    by 0x4FE70EE: iconv_close (iconv_close.c:34)
> ==4792==    by 0x5AED422: xmlCharEncCloseFunc (encoding.c:2678)
> ==4792==    by 0x587A78C: __pyx_f_4lxml_5etree__find_PyUCS4EncodingName 
> (etree.c:126676)
> ==4792==    by 0x5888666: __pyx_pymod_exec_etree (etree.c:289773)
> ==4792==    by 0x4A06345: PyModule_ExecDef (moduleobject.c:440)
> ==4792==    by 0x4AE23A8: _imp_exec_dynamic_impl (import.c:3801)
> ==4792==    by 0x4AE23A8: _imp_exec_dynamic (import.c.h:534)
> ==4792==    by 0x4A046A3: cfunction_vectorcall_O (methodobject.c:509)
> ==4792==    by 0x4AAA203: _PyEval_EvalFrameDefault (bytecodes.c:3263)
> ==4792==    by 0x49B9D2B: _PyObject_VectorcallTstate (pycore_call.h:92)
> ==4792==    by 0x49B9D2B: object_vacall (call.c:850)
> ==4792==    by 0x49B9F44: PyObject_CallMethodObjArgs (call.c:911)
> ==4792==    by 0x4AE648A: import_find_and_load (import.c:2781)
> ==4792==    by 0x4AE648A: PyImport_ImportModuleLevelObject 
> (import.c:2864)
> ==4792==  Address 0x8 is not stack'd, malloc'd or (recently) free'd
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
