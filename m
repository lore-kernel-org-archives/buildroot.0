Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B174606A31F
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 22:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZMluA9kb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=moysys.com header.i=@moysys.com header.a=rsa-sha256 header.s=dkim header.b=VhbpcL4P
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6147080DAB;
	Sun, 15 Nov 2026 22:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j3P8bzdvArr; Sun, 15 Nov 2026 22:55:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 627AF80DCD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794783331;
	b=faqYk9v1qMH0HzwHatGy9Zr57v695DtsXPKp8kgSwelyh84cP/oN1Ijestffh9YWD50/
	 Zw2z54hIQC3f7/uOMZWelsP8f/401lOtzhBuYOpg4NzI1Kp59qzleyOblpNyRBbzmKzIO
	 fG9s/Pkr8RZ3cGHLewEVd2r8W6XbR4cQzSDo+pl3QcDcUBDtYVS8tTwPBPvtUpYtgOtkH
	 qEF5FXfuvH86ddDFeIkQ+Z7yGRFF6FiXwODZZ10gkNqUw4kxRmTxpYYf6ugGdq5lZoPKr
	 MJy+FGNd5ZOLswpzizxcNEC2ucug6Kgy/JBwRL3jObHjRUHzhsvQMKZE35xG2ExYqoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794783331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:X-Authority-Analysis:DKIM-Signature:Received:
	 Received:MIME-Version:Date:From:To:Message-ID:X-Sender:User-Agent:
	 X-EN-AuthUser:X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Transfer-Encoding:Content-Type:Errors-To:
	 Sender;
	bh=Gy2T+j6YqF0Gw4gopUDZohzPUMMpTC/e6Aa6DQ1QF5U=;
	b=QIaIOjjcYhLFcpfwN8ruiRboP+2Jn9F5rKDQ1g1d2rEs3BE1gdFG5Mf0zO4n0p9Wl4mq
	 BRVtAsfHVWzjBm2lgoRIG69Rn78xY9kROqyNONCHBfZyw0Wi6eDWbKkl0ouUw6tDDXMnj
	 uuQWDJaOn18unpMJ2//Tsrg5o9yZ9CQdFyk8Taw42nt51DQz1yp0O8bo91sPCLX/91ezV
	 yaAL0LBjsYF+4d0AKvnQnp6Cjd/HqDRQ+/B73c8asch/gwxwR6gc2G1N+fscMdkzyE6l6
	 NJZw9QL4JUGUNtdiSCMY842ZQ5daIRrZVjryH57Fe1Ih6QC0+kl4+fXocn7Uh4fK/Qg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794783331;
	bh=Gy2T+j6YqF0Gw4gopUDZohzPUMMpTC/e6Aa6DQ1QF5U=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZMluA9kbzkoL0TsaCZmQtMvM4awyuLxJUf9sO2vIJ+FNEu4vDksPL98JIOKaIuq6V
	 X7it9dIHjCS667K+3gHC7NGeN+n2JXzCH3dQvlshmj+rPzRRaqtl/68NXi7bKpwpWs
	 coNc3HiRpXvwV2GHZobd5tChCDt4DOCDRUoZeb2A4rQpSQnhiYVs3sEHAiCqKtxD3U
	 W0qV3VYA7JZt9hOx6q/H5KyYrcgpAXIliexAxoUG7jK0RMqtQlMIs+3hGuP8Nfx8se
	 quqM9cnvWxjjoqYmT23sUhbx/j/3XIr6QeuQmartEj2itqR9X7CxRvV5+9WLgAno8j
	 DW2OuDadLe0qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627AF80DCD;
	Sun, 15 Nov 2026 22:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A832BD7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 22:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99D3A40072
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 22:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0mMDTKK-joK for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 22:55:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6B40140048
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=52.11.48.74
X-Greylist: delayed 225 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 15 Nov 2026 22:55:28 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=moysys.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=moysys.com header.i=@moysys.com header.a=rsa-sha256
 header.s=dkim header.b=VhbpcL4P
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=52.11.48.74;
 helo=omta083.uswest2.a.cloudfilter.net; envelope-from=michael@moysys.com;
 receiver=<UNKNOWN> 
Received: from omta083.uswest2.a.cloudfilter.net
 (omta083.uswest2.a.cloudfilter.net [52.11.48.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B40140048
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 22:55:28 +0000 (UTC)
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
 by cmsmtp with ESMTPS
 id SeWJxK7P3RiNxSj4XxII5u; Sun, 15 Nov 2026 22:51:42 +0000
Received: from boswebmail09.eigbox.net ([66.96.128.104]) by cmsmtp with ESMTP
 id Sj4XxnAS5uJrPSj4XxT1Me; Sun, 15 Nov 2026 22:51:41 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afa377d
 a=dkG2Bjcj3DwMoMSLJTjRXw==:117 a=dkG2Bjcj3DwMoMSLJTjRXw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=W203zItmwEQA:10 a=Bb6IeCN5AAAA:8
 a=uvk0TdQvQ5CFgQ3SUTkA:9 a=CjuIK1q_8ugA:10 a=7t67fzUm6F4wUYujT-3C:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=moysys.com; 
 s=dkim;
 h=Sender:Content-Transfer-Encoding:Content-Type:Message-ID:Subject:To
 :From:Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZJxrkQuIFBHuUXMKbYo45CUBrj5241X9TWIl8IMPGM=; b=VhbpcL4PORTjI/8Q0VpVgtWL2V
 XMxbrWa0mcDPGMLu8DPfiOZj9LL9Krautsc35wh7l9egbCUAdX2CnIDfoIbXVzU+lCZMOsUDgXlQx
 esQaMpXqB1u4xnZeOyaErxsDOiN5V7QhDwWV8qXA31W0Vhspy4g+N8Yc+oes/bG0AZbynHt6aAotl
 eUt1ChAwgh865i9XOy+YbH2I/QdnR1jxXxHKBvug/cLQRUry6oDuy6kAEG2bpqsbhNFDNd82coMRy
 RC0kITVJZIANgjUCHaKOGEHMuWqEqySDMvsjogazzp6soITrVYR+3CQPVupZxcjF8V2U34E5OpV3S
 Zh3tnXMw==;
Received: from [127.0.0.1] (helo=ipage)
 by boswebmail09.eigbox.net with esmtp (Exim)
 id 1xSj3x-000000002fh-2hOM; Sun, 15 Nov 2026 17:51:05 -0500
Received: from 66-33-8-157.colorado.intrepidfiber.us ([66.33.8.157])
 via [162.159.99.106] by emailmg.ipage.com
 with HTTP (HTTP/1.1 POST); Sun, 15 Nov 2026 22:51:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 17:51:05 -0500
From: michael@moysys.com
To: buildroot@buildroot.org
Message-ID: <4a65b600f69b00a8366293ab1df6a2bc@moysys.com>
X-Sender: michael@moysys.com
User-Agent: Roundcube Webmail/1.3.14
X-EN-AuthUser: michael@moysys.com
X-CMAE-Envelope: MS4xfAeRpAwSFUZurs3gJuGxthQUPDrHDeTfNLgzQ+Gm5KHo30rM5w5eZpgW1eQHMx8E0kAz3LdI/zdVsSg4R7Rns3/lRdCNNdZ83/34Y+9MtxFhzskQnQf5
 hsN1eBKAj4egIHwHDTPLrefXostW7Cqlz1qpNgYyVjnYzquaIEq7dUxSFzf0/3gP3sM/JnDKHB8VkNvPDaWJDFNXDMKZM7hqYP/dOujPfQ5pn8zKjipTq5s1
Subject: [Buildroot] [2026.08.x] Incomplete python-pkg-resources backport
 breaks U-Boot binman builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The nightly build of my 2026.08.x KV260 configuration has failed since 
the stable batch of Oct 29. The build stops with:

   make: *** No rule to make target 'host-python-jaraco-text', needed by
   
'.../build/host-python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf/.stamp_configured'. 
  Stop.

The cause seems to be these two commits, which were backported to 
2026.08.x:

   c58cbe478a package/python-pkg-resources: new host package
   c647377c53 boot/uboot: add host-python-pkg-resources dependency

On master, these commits come after a series that adds host variants for 
the packages they depend on (760fd221a1 "package/python-jaraco-text: add 
host variant", along with jaraco-context, jaraco-functools, 
more-itertools, typer-slim, typer and others). That series was not 
backported. As a result, on 2026.08.x:

   - python-jaraco-text has no host variant, but 
HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES requires host-python-jaraco-text
   - host-python-jaraco-text would in turn need host variants of 
jaraco-context, jaraco-functools, more-itertools and typer-slim, which 
are also missing

Any configuration with BR2_TARGET_UBOOT_USE_BINMAN=y now fails to build, 
because U-Boot pulls in host-python-pkg-resources.

I tried cherry-picking the host-variant series onto 2026.08.x, but it 
conflicts (python-shellingham, for example, does not exist on the 
branch).

As a workaround, I reverted c647377c53 and c58cbe478a locally, and my 
build passes again with binman working. That is expected, since 
2026.08.x still uses setuptools 80.9.0, which includes pkg_resources, so 
the standalone package should not be needed on this branch.

The 2026.08.1 tag predates this backport and is not affected.

Thanks,
Michael Moy and Claude Code

michael@moysys.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
