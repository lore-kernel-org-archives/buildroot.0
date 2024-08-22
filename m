Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F96C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 15:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE49A40B5F;
	Thu, 22 Aug 2024 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9ZT-wg0PuYE; Thu, 22 Aug 2024 15:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80AB14064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80AB14064E;
	Thu, 22 Aug 2024 15:52:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB081BF36D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD34401D5
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVHKilQ0N2h6 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 15:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97F6640105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F6640105
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97F6640105
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 15:52:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EEAD113F8C2;
 Thu, 22 Aug 2024 17:52:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 22 Aug 2024 17:52:19 +0200
Date: Thu, 22 Aug 2024 17:52:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Zsdes2ASEOmi8iEK@landeda>
References: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
 <20240820114501.185c9857@windsurf>
 <ZsRya7Q1XFeVaZT3@waldemar-brodkorb.de>
 <95399e85-29dd-43e4-86e6-632333eb3da2@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95399e85-29dd-43e4-86e6-632333eb3da2@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724341942;
 bh=8dNTul5Ihr8GgLU//jlOQsvot8XX3SSxGZgkZAtBQhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgUaVt+sUJhVhXa/PMZuhiINhC3p0vIikZ27PfQwBYkVuJ7Ve+J9r7FbmILHnugE1
 2pbbFeaPuqw3SDBOh8bBpPtLrXB2F4wp5z8DUbggvhovZme/+tzooaDOstQ0at1S8R
 r0W+iJ7B7eZEu1zMKLhO+2XG1Olh4DeWgvravjA4YgJINOHwC4nVAXP717y5B+7I95
 F7wjD3NbWCYAONVlm5pRJxGI7BRe/f3jFB3AblZGId+irXtardhnowhGpKqUtiuLGo
 sfoMX8EFmUuxWnHhIaQdcinH5xtzj/6ND5usYa8xeqr+Eiw4ObRIGwFhkVi1FtEYUt
 ptWaAi7zrFilQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FgUaVt+s
Subject: Re: [Buildroot] docker package in buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-08-22 16:00 +0200, Fiona Klute via buildroot spake thusly:
> Am 20.08.24 um 12:39 schrieb Waldemar Brodkorb:
> > > On Tue, 20 Aug 2024 11:13:25 +0200
> > > Waldemar Brodkorb <wbx@openadk.org> wrote:
> > > > When starting a container I get:
[--SNIP--]
> > > > docker: Error response from daemon: failed to create task for
> > > > container: failed to create shim task: OCI runtime create failed:
> > > > error opening file `/proc/self/uid_map`: No such file or directory:
> > > > unknown.
[--SNIP--]
> > > Indeed the docker-engine package enables a shitload of kernel options:
> > And who knows which one's are missing? :)
> My guess is CONFIG_USER_NS. With its default config the Docker engine
> doesn't use user namespaces, I guess you enabled it in your config?
> That'd explain why it works with the default setup but fails for you.

Thanks for the feedback, and for confirming USER_NS is needed; Waldenar
already sent a patch enabling USER_NS:
    https://lore.kernel.org/buildroot/ZsWTTvL0qv6By7lK@landeda/T/#mc8b308c86882ccd8934dd24f9c6a55028861be39

However, I had some comments on it:
    https://lore.kernel.org/buildroot/ZsWTTvL0qv6By7lK@landeda/T/#mc49f4054e2612b4c432c63b12e9112e06ff9b863

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
