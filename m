Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CACC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC6982077;
	Wed,  8 Feb 2023 16:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EC6982077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvuzHkMIIMbA; Wed,  8 Feb 2023 16:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B989282071;
	Wed,  8 Feb 2023 16:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B989282071
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CD871BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F26940868
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F26940868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjaWBWpYaFsP for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:41:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A37224085F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A37224085F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:41:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A4FE20004;
 Wed,  8 Feb 2023 16:41:49 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:41:47 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230208174147.04b62979@windsurf>
In-Reply-To: <20230208162726.28775-1-ps.report@gmx.net>
References: <20230208162726.28775-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675874509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aHDwVQOoM53PbPa7gsUx0bhSl2c8nNHofNKCt2AG0k=;
 b=aF+pzGx0VLeHh1XTBhL/MC5L9m127VducFg5zDzyYuReTMLK1pQF0PvL8Pg5ezUR4UAUh2
 ZquNfjawVgjtF4sL7b/zu8HdC854UKQ0LW2z1KgNWRab9B0TGhAyR8OGMGMoB+u0yk77Dd
 n2i8alZ1CBZOrC6k0AmzW+ppVfJ4qx7yLY7942JV+AlYEAXZ0BnLChgTGilJ1upP9vNPTb
 921CA0p2AFX4JmDTtGbKj/cAB/7trzaaJoS6bqnKBFkpP/wtyFDLtTpyft9/ea1BDHX4M3
 DOo+hQIEbfPJTU7DHpOQ8KfoFjCfJN32V64ToIGLV9x4iEffYKsFBjaGsS1fWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aF+pzGx0
Subject: Re: [Buildroot] [PATCH v1] package/qt6base: additional disable
 FEATURE_avx512vbmi2 and FEATURE_vaes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Feb 2023 17:27:26 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - additional disable new FEATURE_avx512vbmi2/FEATURE_vaes (added with
>   upstream commit [1])
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=38e6b637b71fae274caedc1d326f641b904e00a4
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt6/qt6base/qt6base.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
