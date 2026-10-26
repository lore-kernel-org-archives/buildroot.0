Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E40606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jInIYjuE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954DB80B97;
	Mon, 26 Oct 2026 19:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iUMylF1jvw6; Mon, 26 Oct 2026 19:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C157F80B7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043771;
	b=FKR3keuzRBJE/xQPG+fQBl4ru+vyHaaYV1H3oUxeyix0Hgh2IijAewYfECWX8SBiA+1+
	 BfVqiom5LNsvsp9IS2B8Ys+ppvkWkwVO8iHIxCr7Yt6AJGujr2lrwpf9gwl9oxWk029LA
	 NUXvcCLEEKcFVOHEPA9+fT3HSgM1IZitJIaGgbG4Y+jQqZiZ+mkDQW5MUWukt8flNqoNw
	 G6KVbXtNMSOmnexM28A7YXVrE7OlyXanSSM5Qy5Li4BlxVJpydJQ8urnqnKUclvtAS8K7
	 gZ1pXFJc1Xm/6IO3EK0fDC5tILwREjhHtz93wF30JurfHyVk+qXM+AdJ9JtlAdUpSkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=D/9ghkqqdzODBR2Mwlb6CRWIiDCzjDdVm7tzJ2Koa9g=;
	b=ERNnug1rPAkJpJu51gRrq+kFjKkS3JZOXpLtxqXUbORHOs2NjhNckF79sg2lWyIWelLH
	 4L4sPnHGHtlcUpM77AbdGJR6Rzblkx+WFvTnVdAMShoITlipmuKJ8nj2G86jUvH2AaJBj
	 JNKAJIFxNKEOAuF+kkbgRSe0/pSfcavli8rSTQKRYyDe74KbsYVqDUKURtgSTtsYJQ7HR
	 JL+zXEHcXK1hJFrmEt/2BSv03ruDn2qPEGCl/j9z1K6RENOhZDMNqTzhD0gw65Q+JFgq9
	 5BIwBHuHdIQWYe9iMeTfxzPIXJAnmmT9tTfZyvs5GOsR83MWeD+Et9N8dlkk487imSA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043771;
	bh=D/9ghkqqdzODBR2Mwlb6CRWIiDCzjDdVm7tzJ2Koa9g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jInIYjuEseTSxLkAjh0u7D9yiZ7YnylMszHzy/DayPmHyVfO2bdKBD5561AS/YE7V
	 lygCFUnT326Sr1fpKwzr91wEKHQwa7EKua2Ji303CiKnoH2FMgecbPVfsT2GiHjyqw
	 mowP422Ywst4DY2eL1K1nf+l0DNxri7UgsJCyQg2uw8LLobF9rYVzjRiaYQb2mMuT+
	 +EeQDDzjxkqlvSl3mj+5Vkhu6O0NUtuHBmoQjauNBuA6gB7SK5MXztFwkdBx0L06Ng
	 yuvuQPWcUOg9aW9u3EWGCuTSZzVTuLrjZuYoUvinkg9/kVOJb1UbyzTcjlGFMfPEdC
	 h8pQFuNP5Qp7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C157F80B7D;
	Mon, 26 Oct 2026 19:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 5C0ED2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 41C35400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 7Mi06WFManhM for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 553BE40062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043769;
 b=rA1p8T/reUv4CeP70x6+XOCsyDeeMQiOrlCpkXKtJkIs8FAxBrJ6MKZ1AeNh8LA5iV5H
 gNqr3ykdABdYa9AF66jG1b7rOOE5KcAeKo4Cw4tfYDu6T9aVVJH4/0Irr/HblcuH3a4SV
 wtUnSBx4xEdR73QuLk89bvdZxYXVFiXxzXV9ILtwfUOi4szPX3KxmlHOVRugWrIrw3pCd
 2NDuEfbi6ruxTWsrSlZSTBQXw8TlC8UiDgYRFuzT1322vSTKcLrQbTUpcaTeKlrtVCSgI
 jH+HXyGPVKQsDvJ/3+8VW9du3nHTyySOS8UctGeWIvbUWN0s/aHX53idvv1EewaLZcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043769;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=Rz1nkH0Id/viRAyebJ0GWGBEYsDlLHZcuX7HCNn1HhU=;
 b=DMI67i/w0fmCGCYmgbh7Q9dGD3fDqMeA6A1cJqmDXom4JvOnUnDRpV2YycbPFSciXDhP
 4PFJKWVR3VFj/gaNWvXkAMsDTIFjGWWwiYY0as3dPi1xoHwvYmjSmXvhj+FKt/Gbp91oy
 E3NS/RDdx6ekqWL/UeQoLTc5cTbqJXOKOBjGosh5EHf9/MIGCNZ1G6ZUND+TwNo/XdEll
 BwOR3uM0PqRUuFQWMgERVWFyBPxvAdacYnmbPKJiClku8Mkv0EDD+n2mRbxrHvQGvjM4a
 Oq1DhMzDOHN5LdP8NjB52YlCAwPYmbZBGJvjVw/Ta/LWGTc/nEpkw5sqrbo5KFJB7TQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=jSw8MAt+; 
 arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 553BE40062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 92B80410B0;
 Mon, 26 Oct 2026 19:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EBC5D1F01825;
 Mon, 26 Oct 2026 19:42:47 +0000 (UTC)
Date: Mon, 26 Oct 2026 21:42:45 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <at-tNZnxkxub4Qwq@kernel.org>
References: <20261026190956.376568-1-fiona.klute@gmx.de>
 <20261026190956.376568-2-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026190956.376568-2-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 2/2] package/swtpm: fix license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 08:09:56PM +0100, Fiona Klute wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
> BSD-4-Clause. The LICENSE file was last modified with upstream commit
> 5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
> 0.1.0, so the fix applies to all Buildroot stable branches.
> 
> [1] https://spdx.org/licenses/BSD-3-Clause.html
> [2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7
> 
> Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  package/swtpm/swtpm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index d6559c22d6..3357be9c39 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -6,7 +6,7 @@
>  
>  SWTPM_VERSION = 0.10.2
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
> -SWTPM_LICENSE = BSD-4-Clause
> +SWTPM_LICENSE = BSD-3-Clause
>  SWTPM_LICENSE_FILES = LICENSE
>  
>  HOST_SWTPM_DEPENDENCIES = \
> -- 
> 2.55.0
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
