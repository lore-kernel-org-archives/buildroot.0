Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D075E8305A;
	Thu, 23 Dec 2021 17:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBj4mxbIkHsz; Thu, 23 Dec 2021 17:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B1582FA5;
	Thu, 23 Dec 2021 17:37:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACE91BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A7D882F84
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnlO6ik4J7MJ for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:37:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3524C825C7
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:37:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E037C60006;
 Thu, 23 Dec 2021 17:37:19 +0000 (UTC)
Date: Thu, 23 Dec 2021 18:37:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211223183718.5d9f4265@windsurf>
In-Reply-To: <20211222174246.26822-1-peter@korsgaard.com>
References: <20211222174246.26822-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] pakage/apache: security bump to version
 2.4.52
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Dec 2021 18:42:45 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
>   *) SECURITY: CVE-2021-44790: Possible buffer overflow when parsing
>      multipart content in mod_lua of Apache HTTP Server 2.4.51 and
>      earlier (cve.mitre.org)
>      A carefully crafted request body can cause a buffer overflow in
>      the mod_lua multipart parser (r:parsebody() called from Lua
>      scripts).
>      The Apache httpd team is not aware of an exploit for the
>      vulnerabilty though it might be possible to craft one.
>      This issue affects Apache HTTP Server 2.4.51 and earlier.
>      Credits: Chamal
> 
>   *) SECURITY: CVE-2021-44224: Possible NULL dereference or SSRF in
>      forward proxy configurations in Apache HTTP Server 2.4.51 and
>      earlier (cve.mitre.org)
>      A crafted URI sent to httpd configured as a forward proxy
>      (ProxyRequests on) can cause a crash (NULL pointer dereference)
>      or, for configurations mixing forward and reverse proxy
>      declarations, can allow for requests to be directed to a
>      declared Unix Domain Socket endpoint (Server Side Request
>      Forgery).
>      This issue affects Apache HTTP Server 2.4.7 up to 2.4.51
>      (included).
> 
> For more details, see the changes file:
> https://downloads.apache.org/httpd/CHANGES_2.4.52
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
