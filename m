Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9272BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2496E60FF3;
	Wed, 26 Jan 2022 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rR7dvawNt88b; Wed, 26 Jan 2022 22:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63ECF60FF6;
	Wed, 26 Jan 2022 22:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 250F31BF4D6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13BC7417D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HltA5XoY1-7t for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:00:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05BFC41717
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:00:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B97EAE0004;
 Wed, 26 Jan 2022 22:00:25 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:00:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220126230025.67670779@windsurf>
In-Reply-To: <20220124111725.544497-1-james.hilliard1@gmail.com>
References: <20220124111725.544497-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version
 6.0
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jan 2022 04:17:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop python2 support and propagate dependency changes.
> 
> Ensure optimized cython build is enabled and add host cython
> dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libcamera/libcamera.mk             |  2 +-
>  package/mongodb/mongodb.mk                 |  2 +-
>  package/python-pyyaml/Config.in            |  1 +
>  package/python-pyyaml/python-pyyaml.hash   |  4 ++--
>  package/python-pyyaml/python-pyyaml.mk     |  9 +++++----
>  package/python3-pyyaml/python3-pyyaml.hash |  1 -
>  package/python3-pyyaml/python3-pyyaml.mk   | 20 --------------------
>  7 files changed, 10 insertions(+), 29 deletions(-)
>  delete mode 120000 package/python3-pyyaml/python3-pyyaml.hash
>  delete mode 100644 package/python3-pyyaml/python3-pyyaml.mk

Applied to master, thanks. I was surprised by the usage of
host-python-pyyaml by host-sdbusplus. Indeed, host-sdbusplus depends on
host-python3 and host-python-pyyaml, the latter being (before your
patch) forcefully build for Python 2.x.

So of the 3 Python modules that host-sdbusplus needs (inflection, mako,
pyyaml), inflection and mako were installed for the host Python 3.x
interpreter, and host-python-pyyaml for the host Python 2.x
interpreter. And the host-sdbusplus build, even though it depended on
host-python3, was in fact using host Python 2.x... which raises a
question on the actual need of host-python-inflection and
host-python-mako... as they are not actually needed during the build:
the build succeeds when host-sdbusplus uses host Python 2.x, while mako
and inflection are installed for host Python 3.x.

It seems like they are only used at runtime ? But that also wouldn't
work.

Anyway, now with host-python-pyyaml being python3 only, this kind of
solves the problem. But perhaps host-sdbusplus should be explicitly
told to use $(HOST_DIR)/bin/python3, because if $(HOST_DIR)/bin/python2
is here, it will use it, and it won't have access to pyyaml.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
