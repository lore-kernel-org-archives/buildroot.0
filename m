From: Andreas Hilse <andreas.hilse@ipcomm.de>
Date: Mon, 10 Aug 2020 18:47:32 +0200 (CEST)
Subject: [Buildroot] sysklogd 1.6: messages from klogd are logged to
 user facility
In-Reply-To: <20200810163629.2157d61e@windsurf.home>
References: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>	<20200805225153.7e4bb864@windsurf.home>	<008501d66bd6$7ac48080$704d8180$@ipcomm.de>	<006a01d66ef1$b5af8140$210e83c0$@ipcomm.de>
 <20200810163629.2157d61e@windsurf.home>
Message-ID: <00ee01d66f35$f1363620$d3a2a260$@ipcomm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> BUSYBOX_DEPENDENCIES = \
> 	...
>         $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
> 
> This way Busybox is installed *after* sysklogd, and Busybox installation
> process is careful enough to not overwrite already installed binaries.

> However, klogd being removed from sysklogd, I'm not sure how this will
> end up working: it is possible that Busybox will install its own klogd
> symlink anyway.

It does install its own klogd symlink, but its S02klogd script does not
get installed because BR2_PACKAGE_SYSKLOGD is selected, so it won't be
started.
I just checked: the same goes for rsyslog (busybox klogd link gets
installed). So it should be okay for sysklogd, too?


> What have you made selectable ?
The sysklogd logger utility; configure has an option:
  --without-logger        Build without extended logger tool, default:
enabled

In case of the logger utility both busybox link (/usr/bin/logger) and
sysklogd binary (/bin/logger) get installed.

Best regards
Andreas
