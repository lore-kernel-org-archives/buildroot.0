From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 16:07:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <19162136.post@talk.nabble.com>
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk>
	<19162136.post@talk.nabble.com>
Message-ID: <20080826140744.GO2213@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 06:32:13AM -0700, Daniel Laird wrote:
>
>I will amend the Config.in to do as suggested:
>Config.in
>select CUPS if ......
>
>and
>
>libgtk2.mk
>ifeq ($(BR2_PACKAGE_CUPS),y)
>	LIBGTK2_DEPENDENCIES_EXTRA = cups
>endif

LIBGTK2_DEPENDENCIES_EXTRA += $(if $(BR2_PACKAGE_CUPS),cups)

>
>However this does raise the wider issue of what should be auto selected and
>what should be chosen
>IMHO I feel CUPS is not a necessary thing for GTK??
>Therefore why is it being autoselected for X builds.
>If someone wants cups then they should select it in their configuration
>file.
>Packages that compile differently due to the selection of another package
>could use something like:
>
>ifeq ($(BR2_PACKAGE_CUPS),y)
>	........ (--enable-cups) or whatever
>endif
>
>This I think is far better than someone building X and GTK and finding their
>build fails because of cups.  If they want it they should enable it.

Exactly. selecting cruft behind the scenes is almost always the wrong
thing to do.
We did not do this until recently, when e.g. Ulf started to add
gazillions of (imho unwarranted) select's.
