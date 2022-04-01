Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A711C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 18:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6B6841548;
	Fri,  1 Apr 2022 18:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFptYlDXMNFl; Fri,  1 Apr 2022 18:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E04B4152D;
	Fri,  1 Apr 2022 18:05:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4841BF20F
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A40782C4D
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QaV4tKjwd5q for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 18:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D286282B08
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648836322;
 bh=MPQn/zXVpha1JqRxT/G5FNcxtWr2mJ5TsiKKoRXBhXc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IRRpvHDIOOHPRrAGGVYuno4g/I9Qc9gZDADGmyPEfgumwlndQpB9Hi27/TCHIPlo9
 f1ccZNeYL0Lgx2A93CywpJiLHjQ3+SBtiYo+hRdyB+q65vD8vmwr30BseljPXuO9DS
 IUs3ZXhRwA8luGqbAVDiNS8iiPXL1mpN5pt7wFio=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.24]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLiCu-1nIolN3OnQ-00HgZW; Fri, 01
 Apr 2022 20:05:21 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:05:19 +0200
Message-Id: <20220401180520.15772-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401180520.15772-1-ps.report@gmx.net>
References: <20220401180520.15772-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:aVrViBx0EpQI1CYqml5c9uUmsDgRNz4fvYK9un9XRl61By/f7V1
 HnlO6BRnoQH92TEoo8k4bZYeh3FoVzX79jDIz5GHKGxCFuPgCjt3IEs8I5XA8XZMDeI0aJ8
 BeqJf6JJ5UizUBSmck3oqNJpjGGx1/6nHPBS95ELijW6s2odmKwkhxPQ4YKRjQx2i0UoGD4
 Orp26O4Rydbeaq/H9WwPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PIkUKOADL1s=:jUi1Nd1EyDJ5pkCorIMW3b
 7nSuQ/p0wSlSYjYthaal3HyoexZhj4kVpbChT7qhLXk9eP9XuhFZiL++8SKP3adeJFEffjjNB
 PXYcah4zXa5LzscfLMusHy2/0SLC9/UlO4wOXQC6VY20gUpakbqYndQb3ik+VTIJAhcnRZCLJ
 C7EwesaqOeqG/hqBHVVbHDnVrSs2aDUh+fZzZkJoC4vv7lgf57BB6WfqR545mwS7JrKEhwpo8
 i32MruULeSbfqeM8Rxqo8Q8d7srVfwiE63s8Go1EV4fQras8uuPUJ9JzngIKNYbzDCTpHtDZt
 esHk4sxH7sonybMGJtvATKWIqjQg342A6649UHPR6w3uR9N6eym8n2a4yxPTkVX8LOVcjHRr0
 ISiUKliEap67qRH6gpWvrKLIBd/QMUdroUHPBSR8VqTzKNam6ifqohLpzrDkvBI3+Svzy3WZX
 FoL7NCQ8Q9RFij77tl0SfAp1KiKrqt8BzQaOQoiabzQMd/zsgZ9hNNl1+i0Y5qPP9sBQVXDii
 QioYSkUqPyLlwMGzN5LE3fHYzgebax5FOQSSds0wGSZhjcOFwC4TWJtjM4+zOZpl3NtLJJb6v
 gn3HvlJOwkh44eEM9AFgYtG2TIxkLcZopthR5eYAmxV8MC/+sXHuMwO89oLJLqKxYXcxEOEv2
 q/3G9TUXigBIbpGSotA8CpfNr64DnzsVz9KU39wyRb1C6QJujavQopqxcRITJQMVS+d1VikTm
 /NARZRt8KYYQMY7nMa//upwINJhrF/AiV//xX7Kqeqb7c8VBPhtxc4n1/4qZrFRg8VHulDyu0
 8HvYTU10wXEFxVmSwxepKmU2NRZ3NWKJwTfTPkknYRAaZMW6gUn1GAShdxkRn6ah6azi7mYN8
 ffkBQx/mIzEp60vFd0AjcoZ5RM4TINVUwG39kxKnwNZMY6gP3O9S3J3+VecZjqjGwNBwTVucS
 AdbDY8JzpUXjc/tKHmkAIskIpyjg4YAzwO3tCtC6pH2KWQnyQwKa73AVGlvu9TMtoDE+zeHoq
 gPUj5kYg3bDGYMLaNh0XlfkPultBaoTu7R8Jatoqdbjsk3bz3i3Lp1RLb3+V3FHWtnC0fgNd9
 oRcNurWVbUcWdc=
Subject: [Buildroot] [PATCH v1 3/4] package/apr-util: change download url
 from http to https
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change download url from http to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr-util/apr-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index cf8407ced0..fb0735f5e7 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -6,7 +6,7 @@
 
 APR_UTIL_VERSION = 1.6.1
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
-APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_CPE_ID_VENDOR = apache
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
