Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47089F433D6
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB79810EE;
	Fri, 17 Apr 2026 08:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8qzy4MW6z_8; Fri, 17 Apr 2026 08:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5C0810E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776412934;
	bh=WltrJ2cB6ih4VNF1YAu47BqoEJZeZo64hyBQpGCCSWI=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=n4xXLXY9bBsSinQVfurv7hC92FRryh4VbDOsR07un0HD6nX+CYcN7dVZZPQC91HH+
	 zWixF0Y8YNJxrXP7nmdYF61RHf//ARkNZ8IIyyfdF4dQzupUnZCUI40aQdoT7YXyAr
	 VBeSvGydV2V91RYyHsFsRpPk9CgAw5oL957T/rsW9EudRGc5YwI38RJtRu6q8HLn4r
	 96qkga9dUruOJlM3qSDakG1a4o/GA8lgsvAPyMpYoNMVquouUzBcMnV3mWJTF8LC9o
	 a7PyKSQfOjymtJ4/ZC5Gm9Lz72/XMLpL1lDjQ64UOAx+bVOlCfXb9yrgfn89wpV7YD
	 oyYwxEiNov+ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5C0810E8;
	Fri, 17 Apr 2026 08:02:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6044270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C46CD40801
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpF4Uc5p1-Ry for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE46540776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE46540776
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE46540776
 for <buildroot@uclibc.org>; Fri, 17 Apr 2026 08:02:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wDe9Q-0008Vw-QT
 for buildroot@uclibc.org; Fri, 17 Apr 2026 10:02:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 17 Apr 2026 10:01:38 +0200
Message-ID: <pan$a7a16$18f8ef83$b69cd686$d2a52258@ID-313208.user.individual.net>
References: <20260417073702.53790-1-chakrabortyshubham66__16670.5740893789$1776411460$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/autoconf: bump to version 2.73
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 17 Apr 2026 13:07:01 +0530 schrieb Shubham Chakraborty:

> - Bump version to 2.73

Hi,

duplicate of https://patchwork.ozlabs.org/project/buildroot/patch/
20260409131906.279061-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
