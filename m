Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2B0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 13:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09A241749;
	Mon, 23 May 2022 13:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EM8D-Kw12f9o; Mon, 23 May 2022 13:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF392416CE;
	Mon, 23 May 2022 13:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03B561BF2F0
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDCAD416CE
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 13:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LV731mYc5bQf for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 13:19:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90915416C9
 for <buildroot@buildroot.org>; Mon, 23 May 2022 13:19:48 +0000 (UTC)
Received: from [77.244.183.192] (port=63486 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nt7yL-00006f-Sr; Mon, 23 May 2022 15:19:45 +0200
Message-ID: <e828792d-8371-7fe1-bdd1-b7f729fa7097@lucaceresoli.net>
Date: Mon, 23 May 2022 15:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] package/qpid-proton: needs C++ and
 threads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

first, thanks for addressing this! It's been on my todo list for a long
time but never got the time do look into that.

On 21/05/22 22:43, Fabrice Fontaine wrote:
> qpid-proton needs C++ (and so threads due to proactor) to avoid the
> following build failure:
> 
> CMake Error at /nvmedata/autobuild/instance-3/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>   The C++ compiler
> 
>     "/usr/bin/c++"
> 
>   is not able to compile a simple test program.
> 
> C++ check can't easily be removed:
> https://github.com/apache/qpid-proton/pull/366
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/76f8deccc9c4eee29eddf42586cc28e96eec0827
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

If upstream does not provide _working_ support for building without C++,
then I would not spend much time in trying to do so.

My only question is whether you tried to upgrade to the latest version
and see whether non-C++ builds are supported there. I hope this would be
a quick test. If you did that and still non-C++ builds fail:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
