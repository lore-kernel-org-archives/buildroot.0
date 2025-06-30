Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D3EC83033
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B88A848FB;
	Mon, 30 Jun 2025 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kH2IY1OC99hE; Mon, 30 Jun 2025 19:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9B69848DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B69848DF;
	Mon, 30 Jun 2025 19:55:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5A80DF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6F2F60F76
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXEbR8RvilpL for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA07B60BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA07B60BE9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA07B60BE9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id ECB11B005A3;
 Mon, 30 Jun 2025 21:55:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 21:55:02 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 21:55:02 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20250630072423.1126928-1-thomas.perale@mind.be>
References: <20250630072423.1126928-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <03bf5021322d2d422473d1934736b17b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751313305;
 bh=2sEb5GuHjHWuEy90ASrgQqhI875UcJR9Xkk8SxeeEyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eU32KxbnvpqNGnn2T17K7/sA3VCP9xOho6OHt5i9cw0bfJLMLLwqOWrhv3wTxA3nz
 cJhiaIBLC5SGs/MjOIeF32o4uCVn40PWhmtO+xgfDlPvXhQtisBEIXvNsTPjoKVbdw
 OAfdpo1GsxICyOd5C/lFm7lPuvdHywIm6EoB9oHtAKbHfoB/ZCgCkdvIhcK3nWYf/g
 JEYxpuwyzaZMO09btUEdmY24jfxfpf7yV5bUXfV+7Q+IG+iA5yxRRN2xD6k1TGJ+C7
 g65RVGt1yATpj0DuScXrvK9HuZqVBC3DeW8Dtzn7LygTrbdi2lF9/LVXlR3tdy9RF0
 hxn3d2pJ/LiTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eU32Kxbn
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.10
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

On 30/06/2025 09:24, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE 2025-47947: Versions up to and including 2.9.8 are vulnerable to
>   denial of service in one special case (in stable released versions):
>   when the payload's content type is application/json, and there is at
>   least one rule which does a sanitiseMatchedBytes action. A patch is
>   available at pull request 3389 and expected to be part of version
>   2.9.9. No known workarounds are available.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-47947
>   - https://github.com/owasp-modsecurity/ModSecurity/pull/3389
> 
> - CVE-2025-48866: Versions prior to 2.9.10 contain a denial of service
>   vulnerability similar to GHSA-859r-vvv8-rm8r/CVE-2025-47947. The
>   `sanitiseArg` (and `sanitizeArg` - this is the same action but an
>   alias) is vulnerable to adding an excessive number of arguments,
>   thereby leading to denial of service. Version 2.9.10 fixes the issue.
>   As a workaround, avoid using rules that contain the `sanitiseArg` (or
>   `sanitizeArg`) action.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48866
>   - 
> https://github.com/owasp-modsecurity/ModSecurity/commit/3a54ccea62d3f7151bb08cb78d60c5e90b53ca2e
> 
> For more details on the version bump, see:
>   - 
> https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.8
>   - 
> https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.9
>   - 
> https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.10
> 
> Also this patch change the _SOURCE variable that now include a 'v'
> prefixing the version.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.

For info, I also updated the hash source url in hash file comment. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3d593a8144ad8890dae4ab6fd235eef700d3c144

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
