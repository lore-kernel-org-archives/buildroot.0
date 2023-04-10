Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6364C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49747613F5;
	Mon, 10 Apr 2023 19:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49747613F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAI_14bmyaZ7; Mon, 10 Apr 2023 19:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 928AA613DC;
	Mon, 10 Apr 2023 19:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928AA613DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 950FB1BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF9840C96
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF9840C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB-VGq_Zagjw for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:29:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7370B40376
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7370B40376
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:29:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6608D60004;
 Mon, 10 Apr 2023 19:29:13 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plxCS-0039xQ-Al; Mon, 10 Apr 2023 21:29:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230320073419.707352-1-fontaine.fabrice@gmail.com>
Date: Mon, 10 Apr 2023 21:29:12 +0200
In-Reply-To: <20230320073419.707352-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Mar 2023 08:34:19 +0100")
Message-ID: <877cujv8mv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: security bump to
 version 4.6.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fixed (security) [APP-70]: Memory leak in MibLeaf::set if same OID is set
 >   twice in the same PDU.
 > - Fix the following build failure raised since bump of snmppp to version
 >   3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

 > snmp_pp_ext.cpp: In member function 'int Agentpp::Snmpx::send(const Agentpp::Pdux&, Snmp_pp::SnmpTarget*)':
 > snmp_pp_ext.cpp:1172:47: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
 >  1172 |     status = snmpmsg.loadv3(Snmp::get_mpv3(), pdu, engine_id, security_name,
 >       |

 > Fixes:
 >  - http://autobuild.buildroot.net/results/d7347b8b3953596b66da6ca6d85f084fb427934c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
