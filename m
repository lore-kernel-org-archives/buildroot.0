Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF595C36011
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 09:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9340786;
	Sun, 30 Mar 2025 09:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZP2gVel0pQx; Sun, 30 Mar 2025 09:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DF24078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DF24078C;
	Sun, 30 Mar 2025 09:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A15D0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3991880EB5
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oLiSYasOdyp for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 09:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 418E980ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 418E980ECE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 418E980ECE
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:12:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 62E275FFB4;
 Sun, 30 Mar 2025 11:12:32 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34994])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Mar 2025 11:12:32 +0200
MIME-Version: 1.0
Date: Sun, 30 Mar 2025 11:12:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
In-Reply-To: <20250330070227.1252414-1-thomas@devoogdt.com>
References: <20250330070227.1252414-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <00fc3148f2bc8494de947c7d7abd363f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743325955;
 bh=A7Pagzl9ap6NrvvSw0cyBR0KpBZrRBrw/7TdxUExX7c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YG0TnzCAprjfRmdeWcX3T94GbTb4LGhvSFVPTTUVehlmlZt6NcsvcOQYbfNPhVCB8
 G17BBwUMYrIuDSFmqkYZIXdNGEwrIdGzWchYu2mqYqoCqM8LFFeDAKYppKb7SXMqSf
 nDmy92sYfAPDHJkdvHSfveVgRre+By5E9K6AGtOpayWWDiml/wXZb6t3QJcOXk4Eok
 5oINmAksMa984G3D/hwD/oFi13lFj/0lKIhUfi1X+qJWsbYJG2eLvZcMIN3EuiuMkT
 yZRxDibJQmusUKpZux22o3ID6LsDJ0lRGg5rE4bKCK+a7Jb/g3i0ZCSeu0G/qs4VBq
 mH9WBrdmfrYWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YG0TnzCA
Subject: Re: [Buildroot] [PATCH v1] package/libsrtp: bump to 2.7.0
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

On 30/03/2025 09:02, Thomas Devoogdt wrote:
> https://github.com/cisco/libsrtp/releases/tag/v2.7.0
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
