Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721A0C3600E
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 09:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42AB41DF5;
	Wed, 26 Mar 2025 08:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvzVvmQgGcL5; Wed, 26 Mar 2025 08:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12DD741749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DD741749;
	Wed, 26 Mar 2025 08:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9094EE4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5843405F2
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiRwFVxqLRZX for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 08:59:56 +0000 (UTC)
X-Greylist: delayed 1339 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Mar 2025 08:59:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CDD040184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDD040184
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.141;
 helo=cczrelay01.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
Received: from cczrelay01.in2p3.fr (cczrelay01.in2p3.fr [134.158.66.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CDD040184
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:59:55 +0000 (UTC)
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
 (authenticated bits=0)
 by cczrelay01.in2p3.fr (8.14.4/8.14.4) with ESMTP id 52Q8bZAW014231
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 09:37:35 +0100
Message-ID: <2834e139-69b2-44e3-aceb-b8b6f44cde22@clermont.in2p3.fr>
Date: Wed, 26 Mar 2025 09:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: ML_Buildroot <buildroot@buildroot.org>
From: David Picard <david.picard@clermont.in2p3.fr>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
Subject: [Buildroot] how to force-check hash for extra file?
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

Hi,

In a home-made package, in addition to a Git repo, I need to download a 
binary file. I do it with curl in a pre or post download hook.

I provided a .hash file for the package. Buildroot actually checks the 
Git tarball hash, but not the other file's. How can I force it ?

David
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
