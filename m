Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F09EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:32:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A1160FBF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6A1160FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C4B740639;
	Sat, 13 Nov 2021 09:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpS7-txgWhD0; Sat, 13 Nov 2021 09:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652F640636;
	Sat, 13 Nov 2021 09:32:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD5651BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA6A860769
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5DkfjsGTt-O for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5185360723
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:32:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 54BDA19F4F3;
 Sat, 13 Nov 2021 10:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636795962;
 bh=l4IGBUIz4mAFQqj6bmheLKnIO4nkXGd/eJfA/96/EFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DlXKJ6iUmeeUaMctwBsbCiVUcilWrUJ9S7J/gvPjgGR6JnJSnrPgMRC3D2HoPTz3I
 rXrJw9hphlGjUPc3wgnoFeSbKROsHl+RZLnWcutYe/i7xMhy8lKrEQLG/R7eTdwFqt
 xA5ef00m3NhM27OdQ++8AOXKvTFaOop4+rBkr+qz7621CT4MRZ/KuO7+qOuwAPZ5F9
 YtC86aIsTp3wEpcDzVifgKYQNcgKaUNoHecoSgM3a0raKsXBtIR157LgSLuV40O5Xo
 dB8pVYAngRgXh9DagBumT52zUo4Lxjb7wzqIaYaVPkPstJG+SExOopEXHn3HNOfe8M
 MtEjgwQhiTHxQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 10:32:37 +0100
Date: Sat, 13 Nov 2021 10:32:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211113093237.GN247986@scaer>
References: <20211113083557.17685-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113083557.17685-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mongodb: fix build with glibc
 >= 2.34
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

Fabrice, All,

On 2021-11-13 09:35 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with glibc >= 2.34:
> 
> In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/signal.h:328,
>                  from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/include/c++/11.2.0/csignal:42,
>                  from src/mongo/stdx/thread.h:33,
>                  from src/mongo/db/client.h:46,
>                  from src/mongo/db/operation_context.h:36,
>                  from src/mongo/db/pipeline/variables.h:32,
>                  from src/mongo/db/pipeline/dependencies.h:37,
>                  from src/mongo/db/matcher/expression.h:38,
>                  from src/mongo/db/matcher/expression_parser.h:34,
>                  from src/mongo/db/pipeline/document_source_list_sessions.cpp:34:
> src/mongo/stdx/thread.h:107:56: error: call to non-'constexpr' function 'long int sysconf(int)'
>   107 |         std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
>       |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6be8efb96547f8ec6e9b776abae8c1b51501e9ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
> 
> diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
> new file mode 100644
> index 0000000000..02b35c6e4f
> --- /dev/null
> +++ b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
> @@ -0,0 +1,49 @@
> +From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
> +From: Andrew Morrow <acm@mongodb.com>
> +Date: Wed, 15 Sep 2021 15:23:42 -0400
> +Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
> + constant
> +
> +[Retrieved (and backported) from:
> +https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/mongo/stdx/thread.h | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
> +index 7b15bb561bd9..6f1e16cdeb36 100644
> +--- a/src/mongo/stdx/thread.h
> ++++ b/src/mongo/stdx/thread.h
> +@@ -76,11 +76,19 @@ class SigAltStackController {
> +     }
> + 
> + private:
> ++    static size_t _getStackSize() {
> ++        // It would be nice for this to be a constexpr, but
> ++        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
> ++        // 2.34.
> ++        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
> ++        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
> ++    }
> ++
> +     void _install() const {
> +         stack_t ss;
> +         ss.ss_sp = _stackStorage.get();
> +         ss.ss_flags = 0;
> +-        ss.ss_size = kStackSize;
> ++        ss.ss_size = _getStackSize();
> +         if (sigaltstack(&ss, nullptr)) {
> +             abort();
> +         }
> +@@ -107,9 +115,7 @@ class SigAltStackController {
> +     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
> +     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
> + 
> +-    static constexpr std::size_t kStackSize =
> +-        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
> +-    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
> ++    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
> + 
> + #else   // !MONGO_HAS_SIGALTSTACK
> +     auto makeInstallGuard() const {
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
