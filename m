Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFEEC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 12:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12508206B;
	Sun,  3 Mar 2024 12:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpWe35KpGdvC; Sun,  3 Mar 2024 12:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3EB82163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3EB82163;
	Sun,  3 Mar 2024 12:13:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF5C1BF34A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 261DA82163
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-7j4K5uoPKx for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 12:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAE358206B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE358206B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAE358206B
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 12:13:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09EC0E0002;
 Sun,  3 Mar 2024 12:13:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rgkix-0084xN-1M;
 Sun, 03 Mar 2024 13:13:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240303105034.466131-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Mar 2024 13:13:47 +0100
In-Reply-To: <20240303105034.466131-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Mar 2024 11:50:34 +0100")
Message-ID: <87jzmj4io4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 libopenssl needs perl bigint on s390x
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

 > Commit 7ea38660e01a87ab70c02e38c78a49202e8e5c21 confused bigint [1] with
 > Math::BigInt [2]:

 > Can't locate bigint.pm in @INC (you may need to install the bigint
 > module) (@INC contains:
 > /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../.. /home/buildroot/autobuild/instance-1/output-1/host/lib/perl
 > /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
 > /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
 > /usr/lib64/perl5 /usr/share/perl5) at
 > /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm
 > line 16.
 > BEGIN failed--compilation aborted at
 > /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm
 > line 16.

 > [1] https://perldoc.perl.org/bigint
 > [2] https://perldoc.perl.org/Math::BigInt

 > Fixes: 7ea38660e01a87ab70c02e38c78a49202e8e5c21
 >  - http://autobuild.buildroot.org/results/777d86a1e53dc3d6a16c829348673f1c33245a6c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
