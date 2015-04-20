From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:56:28 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <553564B4.2060303@mind.be>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
 <5533D5CF.5000305@mind.be> <20150419162839.GI4313@free.fr>
 <20150419190321.19200e70@free-electrons.com>
 <553564B4.2060303@mind.be>
Message-ID: <20150420225628.0a54561f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 20 Apr 2015 22:42:28 +0200, Arnout Vandecappelle wrote:

>  However, we can add the dependency specifically for linux-backports. There is
> something to be said for the reasoning that usually/sometimes you don't need the
> dependencies to be present, so doing it per package sounds OK.
> 
>  So in this case, adding
> 
> $(LINUX_BACKPORTS_KCONFIG_FILE): linux
> 
> to linux-backports.mk should be sufficient.

If we do this, we must also keep the 'linux' dependency in
LINUX_BACKPORTS_DEPENDENCIES as well, so that the package infra remains
aware of this dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
