Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CEDC3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 06:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601F884452;
	Sat, 10 Aug 2024 06:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQoUdfsupj3Z; Sat, 10 Aug 2024 06:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C58684454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C58684454;
	Sat, 10 Aug 2024 06:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C474E1BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCD360707
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-_6PBAkBglK for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 06:34:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB82760706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB82760706
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB82760706
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 06:33:59 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5C9E4353B5F6; Sat, 10 Aug 2024 08:33:57 +0200 (CEST)
Date: Sat, 10 Aug 2024 08:33:57 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrcJ1fKlnF/ZJpy/@waldemar-brodkorb.de>
References: <ZrWionLijDXHPUjW@waldemar-brodkorb.de>
 <20240810000945.25a1e049@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810000945.25a1e049@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723271637; bh=mHMTYVGgGBHY3okdjE/S7UKRXiYBPOtM8bHTK959En8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VUmXou75oX0Hr/ocaLR4t+KJaOdHQtUt4ybqDlJUsihNwGp0rGtNacw5os9GMgcdt
 nDEzH4ySVXuQqjETQvRPZImADoj13uG8499JftT0cd1VDSZ4ZtyjPMqbqSXwGTP+F7
 cwsk0jfDWLA5dvcxwwWGWn26VaLwgD+f/b5UU6MtBEYu1wHZc9sf6kDjFRTpoMNOay
 E37JipNgzPqIdAU73UuNxraKS+g/sY5OBzVtCdKitk+qMDO1cDfZPpGSCldUYTa6Dl
 zRHinE9MTUrzZlRypI2eycLK6COCPJSafHUSSMD6O8cEqw1Nid8nTnjZWhsBdWaXug
 3x6HSBZEf+qxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=VUmXou75
Subject: Re: [Buildroot] [PATCH] package/screen: fix compile issue
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

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Fri, 9 Aug 2024 07:01:22 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Add a patch to include pty.h. Similar change is already in Upstream
> > git repository.
> 
> Could you please backport the real upstream commit, as-is, and refer to
> the upstream commit?
> 
> Thanks a lot!

I had done this if it was possible. I can't get it to work.
They removed some stuff in d34b7dfd9b5bf35acbb0e434f820a00b467bdc8a
and added <pty.h>. Then later in 3251f5b2e4bb165edc562702527d548e38aac897
they changed it again. 

Unfortunately it is not possible to git am the patches.

What should we do now? Could you take a look?

It is a real trivial change and the patch can be removed as soon as
5.0.0 is out.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
