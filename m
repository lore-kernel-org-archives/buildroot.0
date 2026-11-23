Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2378606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zu3Z1jeK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D87C940588;
	Mon, 23 Nov 2026 03:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Da_jPRm-iH2U; Mon, 23 Nov 2026 03:44:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8112403B5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795405485;
	b=HlpkoQxUTYGVs/8HWhFRQtgiUT2uVTT5YAAYEh8FzyeqBoMjI2Hv2vIUfj0wWjIq28qh
	 iFf+0OqklMtgR14DkjbL1EZtOKXMrghoDJIdI04HBlbtdTtoaA5M+CJgkz26/MY7C3GKe
	 kRKd9qilKkKqSgp86SI4qTN6QkYYWFnsX+bZ3yArDHc4VeWzTB1QSMaGajektmInXmGDt
	 98HS7+RhU9VPqHTfLYG/sCoflboNiVeKZ70ZQKNUlhxY9OCQjXVShlQXUQYOeyzSq+VE4
	 U7tXEXXdd2yhEAShKVdkPgpx+IjpSI3QIrwHf8sOJcgxnKdbcM1pFGarOwWPNzskZ+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795405485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XdT8XqsRMHTrBwhawdKXNvQ3JrytS6RVhggQLGgdkBM=;
	b=J7xT7e0ZB3c2cBJzgII1O4GrireWEzyX8VbpyIXKdDAajZiEusbwhTKfAdaKM3udiOB0
	 WtZJpJYJxbOM2JSaTjsFvnCHoNmeVEFh6o05SMpgfXOQAFjCq3JwV0qWgQrzffQbRtQbE
	 aHguH9Td2+ibDemTz1/y6oudhAwFTb39AAhYK4DD+AjRi3bdOQDItX9VPUFfo61SoUQ34
	 EiwnlH7u1yY5ZOurLASeQfNNiF3W7Bm5gSxWzZkYyRFQavSaH6chZi4ZjvIQLJkKOE8I4
	 SOIoWaGreY0mepB5Va80qrekiGtePCe3kBmKNrkinZo0BCjz15PuowPNFC/2R2YZcFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795405485;
	bh=XdT8XqsRMHTrBwhawdKXNvQ3JrytS6RVhggQLGgdkBM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Zu3Z1jeKkC7YTz9hSdCcBPAzvgo3TLv6gYWLhXERbmzxYBZ2ndKPA9OKXEn9XH0aT
	 Shec8RuT7DTWdzuGuvmQATK9J2vagwYifN278qcghqgZoe+vS0zpyK2g8HOslWKe6a
	 fU2oImBNDmo73wQm3S4DlfAKbV8GVH+ScxMkUWD7ukxKHpJar8b05v3ktFGuCLaSBU
	 Dh2VeLLKx4avQ/SEi6HycQfnvs3kjxUBjoEf6s3FPzjOzCIzENyVTnXpgAGEV//D37
	 w+lBQJ4T6kxhJ34c1NDgeZN/yJD6G8HdSHJ2h5Zp4cJJOWRttnjarZ+25qtraCwEFj
	 QZRY73KjqWOGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8112403B5;
	Mon, 23 Nov 2026 03:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A45B7DA6
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 03:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A22C780AC2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 03:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM6_BMCgQiBD for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 03:44:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77971808A9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77971808A9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 03:44:40 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 02D9D2C84FFE;
 Mon, 23 Nov 2026 04:44:37 +0100 (CET)
Message-ID: <5f7402ab-77cc-4290-b647-2ea7f48e1331@bubu1.eu>
Date: Mon, 23 Nov 2026 04:44:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261122183809.3916943-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20261122183809.3916943-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.8.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,
thanks for the bump, but I think the patch that's introduced here is not 
correct. I think the fix needs to be in gnutls as gnulib's change seems 
intentional (and the partial revert touches a different place that 
didn't cause our problem here).

On 11/22/26 19:38, Bernd Kuhls wrote:
> https://gitlab.com/gnutls/gnutls/-/blob/3.8.14/NEWS
> https://seclists.org/oss-sec/2026/q4/784
> 
> Fixes CVE-2026-127039, CVE-2026-127040 & CVE-2026-127231.
> 
> Added patch 0001 to fix a build error found by the Gitlab pipelines that
> would be introduced by this bump:
> 
> Gnutls adds gnulib as a subproject to its tree from
> https://gitlab.com/libidn/gnulib-mirror.
> Gnutls bumped the gnulib version by commit
> https://gitlab.com/gnutls/gnutls/-/commit/2635e27c1845f656f0a502854065f8b23ec2957f
> first released in gnutls 3.8.14.
> 
> This gnulib repo bump contains upstream commit
> https://gitlab.com/libidn/gnulib-mirror/-/commit/250881c4f839e18737a1d6d807337a76015cc722
> 
> that causes a build error with defconfig br-arm-full-nothread.
> 
> Upstream gnulib fixed the problem by commit
> https://github.com/coreutils/gnulib/commit/88bde746d90ef80625773b5959ad450b32ad0772

This fixes a different problem internal to gnulib, not our problem.

> sent to the mailing list in April 2026:
> https://lists.gnu.org/archive/html/bug-gnulib/2026-04/msg00180.html
> 
> This fix is not included in the libidn/gnulib-mirror used by Gnutls,

It is, it just doesn't fix our problem.

> even more that mirror is structured differently. While gnulib upstream
> added the fix to lib/glthread/cond.h this file does not exist in the
> libidn/gnulib-mirror repo.

It does though. It doesn't exist in gnutls's vendored copy of gnulib in 
the release tarball because gnutls doesn't use that file, yes.

> 
> Instead we need to patch gl/glthread/lock.h and need to re-add the
> include of errno.h reverting the lock.h change of commit
> https://gitlab.com/libidn/gnulib-mirror/-/commit/250881c4f839e18737a1d6d807337a76015cc722

I think the fix needs to be gnutls including "glthread/once.h" directly 
in the relevant place as it uses gl_once_t.

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

I've marked this as changes requested in patchwork. Do you think you can 
instead submit the necessary fix to gnutls and submit a new bump here 
with a backport of that? (If not, I can take a look at that tomorrow or so).

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
