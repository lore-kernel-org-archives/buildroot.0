From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 06:32:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <87k5e3gbne.fsf@macbook.be.48ers.dk>
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk>
Message-ID: <19162136.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I will amend the Config.in to do as suggested:
Config.in
select CUPS if ......

and

libgtk2.mk
ifeq ($(BR2_PACKAGE_CUPS),y)
	LIBGTK2_DEPENDENCIES_EXTRA = cups
endif

However this does raise the wider issue of what should be auto selected and
what should be chosen
IMHO I feel CUPS is not a necessary thing for GTK??
Therefore why is it being autoselected for X builds.
If someone wants cups then they should select it in their configuration
file.
Packages that compile differently due to the selection of another package
could use something like:

ifeq ($(BR2_PACKAGE_CUPS),y)
	........ (--enable-cups) or whatever
endif

This I think is far better than someone building X and GTK and finding their
build fails because of cups.  If they want it they should enable it.

Dan laird


-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-libgtk2-tp19160871p19162136.html
Sent from the BuildRoot mailing list archive at Nabble.com.
