Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02972CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB6D844AB;
	Fri, 29 Aug 2025 14:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oh2SNsVNPg7C; Fri, 29 Aug 2025 14:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA71B8448B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA71B8448B;
	Fri, 29 Aug 2025 14:28:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1903D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65448414E0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pV3UxEOBAsI4 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 305B341740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305B341740
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 305B341740
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:28:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1035925622; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 14:28:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us05i-00CaVw-0i;
 Fri, 29 Aug 2025 16:28:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829111210.1669283-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 16:28:34 +0200
In-Reply-To: <20250829111210.1669283-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 13:12:10
 +0200")
Message-ID: <87tt1qi4ml.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GEeEMK2k0Y703hem8uE4NT/RrkVaHidbTA3K/cPc1y1609+ERGNnQXQ5H0MpMpZk/PyRcnqvutK2ze8buHuXd7VkULrWi6TCQM5sT1DldQvQIvN1DIuAg6soHP+ICxKL26r7u78KqcGwOBo1R2o4hjeVwyjYPSfdfAMnIHS8rcIXX7yzY2zcGgvPbz02KraqscWCLDprP3S/1Uv1yJAap/GoFSG13Mjb3dBEiC5XUaZYAYYorfnyZuwmFWvE8CNUnap/k1LzGcuMIg20iG3NqNNGSY9zX2mTZj5uhn3zt42fhyPBZkt5/Y3Qx3g90vUSQcDnHaJZNENLLaSG1wKoWw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ganNbfEgv6okOYnbFZ6M3AFGHXJbGEQMHg1OCGD+lL8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=GEeEMK2k
Subject: Re: [Buildroot] [PATCH] package/mariadb: explicitly disable the
 column store plugin
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Building the column store plugin (which gets automatically enabled
 > when Boost with a bunch of submodules is found) currently fails as it
 > requires a number of runtime checks that obviously cannot work when
 > cross-compiling.

 > OpenEmbedded has defined them as such:

 >   -DLSTAT_FOLLOWS_SLASHED_SYMLINK_EXITCODE=0 \
 >   -DSTAT_EMPTY_STRING_BUG_EXITCODE=0 \
 >   -DMASK_LONGDOUBLE_EXITCODE=0 \

 > but it really isn't clear whether those values are completely correct
 > for all CPU architectures, especially the last one.

 > So instead, let's disable the column store plugin until someone
 > actually needs it and figures out how to set those variables properly.

 > The issue fixed by this commit can be reproduced using the following
 > defconfig:

 > BR2_aarch64=y
 > BR2_ARM_FPU_VFPV3D16=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_PACKAGE_MARIADB=y
 > BR2_PACKAGE_MARIADB_SERVER=y
 > BR2_PACKAGE_BOOST=y
 > BR2_PACKAGE_BOOST_DATE_TIME=y
 > BR2_PACKAGE_BOOST_FILESYSTEM=y
 > BR2_PACKAGE_BOOST_REGEX=y
 > BR2_PACKAGE_BOOST_THREAD=y

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
