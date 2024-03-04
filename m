Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B94C54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3764440773;
	Mon,  4 Mar 2024 07:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFmJ6I5AJ9hn; Mon,  4 Mar 2024 07:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AF3407AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64AF3407AB;
	Mon,  4 Mar 2024 07:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3251BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C826F8191E
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjDhMDOi6bOH for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49F13818BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49F13818BE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49F13818BE
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:10:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A946B240004;
 Mon,  4 Mar 2024 07:10:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rh2T2-00CA0d-0D;
 Mon, 04 Mar 2024 08:10:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: nvd <nvd@nist.gov>
Date: Mon, 04 Mar 2024 08:10:31 +0100
Message-ID: <87y1ay321k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] CVE-2023-40548 version range fix
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

Dear NVD maintainers,

Your entry at https://nvd.nist.gov/vuln/detail/CVE-2023-40548 for
CVE-2023-40548 states that the affected CPE ID is

cpe:2.3:a:redhat:shim:*:*:*:*:*:*:*:* Up to (including) 15.8

But actually, the bug was fixed in shim 15.8:

https://github.com/rhboot/shim/commit/96dccc255b16e9465dbee50b3cef6b3db74d11c8

And the CVE is also listed in the 15.8 release notes:

https://github.com/rhboot/shim/releases/tag/15.8

So it should be < 15.8. Do you think you could adjust the NVD entry for
this CVE ?

Thanks a lot in advance!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
