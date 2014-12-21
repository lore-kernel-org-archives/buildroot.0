From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:03:35 +0100
Subject: [Buildroot] [PATCH] samba: Swap libnss_win*.so* files and
 symlinks
In-Reply-To: <1418570896-3302-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1418570896-3302-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20141221230335.48e42b89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 14 Dec 2014 16:28:16 +0100, Beno?t Th?baudeau wrote:
> The libnss_wins and libnss_winbind libraries were installed in this way:
> /lib/libnss_<service>.so
> /lib/libnss_<service>.so.<major> -> /lib/libnss_<service>.so
> 
> This had been done like this in order to get something similar to the
> other NSS libraries, which are usually installed in this way:
> /lib/libnss_<service>-<version>.so
> /lib/libnss_<service>.so.<major> -> /lib/libnss_<service>-<version>.so
> 
> However, besides these files, these other NSS libraries usually come
> installed with:
> /usr/lib/libnss_<service>.so -> /lib/libnss_<service>.so.<major>
> 
> This means that the NSS libraries follow the usual library installation
> practice, i.e. that the non-versioned .so is a symlink to the versioned
> .so, so that switching versions is easy. In the case of the NSS
> libraries, the versioned .so is just also a symlink to a .so with a more
> accurate version.
> 
> Hence, follow the same rules for libnss_win*.so*, and install these
> libraries the other way around:
> /lib/libnss_<service>.so -> /lib/libnss_<service>.so.<major>
> /lib/libnss_<service>.so.<major>
> 
> This is also how these libraries are installed by a major OS like Ubuntu
> 14.10:
> /lib/x86_64-linux-gnu/libnss_winbind.so -> libnss_winbind.so.2
> /lib/x86_64-linux-gnu/libnss_winbind.so.2
> /lib/x86_64-linux-gnu/libnss_wins.so -> libnss_wins.so.2
> /lib/x86_64-linux-gnu/libnss_wins.so.2
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
