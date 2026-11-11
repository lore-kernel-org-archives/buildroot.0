Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49317606A331
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BF6+aYX3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=GLCcy2yU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2352740B23;
	Wed, 11 Nov 2026 11:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2o2F-FRboMo; Wed, 11 Nov 2026 11:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A8E940B21
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794395345;
	b=Iu+ekaysC+LCQ1kYuOOecFG6/7rdLZdMM66ozkEU7tq03o4CKB/FFPsELloxTDuRchIE
	 YXXrTJWzYSYcGFEWFQjrg2+3tuUHXRjK07u+McSTh+fki9pFN4QeIVYrtDdYAU1dgqiQb
	 xdzU6HIdyrJFDBRzo2UCpGiEkuhZt/D55By//EvKGpsg+aVJFBtDzciakIx2czlDagI5x
	 qQsgZQNYw4JW6C0dHETgsR2iieiARh2ggUOhgMO5InKUYkXSZbR4pinzt8rJpY9Zmxn+p
	 34PE/CtN9rfxVeJnm9j2KCtdKxYIqKsLSYydVeF5fwdolENzyO+qal5a98dbok9qt9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0uYtokfQJIKpFYF/bPkzvEJlCVKuUD6sa1Kc2i6BbdA=;
	b=ObnCQ3nEl1HBJJSp67kdA79W2brgZGQ33QOUgDYbRE31sIx6KAnjbfQag9+usdvBT1M1
	 Hw89YcHtxJznbUrbBROu+YdmiDUTvIhQUp1ue/vhVOduZ1hJnmPwYS8I9KyIF9bnTjsn0
	 r7X8YYK0ClY+sfdSPFm5CNQEE/gariUYHZsgD+1vZIn3O4ipSj2ikdfOdOmtxjXOYQsj9
	 87B49j36fQK4PG+X/5KVAdqFlbdaOoUPK7lNcamkswRGNGq8aQWpuGGS6FR3Byg3gHm1v
	 XuJrOlFe/2uMkR8M6Md2FQf9+qfifNoUnQ+aN09c2cINBy4h83F0+hD95xA3nZjk+PA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794395345;
	bh=0uYtokfQJIKpFYF/bPkzvEJlCVKuUD6sa1Kc2i6BbdA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BF6+aYX30AHAyFwl3i/bQYobqj3QKfgaW0kwvpl+daeei/SDvP927cGsNEApOcTS8
	 r192VXWPN6tz/vxwf+wuHc6AcbQnjoWz6Yc+pG5G/+jAua8ydHoDgR5QVwOX4A75gm
	 m+fCh/5Xwkqy5gyQcyZWLMCygwZG7UHuYuVFKEcVs6pB4q6oqch+0etTK/+Yphqs8s
	 7oZDIc9FwD8bj6fheY2FCN1eOM8gWi/Bp4GYfNdXi3wXkjY+6A2vyHWOp4yy1pD3yp
	 TkkYRbS+zSUVpvWsTDzGQz1nEH0y4yoWrZiEDFHKwVcxoVlVdkDbhJcGTjMQxzy0yc
	 HfTU4nqMNKBiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A8E940B21;
	Wed, 11 Nov 2026 11:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F5917CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA091811FA
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vawlFIctw1e for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80225812C4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=GLCcy2yU
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80225812C4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:09:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GLCcy2yUM3GAKpdOJ6ERKl0wTTueXX8pN/nY4nGMMdYoXTqoTrjU7F7g64lqVPlg8V/M9r/hRGcHg6F41+Qoz/ccneNylgwpHL+shGFArVmEPb9GKDgn36N8QQs7ZOGmr6jVIZDOzCAfqTNaaVdw6duo7gmz1u9TdmQ6YBSnUsWC9fUTPq+3t+70tyMmDIJBVLA87LxhpngFAsA/oIjIOqfxNw5qZWu7PV7S57IdwrMA6Tl44spoqHrPNEBNaeJB6s+eo8tY1EKrYCUX7GVYowQ0zrYbzMPQvy4IxsBl/QmCMLYgS9zdOj1ACqehHrUSUCjXm1A8y47fTyec/bEAMg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=bMGlAK5wt9PcdVP8DJ0C40O34G6WX36YNRxl52u3XrU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 988171926; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:08:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6CG-00000002QKG-0mwh;
 Wed, 11 Nov 2026 12:08:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261111080006.3832953-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Wed, 11 Nov 2026 09:00:06 +0100")
References: <20261111080006.3832953-1-yegorslists@googlemail.com>
Date: Wed, 11 Nov 2026 12:08:56 +0100
Message-ID: <874idnmxpz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libecoli: fix uninitialized width
 build failure with -Ofast
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > libecoli builds with -Werror. With GCC 15 and BR2_OPTIMIZE_FAST, the
 > build fails with:

 >   ../src/editline.c: In function 'ec_editline_complete':
 >   ../src/editline.c:304:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
 >   ../src/editline.c: In function 'ec_editline_interact':
 >   ../src/editline.c:657:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]

 > This is a real bug: ec_editline_term_size() only writes its width
 > output when both el_get(EL_GETTC) calls succeed, and these two callers
 > neither check its return value nor initialize width beforehand.

 > Add a patch, submitted upstream, that defaults width to 80 columns, as
 > the other ec_editline_term_size() callers already do.

 > This issue has been present since commit 5638ee04c8dd ("package/libecoli:
 > bump version to 0.11.3"), as upstream commit bc90312a4285 ("editline:
 > split in 2 files"), first released in v0.11.0, dropped the width
 > initialization. It therefore affects 2026.08 and later. The 2026.02.x
 > LTS branch still has libecoli 0.10.1 and is not affected.

 > Fixes:
 > https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69

 > Fixes: 5638ee04c8dddb9ebfb7b047efb574f657e1b052 ("package/libecoli: bump version to 0.11.3")
 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
