Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37476C7EE23
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 17:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DFC83440;
	Mon, 29 May 2023 17:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DFC83440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G--y28ULSteJ; Mon, 29 May 2023 17:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A32D08266D;
	Mon, 29 May 2023 17:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A32D08266D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD751BF2C3
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EDE8266D
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 17:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EDE8266D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOwLB2angTPl for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 17:21:25 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5910D8233C
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5910D8233C
 for <buildroot@buildroot.org>; Mon, 29 May 2023 17:21:25 +0000 (UTC)
Received: from [192.168.178.10] ([151.71.248.217]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.17.173]) with ESMTPSA (Nemesis) id
 1MBDvU-1pwYfO1Pig-00CkEd for <buildroot@buildroot.org>; Mon, 29 May 2023
 19:16:16 +0200
Message-ID: <87290963-3b17-0fdc-5a54-b0ae06f46e8d@paguilar.org>
Date: Mon, 29 May 2023 19:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
X-Provags-ID: V03:K1:O3JmJe0Cr3fXogL329k4LVSgE1LiI6CEIyzXu2XYY9zoc7WMP+i
 a6QT7vNQS8TPr3O4dGJnP+F9D7kw2df6FPW+D7joB7RFnqIptR80sMTCx5BbvxXPHMLOPm8
 nwqIt3jAdNegIBILg82ueGP6zTxi/VPL9qigx7k6qprbQ2oarfGKwt+wYE3y4FD3vHuS3QZ
 ZkauH3h2HFovmkX7rRojg==
UI-OutboundReport: notjunk:1;M01:P0:PjEOhb/y4jI=;4gWPx/c9WnDch1v6Wi31SsVwyoH
 7WPorsWYpFW82+Fj95SmcN6bP2nUFrxWPOvn8ORFYKhfBx0G/B6GDm5/PC4y8TNRibH71hKvn
 pP+txTtGWuNZQhZkUR4iL4C93rXCvN1Y2ULKuz3kKKEoUe+WzmWVUFgLUq4EGxhspIynZNhzR
 Jk1TM/AaJhNmJiFMhc6t7gP1+D6N9XNJGSDsRC3tjh+Q5WRVh/OOhk4zGntEQFlLtPRm6CL44
 bVdFJfbDYGkuaxPg2g4y0BgzoI5f0tQ+J5u59/i9aGjJWJH4MFqdRdEgga2u9tUTVQgoPCqk9
 5ztn4D+19IEGclycnzl2V6QwERBSRsgwMMrjI9xWbK3zSEpHpAuZ2gxmwv+Bjc/6BYWRCgO3F
 sHX7ZgsN16ibgD8iH9L4m04FFToQsyCjYgFp8sRw1j4u022vlyBuuu78bwVO+whHqp7y9uaCL
 fSPikiK2dmZS7QsIxiuI4Ckh7oqXVV1AyhawH8iZct1rvbKnm3xzs+Ux2PsfR5ZqyGZcb9KkB
 sYi0FlrW5eFy4afT321Q225GTvS6qvfyBE7yLmWz8CHzW+XQblfL1dKWr9Wt3HjPyw2A3QLnW
 Ab4rBC/CaZ9yi0hm9siFjNcF0PnEQFbjqvnuvtky075J2TwHi6fEWfVgzL+YdTyNliCjuCAPf
 Xtx24A7eoB7iES7PG4QM80dd1Ew10+PFRK4QvX7LXQ==
Subject: [Buildroot] [RFC] Top-level parallel build without the per-package
 directory mechanism
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I've been using Buildroot for a while and every time I need to rebuild a 
complete defconfig or a significant part of it, it takes a lot of time 
and if I try to speed up the process using the experimental top-level 
parallel build it uses lots of storage space and sometimes the build 
fails with some br2-external trees.

In order to speed up significantly the building process, use the same 
storage space as the traditional builds and avoid failed builds, I wrote 
a simple program that can be integrated into Buildroot and can be easily 
used by just entering 'make pbuilder' instead of the default 'make' or 
'brmake', no new config options are needed.

If someone is interested in giving it a try, it can be done in a couple 
of ways:

1. Use it from inside a current Buildroot tree: Just follow the few 
steps described in the README of the program's repo (1). In short, 
download it, patch Buildroot and build with 'make pbuilder'.

2. Download this Buildroot fork that already contains the program (2), 
configure any default defconfig and build with 'make pbuilder'.

The same link (1) describes how this top-level parallel build works, how 
to use it and other details.

This is just a proof of concept that seems to work well with Buildroot's 
stable release 2022.11 or later and the master branch of the official 
repo, and with several built-in defconfigs (I tested ~75) and projects 
with a br2-external tree.

It still needs testing and it may not work in some cases or could break 
some Buildroot's rules/guidelines. As a matter of fact, it's not clear 
if this could be somehow integrated into Buildroot's official repo, but 
that would be the final scope, so any feedback, fixes or hints are more 
than welcome!

(1) https://github.com/paguilar/br-pbuilder
(2) https://github.com/paguilar/buildroot

Thanks!

Regards,
-- 
Pedro Aguilar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
