Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDABE78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635958204E;
	Sun,  1 Oct 2023 18:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635958204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWWXW9AwJ9QU; Sun,  1 Oct 2023 18:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A7082052;
	Sun,  1 Oct 2023 18:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A7082052
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B151BF298
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3DF882053
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DF882053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a30Pk7r56386 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:28:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B17082052
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B17082052
Received: by mail.gandi.net (Postfix) with ESMTPSA id 264871C0003;
 Sun,  1 Oct 2023 18:28:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qn1B8-000J96-2I; Sun, 01 Oct 2023 20:28:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230928165126.336164-1-fontaine.fabrice@gmail.com>
Date: Sun, 01 Oct 2023 20:28:30 +0200
In-Reply-To: <20230928165126.336164-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Sep 2023 18:51:26 +0200")
Message-ID: <874jja9oz5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/suricata: security bump to version 6.0.14
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

 > - Fix CVE-2023-35852: In Suricata before 6.0.13 (when there is an
 >   adversary who controls an external source of rules), a dataset
 >   filename, that comes from a rule, may trigger absolute or relative
 >   directory traversal, and lead to write access to a local filesystem.
 >   This is addressed in 6.0.13 by requiring allow-absolute-filenames and
 >   allow-write (in the datasets rules configuration section) if an
 >   installation requires traversal/writing in this situation.
 > - Fix CVE-2023-35853: In Suricata before 6.0.13, an adversary who
 >   controls an external source of Lua rules may be able to execute Lua
 >   code. This is addressed in 6.0.13 by disabling Lua unless allow-rules
 >   is true in the security lua configuration section.
 > - Drop first patch (not needed since
 >   https://github.com/OISF/suricata/commit/c8a3aa608eaae1acbaf33dba8a7c1a3cbfeb4285)

 > https://github.com/OISF/suricata/blob/suricata-6.0.14/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard):
 >  - Do not wrongly delete second patch

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
