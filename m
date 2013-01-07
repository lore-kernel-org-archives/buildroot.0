From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 23:42:06 +0100
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <50EB4AE5.7070407@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130107231037.39a798cf@skate> <50EB4AE5.7070407@petroprogram.com>
Message-ID: <20130107234206.1487aa87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue, 08 Jan 2013 00:23:33 +0200, Stefan Fr?berg wrote:

> You mean checking first in if-statement if  $($(PKG)_CONFIG_FIXUP exist ?
> What is the best way to detect if it exist ?

Just test if the variable is not empty, i.e test -n.

Like (untested):

	if test -n $($(PKG)_CONFIG_FIXUP) ; then \
		$(call MESSAGE, "Blabla") ; \
		for file in ...
			...
		done
	fi

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
