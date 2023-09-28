Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C11CE7B11
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 09:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F94442255;
	Thu, 28 Sep 2023 09:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F94442255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odyhfIK3A8Iz; Thu, 28 Sep 2023 09:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A62142276;
	Thu, 28 Sep 2023 09:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A62142276
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEA91BF2BD
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C4842276
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C4842276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gPo_7LPf-W6 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 09:25:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21D8842557
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 09:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D8842557
Received: by mail.gandi.net (Postfix) with ESMTPSA id 391971BF209;
 Thu, 28 Sep 2023 09:25:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qlnGj-005b7r-Un; Thu, 28 Sep 2023 11:25:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230927200708.491826-1-fontaine.fabrice@gmail.com>
 <20230927200708.491826-2-fontaine.fabrice@gmail.com>
Date: Thu, 28 Sep 2023 11:25:13 +0200
In-Reply-To: <20230927200708.491826-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Sep 2023 22:07:08 +0200")
Message-ID: <87cyy2y7ie.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/suricata: security bump to
 version 6.0.14
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
 >  .checkpackageignore                           |  3 +-
 >  ...ure-proper-shabang-on-python-scripts.patch | 47 -------------------
 >  ...low-the-user-to-override-RUST_TARGET.patch | 35 --------------
 >  package/suricata/suricata.hash                |  2 +-
 >  package/suricata/suricata.mk                  |  5 +-
 >  5 files changed, 4 insertions(+), 88 deletions(-)
 >  delete mode 100644 package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
 >  delete mode 100644 package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch

Hmm, did you mean to rename patch 0002 rather than delete it?

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index b41ab6918e..61de4d79a1 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -1360,8 +1360,7 @@ package/statserial/0001-ncurses-link.patch Upstream
 >  package/stunnel/S50stunnel Indent Shellcheck Variables
 >  package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 >  package/supervisor/S99supervisord Variables
 > -package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch Upstream
 > -package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
 > +package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
