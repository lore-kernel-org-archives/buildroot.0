Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069D3C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 08:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBBC41338;
	Sun,  9 Feb 2025 08:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLUkCCTId-Cn; Sun,  9 Feb 2025 08:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334DA4133A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334DA4133A;
	Sun,  9 Feb 2025 08:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F9356C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E688820AF
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2thQDKBIkPZt for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 08:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F374181FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F374181FF9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F374181FF9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:50:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E248432C2;
 Sun,  9 Feb 2025 08:50:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1th31c-003nAj-30;
 Sun, 09 Feb 2025 09:50:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok <bobrofon@gmail.com>
Cc: buildroot@buildroot.org
References: <20250208180103.101825-1-bobrofon@gmail.com>
Date: Sun, 09 Feb 2025 09:50:48 +0100
In-Reply-To: <20250208180103.101825-1-bobrofon@gmail.com> (Sergey Bobrenok's
 message of "Sat, 8 Feb 2025 21:01:03 +0300")
Message-ID: <87bjvb8psn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefgeejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepffelveduuedtfeeggfdugfelgfegueevkeejtefgffeuteduuefffedvleetjeevnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhthhhusgdrtghomhdpghhnuhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsohgsrhhofhhonhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.02.x] package/sdbus-cpp: fix build
 failure on gcc14
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

>>>>> "Sergey" == Sergey Bobrenok <bobrofon@gmail.com> writes:

 > The original commit [1] was merged [2] in sdbus-cpp v1.5.0.
 > Fixes:
 > https://autobuild.buildroot.org/results/bd0a9fe123956f01336462a31c3375a036744234/

 > [1]
 > https://github.com/Kistler-Group/sdbus-cpp/commit/f50e4676fe9289eec0744efae2216aa8795fa461
 > [2] https://github.com/Kistler-Group/sdbus-cpp/pull/380

 > Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
 > ---
 > (2024.05.x, 2024.08.x, 2024.11.x and master are not affected as the
 > version was bumped)

You missed the upstream: tag in the patch. Committed with that fixed to
2024.02.x, thanks!



> ---
 >  ...missing-algorithm-header-include-380.patch | 29 +++++++++++++++++++
 >  1 file changed, 29 insertions(+)
 >  create mode 100644 package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch

 > diff --git a/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
 > new file mode 100644
 > index 0000000000..df4b78edca
 > --- /dev/null
 > +++ b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
 > @@ -0,0 +1,29 @@
 > +From f50e4676fe9289eec0744efae2216aa8795fa461 Mon Sep 17 00:00:00 2001
 > +From: Alfred Wingate <parona@protonmail.com>
 > +Date: Thu, 16 Nov 2023 21:26:42 +0000
 > +Subject: [PATCH] fix: add missing algorithm header include (#380)
 > +
 > +* https://gcc.gnu.org/gcc-14/porting_to.html
 > +
 > +Using gcc 14 uncovers a missing include in Message.h
 > +
 > +Signed-off-by: Alfred Wingate <parona@protonmail.com>
 > +---
 > + include/sdbus-c++/Message.h | 1 +
 > + 1 file changed, 1 insertion(+)
 > +
 > +diff --git a/include/sdbus-c++/Message.h b/include/sdbus-c++/Message.h
 > +index 915a071..9c85c01 100644
 > +--- a/include/sdbus-c++/Message.h
 > ++++ b/include/sdbus-c++/Message.h
 > +@@ -42,6 +42,7 @@
 > + #include <cassert>
 > + #include <functional>
 > + #include <sys/types.h>
 > ++#include <algorithm>
 > + 
 > + // Forward declarations
 > + namespace sdbus {
 > +-- 
 > +2.48.1
 > +
 > -- 

 > 2.48.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
