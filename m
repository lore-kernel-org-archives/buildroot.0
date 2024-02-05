Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1589C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BBDB40135;
	Mon,  5 Feb 2024 17:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BBDB40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JxIB2w1DdBv; Mon,  5 Feb 2024 17:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656FE40162;
	Mon,  5 Feb 2024 17:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 656FE40162
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3A01BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 321D160EA1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321D160EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HCS90nm46se for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:40:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E66960E96
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E66960E96
Received: by mail.gandi.net (Postfix) with ESMTPSA id F402960002;
 Mon,  5 Feb 2024 17:40:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX2xV-00CuKk-1T;
 Mon, 05 Feb 2024 18:40:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240109045635.3951040-1-james.hilliard1@gmail.com>
 <db063503-1757-4d25-8abb-20c43d968a9a@bubu1.eu>
Date: Mon, 05 Feb 2024 18:40:41 +0100
In-Reply-To: <db063503-1757-4d25-8abb-20c43d968a9a@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 9 Jan 2024 18:49:24 +0100")
Message-ID: <87ttmmrequ.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-can: bump to version
 4.3.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Hi James,
 > On 09.01.24 05:56, James Hilliard wrote:
 >> Drop no longer used python-aenum runtime dependency.
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> ---
 >> package/python-can/Config.in       | 1 -
 >> package/python-can/python-can.hash | 4 ++--
 >> package/python-can/python-can.mk   | 4 ++--
 >> 3 files changed, 4 insertions(+), 5 deletions(-)
 >> diff --git a/package/python-can/Config.in
 >> b/package/python-can/Config.in
 >> index 68a9ffca71..27dc16fa33 100644
 >> --- a/package/python-can/Config.in
 >> +++ b/package/python-can/Config.in
 >> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
 >> bool "python-can"
 >> select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

 > setuptools is no longer required as well:

 > https://github.com/hardbyte/python-can/commit/1a3f5e3769aa565ada8c27177a94f7db43d019dc

Committed after dropping the setuptools dependency, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
