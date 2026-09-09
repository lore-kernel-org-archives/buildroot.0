Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A948C88E40
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D22C60784;
	Wed,  9 Sep 2026 13:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZYgy817hdEA; Wed,  9 Sep 2026 13:23:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A3C3560626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788960222;
	b=XnCZcfB3S5TlrIiyO1qexmPJhg3C+N2jZsllk7ZNW187PmmM4cN8XRfLjLu1QbP3BwRP
	 3pQlVVaAp3qqnys2sae27CllJFAdk2D1hy53kdvU9FWVkHW0CdwATkgXhOs/mL38QP/3e
	 poluhyi06/la9eFaHfgoicMMWoHI6fvFFSviVyBy6bbmd0RkrxywtV39mbLlcPemQI48q
	 lJazbDdLX5X83+/Yd4IU6AkHpR1wlOrqswxvmJvwGq/vIwHwqz5IPP6ScNysvWEdhvpV3
	 mY5Tu9gLqEgLlHQbX793kokNNnVRZ/oNWKNPRb8qd9VBtwEFWcT7YffiH0MtX9BcqoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788960222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B3WiNkgZKqe5BwA+Pli35gcSnvNpwHF54XyMwwWEKEs=;
	b=tRyc1ODDLikvz8EqBzvDMN+sU7OGbejRj33Bs+V7VZEeyWx2DQb7cF/XQcv4pPPgban/
	 dMthNtDBcXV4nMoKxSLd+93JtOP9w7tbq4vnrzOK9YnPx/CD/+YYHVQqRGhJbsf2zy2hZ
	 p2z9Dx16621YwqkN/EKCgSNZkMF+9pbkFlcRjn4KiDfKojWUS5jvCWQN5OY7cNc+4lT0m
	 OVFrf5DVJ84Uq4g8495LhAroRtfIPOi374VH26DCOpil5JyH2YwgOHVXChTsrGUS9T4jy
	 N0Ge/Ves4an5iAQG+IZU0M2GeRMrGvUQLG9RzCGvLM82I1JCFL7DNHE/9857O7lnOXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788960222;
	bh=B3WiNkgZKqe5BwA+Pli35gcSnvNpwHF54XyMwwWEKEs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dzC4UbFJ4LNiJiX7tlKL/XmgwB2UWCj1/thWdCaHGP/eSzjj+qkaYIgGgse4Ldb/M
	 SKGv0ZJwKvDdhbNPrJZyLv2ivtC5Mgrgihkkk8xVvlhgLTZutNqZVxqHYY0KoC+B7d
	 YzU1m+Jnah8MsX6JktwfayJk9WMtJMNfxtm46ZmhlRooICSF9nAkcqFKzJeBJG/4wm
	 XIi61q6e3ZAwmZeCgiN3U0yMT8HttH29oGnIgFlsvgCv1UUWSsvN+dn/j2lvUMlqFg
	 dJFfA1qMhpjRcoRz7IrjXg7fpAQVXxVng2Eyzks/YRmsog1c9wakIBJesOoBxMJ0sQ
	 HfsIS9M3beqhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3C3560626;
	Wed,  9 Sep 2026 13:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97497755
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B3080C79
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ayr0v6TkFe1B for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:23:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 358AC80C6C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788960219;
 b=sQgQDgCgMSylt9rbXg3fw4dC+Ia6ulKbvo6xPpkOFqf9SqPEq5qu39yDjPwBN+j7M5yC
 LA7nBX0hUh5gsVR/AhKMgrL8YYkb7i4Vv0+Ld4+n6neU1B9TsGd0QGNBWu8bl3ArZyF7P
 NLR2KHK7OKpzBkkP7VcpOwW6HYH7NPECEQMsG1cCMPNlUvRykCKyc0XNUizE5MpuztNQp
 TUFzKR3cHibUmeMQm6t+xCWg/0qJnWyAO3RJyLfLahqVg7JGPJoW276bacfr1/uEXFGgU
 S2CX4i9ltNgQqL12pli9xil50bMmhK+WgVps9wRpkM5wpil8ktUwVV94ZGOp5U3TBPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788960219;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lgoCSHLn+ZLTuu4cNz0mRuc99cuqpn+RhgHs8guLoFA=;
 b=ZZa9IpHI0TPVXerQ3q+/q/dzbvJ8PxvEJ3HHTNbNnctrUmls6tkSryJzcycm9A56rHGM
 qZTHLC2YkrIgS/CXQ9L+v1EqNKtsXHwNYQRaFappPbwwIYUDKtx19I0Mi2FzQAXMx3ikc
 HAgUQzzjl4qoy11LkwouG2fnpjH3CnoDSYiRi8iaeKhyv3wCt/t6oug8SJpr4DDyjJVsp
 H+1cEHmYPDMiY+6TkyH4jHj/Eu6mVGA7HIuAWlneXFSQgkkqS4KxEfvngsveElgFM3F2d
 w6hWfvkVrldS+6imTjVA2Hm/yH0z92AUsfiIJKb4ad7LxONfmsan1ehu87mWDK2Sikg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yNoMyoyq; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358AC80C6C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:23:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D2CBC1A1A6D;
 Wed,  9 Sep 2026 13:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A7A8960448;
 Wed,  9 Sep 2026 13:23:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2FDA11C7AF5C; 
 Wed,  9 Sep 2026 15:23:33 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:23:33 +0200
To: Matthew Weber <matt@thewebers.ws>
Cc: buildroot@buildroot.org, yann.morin.1998@free.fr
Message-ID: <aqFb0_HNOuCYWCTM@windsurf>
References: <20260909123925.29971-1-matt@thewebers.ws>
 <20260909123925.29971-2-matt@thewebers.ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909123925.29971-2-matt@thewebers.ws>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/4] support/scripts/check-host-bins: report
 RPATH errors after library errors
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Sep 09, 2026 at 07:39:23AM -0500, Matthew Weber wrote:
> The missing-library check sets the overall error status before the RPATH
> check. Use a separate flag for the RPATH diagnostic header so both errors are
> reported when applicable.

The commit log is honestly hard to grasp.

> diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
> index cddf6a08b2..5233f6cd1d 100755
> --- a/support/scripts/check-host-bins
> +++ b/support/scripts/check-host-bins
> @@ -12,12 +12,13 @@ main() {
>      local pkg="${1}"
>      local hostdir="${2}"
>      local perpackagedir="${3}"
> -    local file ret
> +    local file ret rpath_hdr missing_libs

missing_libs is added as a variable, but not used anywhere in this
patch. Unrelated change?

Overall this change should really be a review comment to my patch
"support/scripts/check-host-bins: add new check on host binaries/libs"
as it's a bug/issue introduced by this not yet merged patch.

But isn't your patch going to offer a messed up output like this:

****
**** ERROR: package %s uses libs not in HOST_DIR:
**** ERROR: package %s installs executables without proper RPATH:
****   file1
****   file2

isn't that a bit odd?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
