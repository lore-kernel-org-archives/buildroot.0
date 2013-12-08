From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 22:17:38 +0100
Subject: [Buildroot] [PATCH] python-dialog: add new package
In-Reply-To: <1386234481-21183-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 5 Dec 2013 10:08:01
 +0100")
References: <1386234481-21183-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87mwkb9h59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/Config.in                      |    1 +
 >  package/python-dialog/Config.in        |    9 +++++++++
 >  package/python-dialog/python-dialog.mk |   23 +++++++++++++++++++++++
 >  3 files changed, 33 insertions(+), 0 deletions(-)
 >  create mode 100644 package/python-dialog/Config.in
 >  create mode 100644 package/python-dialog/python-dialog.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index cffd3fb..c84421c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -387,6 +387,7 @@ if BR2_PACKAGE_PYTHON
 >  menu "external python modules"
 >  source "package/python-bottle/Config.in"
 >  source "package/python-crc16/Config.in"
 > +source "package/python-dialog/Config.in"
 >  source "package/python-dpkt/Config.in"
 >  source "package/python-id3/Config.in"
 >  source "package/python-ipy/Config.in"
 > diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
 > new file mode 100644
 > index 0000000..fda2ff5
 > --- /dev/null
 > +++ b/package/python-dialog/Config.in
 > @@ -0,0 +1,9 @@
 > +config BR2_PACKAGE_PYTHON_DIALOG
 > +	bool "python-dialog"
 > +	depends on BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_DIALOG
 > +	help
 > +	  A Python interface to the UNIX dialog utility and
 > +	  mostly-compatible programs.
 > +
 > +	  http://pythondialog.sourceforge.net/

You forgot to propagate the dependencies of dialog.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
