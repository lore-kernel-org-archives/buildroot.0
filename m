Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CF5C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE978355F;
	Sat,  8 Jun 2024 13:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiKedVyZVR5B; Sat,  8 Jun 2024 13:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEC283613
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CEC283613;
	Sat,  8 Jun 2024 13:40:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 923E41BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB0C40242
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uv2JnqHIv2nH for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36463400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36463400D8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36463400D8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:40:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67455240004;
 Sat,  8 Jun 2024 13:40:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFwJ1-001nA9-0I;
 Sat, 08 Jun 2024 15:40:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240517171258.783129-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 15:40:27 +0200
In-Reply-To: <20240517171258.783129-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 17 May 2024 19:12:58 +0200")
Message-ID: <87jziz4kok.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: fix python build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following python build failure:
 > In file included from /home/buildroot/instance-0/output-1/host/include/python3.11/Python.h:38,
 >                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
 >                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
 >                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
 >                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
 >                  from /home/buildroot/instance-0/output-1/build/gr-osmosdr-0.2.4/python/bindings/device_python.cc:1:
 > /home/buildroot/instance-0/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
 >   596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
 >       |  ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f009958c37902a224512b336fcb431903bdd0b96

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
