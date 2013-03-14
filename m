From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Mar 2013 19:42:47 +0100
Subject: [Buildroot] question about my pevious dhcpcd patch
In-Reply-To: <1363199449.8204.157.camel@genx.eng.msli.com>
References: <1363199449.8204.157.camel@genx.eng.msli.com>
Message-ID: <20130314194247.6ce999a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Wed, 13 Mar 2013 11:30:49 -0700, John Stile wrote:

> First issue: I discovered I also need to copy a script directory, but
> don't see a good method to copy more than each file one at a time.  
> 
> Is there a good way to copy all files in dhcpcd-hooks except the
> Makefile, into $(TARGET_DIR)/libexec/dhcpcd-hooks?
> 
> Right now I'm doing it one at a time like this:
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/01-test \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/01-test
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/02-dump \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/02-dump
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/20-resolv.conf \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/20-resolv.conf
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/29-lookup-hostname \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/29-lookup-hostname
>   ...etc...

You should probably use $(MAKE) -C $(@D) install in order to use the
integrated installation procedure of dhcpcd Makefile.

> Second issue:  how do I submit an updated patch?  The first one was
> submitted a few days ago.  Do i just do a fresh clone, and then try to
> add my stuff and submit via send-email, and pretend the first patch was
> never sent?

Since your patch has not yet been merged, you should resent an updated
version.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
