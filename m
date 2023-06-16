Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CEEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B005D60F64;
	Fri, 16 Jun 2023 08:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B005D60F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3YKe2LXljp6; Fri, 16 Jun 2023 08:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE3A60F4C;
	Fri, 16 Jun 2023 08:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE3A60F4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B31281BF5E6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEB840472
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BEB840472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBv2U1oEPoJ0 for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:28:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D72B4023D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D72B4023D
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:28:57 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF83FF802;
 Fri, 16 Jun 2023 08:28:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qA4pA-00FF1D-SS; Fri, 16 Jun 2023 10:28:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230616060421.3606283-1-peter@korsgaard.com>
Date: Fri, 16 Jun 2023 10:28:52 +0200
In-Reply-To: <20230616060421.3606283-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Jun 2023 08:04:19 +0200")
Message-ID: <87ilbnlsjf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-docker: needs
 python-packaging after bump to 6.0.1
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
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit d680db0ba77dab (package/python-docker: bump to version 6.0.1) forgot
 > to add the new dependency on python-packaging, leading to runtime errors:

 >   import docker
 >     File "/usr/lib/python3.11/site-packages/docker/__init__.py", line 2, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/api/__init__.py", line 2, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/api/client.py", line 10, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/auth.py", line 7, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/utils/__init__.py", line 3, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/utils/decorators.py", line 4, in <module>
 >     File "/usr/lib/python3.11/site-packages/docker/utils/utils.py", line 9, in <module>
 >   ModuleNotFoundError: No module named 'packaging'

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
