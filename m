Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F013C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 21:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F1C8148F;
	Sun, 10 Mar 2024 21:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPsdgUXS-Asj; Sun, 10 Mar 2024 21:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AF61814B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF61814B5;
	Sun, 10 Mar 2024 21:42:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE9A1BF3F9
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2BB401C2
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRleGK2n0n2n for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 21:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DF0240105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DF0240105
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DF0240105
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 21:42:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F441C0003;
 Sun, 10 Mar 2024 21:42:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rjQvo-008DZ2-33;
 Sun, 10 Mar 2024 22:42:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240211160553.429144-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Mar 2024 22:42:08 +0100
In-Reply-To: <20240211160553.429144-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 11 Feb 2024 17:05:53 +0100")
Message-ID: <87msr5u5lb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package:libselinux: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as
 > libselinux uses setuptools instead of distutils since version 3.5 and
 > https://github.com/SELinuxProject/selinux/commit/2b5d5585754eb731a68158b613c7676fc3195ed9

 > This will avoid the following build failure raised since commit
 > 09de823cbc7bd50a40e25f4166b4e42be94b0c7b:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/Python.h:38,
 >                  from selinuxswig_python_wrap.c:168:
 > /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
 >   586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
 >       |  ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3fbbb741de33310c8cacab753a32e79c5e531036

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
