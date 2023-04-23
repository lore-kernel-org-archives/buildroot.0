Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB89EC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 17:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 446DA405B8;
	Sun, 23 Apr 2023 17:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 446DA405B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IrgF-EEJJrd; Sun, 23 Apr 2023 17:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50E02405A1;
	Sun, 23 Apr 2023 17:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E02405A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6C4F1C2B1F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD0E817EB
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD0E817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikj2LhxRS8Sl for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 17:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1E58175D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1E58175D
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 17:30:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:786a:5f81:2188:6ed4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C3A686013B;
 Sun, 23 Apr 2023 19:30:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 19:30:31 +0200
Date: Sun, 23 Apr 2023 19:30:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Johnson <dave-git@centerclick.org>
Message-ID: <20230423173031.GM2696@scaer>
References: <20230420211226.3844651-1-dave-git@centerclick.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420211226.3844651-1-dave-git@centerclick.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682271033;
 bh=vH4PZiYD+6P/mmSPdtdn9m8/Kby66nrBzu5dvw7YHIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjUmFDyRzSALaMcQ+d3UR2XA5PWocD91Pwq33JoIWhGnKv3uYBh6CF7hCPse/vjI6
 85Xwd4NmF01ziYN2i4cruMp4ri3KN8RvLwh8M2dyB4iGE0zj1SitmuYDW4V/hcVrrA
 i9VHlDhPBRGgtzCUPeRn1u+ZdMNB64BYMzrCnDRTrgAskPG7z5MkONP7J8d9x77XO1
 T24lntlKkk/bhWh2T93xL8/DoOSuk+GWQ4uZ/AbbudoP40zGT3G40OJ/BLsnTJBktq
 dC2BvQONRot7Aj0mLzYXSk38W8iSq9+BNKQ+EnHCB2YQV6VbDcd6wgl1k26kxRTeZh
 ZUmjyShh8MAKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NjUmFDyR
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add snmp user and
 systemd service file
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

David, All,

On 2023-04-20 17:12 -0400, David Johnson via buildroot spake thusly:
> * Add a snmp user so snmpd doesn't run as root
> * Add a snmp systemd file as only an sysv was previously included

Those are two semantically different changes, and thus should be done in
two patches, the first to indeed add a user/group, the second to add
systemd support (and see below).

> Signed-off-by: David Johnson <dave-git@centerclick.org>
> ---
[--SNIP--]
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 15bc318e36..8cb7862bbf 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -41,6 +41,14 @@ NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true instal
>  NETSNMP_MAKE = $(MAKE1)
>  NETSNMP_CONFIG_SCRIPTS = net-snmp-config
>  
> +define NETSNMP_USERS
> +	snmp -1 snmp -1 * - - - snmpd user
> +endef
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +NETSNMP_CONF_OPTS += --with-systemd

We want to have explicit disabling option too, so:

    ifeq ($(BR2_INIT_SYSTEMD),y)
    NETSNMP_CONF_OPTS += --with-systemd
    else
    NETSNMP_CONF_OPTS += --without-systemd
    endif

[--SNIP--]
> diff --git a/package/netsnmp/snmpd.service b/package/netsnmp/snmpd.service
> new file mode 100644
> index 0000000000..6647b10c32
> --- /dev/null
> +++ b/package/netsnmp/snmpd.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=SNMP Daemon
> +After=network.target
> +ConditionPathExists=/etc/snmp/snmpd.conf
> +
> +[Service]
> +Type=simple
> +Environment=MIBDIRS=/usr/share/snmp/mibs
> +Environment=SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid -u snmp -g snmp 127.0.0.1'

So, I am not a systemd expert, but I would have expected the snmp socket
to be handled by systemd with a socket unit, and handed over to snmpd,
while the user/group would also be managed by systemd, with the
Service.User and Service.Group options, like I have seen it done for
gpsd for example: https://gitlab.com/gpsd/gpsd/-/tree/master/systemd

If that's not possible, then your proposed unit seems OK too.

Ah, I now read README.systemd, and they advise against socket activation
for snmpd, with some good rationale; just state so in the commit log.
For snmptrap, socket activation is properly supported (but it seems we
do not install it).

Also explain why we provide our own unit when there is already one
provided by upstream.

Regards,
Yann E. MORIN.

> +EnvironmentFile=-/etc/default/snmpd
> +PassEnvironment=MIBDIRS
> +ExecStart=/usr/sbin/snmpd -f $SNMPDOPTS
> +
> +[Install]
> +WantedBy=multi-user.target
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
