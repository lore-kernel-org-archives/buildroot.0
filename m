From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 08:55:40 +0200
Subject: [Buildroot] [PATCH 1/3] lsof: fix permission of extracted files
In-Reply-To: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
References: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
Message-ID: <20111021085540.666a392d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Oct 2011 00:05:23 +0200,
Damian Kaczmarek <damian@veritymedical.co.uk> a ?crit :

> +LSOF_EXTRACT_CMDS = \
> +        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
> +                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
> +        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -

I would prefer:

define LSOF_EXTRACT_CMDS
        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
endef

since this is what we use for all other pkg_something_CMDS.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
