Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9059DC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D39760B0A;
	Tue,  7 May 2024 16:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s76Mo4bKzMca; Tue,  7 May 2024 16:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE0760ADA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE0760ADA;
	Tue,  7 May 2024 16:00:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D214F1BF46A
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF39460ADA
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_lrpwog4mzK for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7ACF4608A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACF4608A4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ACF4608A4
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:00:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A890E000B;
 Tue,  7 May 2024 16:00:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4NEm-004hXn-0d;
 Tue, 07 May 2024 18:00:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <ZhlWuOI9ZJzGMh6i@landeda> <ZhlYatOD6uL7X6Hr@landeda>
 <f3d41702-e1e6-464f-b282-c8f0309b566d@smile.fr>
 <CAEyMn7aRqmhRvtvtCdNqkzhv4BjLr1O3=0xJmjL9JbDctfha7w@mail.gmail.com>
Date: Tue, 07 May 2024 18:00:16 +0200
In-Reply-To: <CAEyMn7aRqmhRvtvtCdNqkzhv4BjLr1O3=0xJmjL9JbDctfha7w@mail.gmail.com>
 (Heiko Thiery's message of "Sat, 13 Apr 2024 09:20:06 +0200")
Message-ID: <87v83pwr1r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 >> What if python-pathspec is not installed on the host?
 >> 
 >> make host-python-yamllint
 >> 
 >> ./ouput/host/bin/python ./support/testing/tests/package/sample_python_yamllint.py
 >> 
 >> ModuleNotFoundError: No module named 'pathspec'
 >> 
 >> We must add host-python-pathspec (and all other runtime dependencies) in build
 >> dependencies of host-python-yamllint

 > You are right .. I just retested this and can confirm. I will prepare
 > a patch. I also see that the PYTHON_YAMLLINT_SETUP_TYPE is not
 > correct. I had to use setuptools and not pep517.

Can you also send a patch to update DEVELOPERS with python-yamllint and
the test you added?

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
