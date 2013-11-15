From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 09:18:33 +0100
Subject: [Buildroot] [PATCH 4/5] package/uClibc: ensure .oldconfig is
 writable
In-Reply-To: <9f08675878a925c9850b26ced36ed5e1edf53c9b.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
 <9f08675878a925c9850b26ced36ed5e1edf53c9b.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <20131115091833.4b685ebe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 14 Nov 2013 19:46:58 +0100, Yann E. MORIN wrote:

> source dir is), the sed fixups to .oldconfig fail.

You mention .oldconfig here (and in the commit title)

> -	cp -f $(UCLIBC_CONFIG_FILE) $(@D)/.config
> +	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config

but it's actually .config that is taken care of :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
