From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2009 19:03:54 +0100
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <4B2B7141.90804@free.fr>
References: <4B2B7141.90804@free.fr>
Message-ID: <20091218190354.5302ccfe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 18 Dec 2009 13:10:41 +0100,
Cyril HAENEL <chaenel@free.fr> a ?crit :

> ./potentiostatApplication >> /var/log/potentiostat

In the default Buildroot target skeleton, /var/log is a symbolic link
to /tmp, and /tmp is mounted as a tmpfs (the contents of the filesystem
are stored into memory).

So with the default Buildroot configuration, the contents of /var/log
(and many other /var directories) are lost when you reboot.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
