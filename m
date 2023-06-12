Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA658C88CB4
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6018384205;
	Mon, 12 Jun 2023 15:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6018384205
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKqseu44wGF0; Mon, 12 Jun 2023 15:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D97D83A8A;
	Mon, 12 Jun 2023 15:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D97D83A8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8B921BF398
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F964169B
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90F964169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wluE8oEK2Xnj for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:52:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5D8415E7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B5D8415E7
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 15:52:18 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E24FEFF805;
 Mon, 12 Jun 2023 15:52:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q8jq2-003VRf-Vn; Mon, 12 Jun 2023 17:52:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>, yann.morin.1998@free.fr
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-3-aduskett@gmail.com>
Date: Mon, 12 Jun 2023 17:52:14 +0200
In-Reply-To: <20230425171454.48802-3-aduskett@gmail.com> (Adam Duskett's
 message of "Tue, 25 Apr 2023 10:14:43 -0700")
Message-ID: <87pm60znip.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 02/13] package/python-pip: add host
 variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > In the following patch that updates libselinux, the libselinux python tools now
 > require pip to install.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Somewhat related, is there any way we can ensure that this pip is only
used for the installation logic (which is fine if a bit odd) and NOT to pull in extra python
dependencies (which is naturally NOT OK)?


> ---
 >  package/python-pip/python-pip.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
 > index 8cf3aaa3ec..35ad7bede2 100644
 > --- a/package/python-pip/python-pip.mk
 > +++ b/package/python-pip/python-pip.mk
 > @@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
 >  PYTHON_PIP_CPE_ID_PRODUCT = pip
 
 >  $(eval $(python-package))
 > +$(eval $(host-python-package))
 > -- 

 > 2.40.0

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
