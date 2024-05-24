Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06033C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3D481757;
	Fri, 24 May 2024 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69OWo-YAFMjN; Fri, 24 May 2024 12:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C588175D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C588175D;
	Fri, 24 May 2024 12:39:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1111CF92A
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36D1060B0E
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8IqPvNiYBo0 for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1941C6060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1941C6060E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1941C6060E
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:39:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 667931C000C;
 Fri, 24 May 2024 12:39:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAUCX-00FwZx-2j;
 Fri, 24 May 2024 14:39:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240523170006.1488807-1-fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2024 14:39:13 +0200
In-Reply-To: <20240523170006.1488807-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 May 2024 19:00:05 +0200")
Message-ID: <87sey7jsem.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/atftp: fix build with pcre2 >=
 10.43
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump of pcre2 to version
 > 10.43 in commit fa9e575776ee3d3d47a31fee3c09a94753c77cc7 and
 > https://github.com/PCRE2Project/pcre2/commit/014c82d7bcc2873cdb1f3abc5e5348587f477ba4:

 > tftpd_pcre.c: In function 'tftpd_pcre_open':
 > tftpd_pcre.c:109:37: error: passing argument 1 of
 > 'pcre2_substring_list_free_8' from incompatible pointer type
 > [-Wincompatible-pointer-types]
 >   109 |           pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
 >       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >       |                                     |
 >       |                                     const PCRE2_UCHAR8 ** {aka const unsigned char **}
 > In file included from tftpd_pcre.h:24,
 >                  from tftpd_pcre.c:35:
 > /home/autobuild/autobuild/instance-10/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/pcre2.h:949:1: note: expected 'PCRE2_UCHAR8 **' {aka 'unsigned char **'} but argument is of type 'const PCRE2_UCHAR8 **' {aka 'const unsigned char **'}
 >   949 | PCRE2_TYPES_STRUCTURES_AND_FUNCTIONS
 >       | ^

 > Fixes: fa9e575776ee3d3d47a31fee3c09a94753c77cc7
 >  - http://autobuild.buildroot.org/results/46565c834a8162a651944885104027610a65f9c3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
