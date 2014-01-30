From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 21:54:21 +0100
Subject: [Buildroot] [RFC,
 PATCH 7/8] package/iprutils: Add IBM Power RAID utilities
In-Reply-To: <1389862338.919734.499084473099.7.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919734.499084473099.7.gpush@pablo>
Message-ID: <20140130215421.4e56ff90@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Thu, 16 Jan 2014 16:52:18 +0800, Jeremy Kerr wrote:

> +define IPRUTILS_INSTALL_TARGET_CMDS
> +        $(INSTALL) -d $(TARGET_DIR)/sbin
> +        $(INSTALL) -D --mode=755 $(@D)/iprconfig $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprupdate $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprdump $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprinit $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=700 $(@D)/iprdbg $(TARGET_DIR)/sbin/

We generally do:

	$(INSTALL) -D -m 0755 $(@D)/iprconfig $(TARGET_DIR)/sbin/iprconfig

this also avoids the need to create $(TARGET_DIR)/sbin in the first line.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
