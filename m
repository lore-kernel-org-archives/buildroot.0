Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CC3C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D08D418F6;
	Fri, 22 Mar 2024 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksTKW2LZBSZI; Fri, 22 Mar 2024 19:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46703418F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46703418F7;
	Fri, 22 Mar 2024 19:57:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33FE91BF977
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2176140609
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcENXf4HHTJk for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 19:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDB83405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB83405FD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDB83405FD
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 19:57:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0CC7240005;
 Fri, 22 Mar 2024 19:57:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnl1M-006ElN-0P;
 Fri, 22 Mar 2024 20:57:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317094037.41936-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Mar 2024 20:57:44 +0100
In-Reply-To: <20240317094037.41936-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 10:40:37 +0100")
Message-ID: <87a5mq2g5j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: needs C++17
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

 > poco needs C++17 and gcc >=8 since bump to version 1.13.2 in commit
 > 433c4fd38b15efcf74b410e5068e2e51eeba6e46 and
 > https://github.com/pocoproject/poco/commit/78234857bf416b718455496800d1b7be3a0d0a53
 > https://github.com/pocoproject/poco/commit/10f41c06d9416a6ae0884c4827ea2a91bf5d2cf8
 > resulting in the following build failure with gcc 7:

 > In file included from src/Thread.cpp:28:0:
 > src/Thread_POSIX.cpp: In member function 'void Poco::ThreadImpl::setNameImpl(const string&)':
 > src/Thread_POSIX.cpp:162:56: error: no matching function for call to 'std::__cxx11::basic_string<char>::append(const string&, std::__cxx11::basic_string<char>::size_type)'
 >    truncName.append(threadName, threadName.size() - half);
 >                                                         ^

 > Fixes: 433c4fd38b15efcf74b410e5068e2e51eeba6e46
 >  - http://autobuild.buildroot.org/results/7b1c144f39a8be4ce8f964aa13a52d0bf62dd0aa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
