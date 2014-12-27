From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 11:28:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/lftp: don't use host's path
In-Reply-To: <549DD815.8080003@openwide.fr>
References: <1419614983-8105-1-git-send-email-romain.naour@openwide.fr>
 <20141226201143.143896ff@free-electrons.com>
 <549DD815.8080003@openwide.fr>
Message-ID: <20141227112841.07a2db0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 26 Dec 2014 22:50:13 +0100, Romain Naour wrote:

> At first sight, one solution is to set $(DESTDIR) to $(STAGING_DIR)
> 
> proto_ftp_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
> proto_http_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
> proto_fish_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
> proto_sftp_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
> cmd_torrent_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
> 
> But I think we can remove -L$(DESTDIR)$(pkgverlibdir) since it doesn't seem to be useful.
> The build succeed (without paranoid toolchain) even with /usr/lib/lftp/4.5.5 or
> $(STAGING_DIR)/usr/lib/lftp/4.5.5 which both doesn't exist.

Yes, I think those -L are not needed: by the time it gets built/linked,
no libraries are installed in this location.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
