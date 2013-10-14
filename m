From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 18:38:29 +0200
Subject: [Buildroot] [PATCH] snmppp: new package
In-Reply-To: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131014183829.04cc4de4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Oct 2013 10:47:15 -0300, Gustavo Zacarias wrote:

> +SNMPPP_VERSION = 3.3.0
> +SNMPPP_SOURCE = snmp++v$(SNMPPP_VERSION).tar.gz
> +SNMPPP_SITE = http://www.agentpp.com
> +SNMPPP_DEPENDENCIES = openssl host-pkgconf
> +SNMPPP_INSTALL_STAGING = YES
> +SNMPPP_AUTORECONF = YES

Looks good. Could you just add a comment above this autoreconf line to
explain why it's needed: we have a tarball release, no patches, so we
don't really expect to need autoreconf here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
