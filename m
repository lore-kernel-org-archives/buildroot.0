From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 17:07:32 +0100
Subject: [Buildroot] [PATCH v2] python-webpy: add new package
In-Reply-To: <1415752024-9089-1-git-send-email-yegorslists@googlemail.com>
 (Yegor Yefremov's message of "Wed, 12 Nov 2014 01:27:04 +0100")
References: <1415752024-9089-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87zjbpbykb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes:
 > 	v2: add license information

 >  package/Config.in                    |  1 +
 >  package/python-webpy/Config.in       |  8 ++++++++
 >  package/python-webpy/python-webpy.mk | 13 +++++++++++++
 >  3 files changed, 22 insertions(+)
 >  create mode 100644 package/python-webpy/Config.in
 >  create mode 100644 package/python-webpy/python-webpy.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 28cf703..949c7b6 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -523,6 +523,7 @@ menu "external python modules"
 >  	source "package/python-tornado/Config.in"
 >  	source "package/python-urwid/Config.in"
 >  	source "package/python-versiontools/Config.in"
 > +	source "package/python-webpy/Config.in"
 >  endmenu
 >  endif
 >  	source "package/ruby/Config.in"
 > diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
 > new file mode 100644
 > index 0000000..af27888
 > --- /dev/null
 > +++ b/package/python-webpy/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_PYTHON_WEBPY
 > +	bool "python-webpy"
 > +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

All the python modules are inside such a conditional, so it is only
needed here for packages that E.G. only work with python2.

Otherwise it looks good - Committed to next, thanks.

-- 
Bye, Peter Korsgaard
