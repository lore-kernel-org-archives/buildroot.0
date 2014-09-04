From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 22:44:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/groff: New package
In-Reply-To: <1409860796-22704-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Thu, 4 Sep 2014 21:59:55 +0200")
References: <1409860796-22704-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87vbp3p13q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/Config.in       |    1 +
 >  package/groff/Config.in |   15 +++++++++++++++
 >  package/groff/groff.mk  |   19 +++++++++++++++++++
 >  3 files changed, 35 insertions(+)
 >  create mode 100644 package/groff/Config.in
 >  create mode 100644 package/groff/groff.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 4622f9e..d354a2d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1135,6 +1135,7 @@ comment "Utilities"
 >  	source "package/file/Config.in"
 >  	source "package/gnupg/Config.in"
 >  	source "package/gnupg2/Config.in"
 > +	source "package/groff/Config.in"
 >  	source "package/inotify-tools/Config.in"
 >  	source "package/lockfile-progs/Config.in"
 >  	source "package/logrotate/Config.in"
 > diff --git a/package/groff/Config.in b/package/groff/Config.in
 > new file mode 100644
 > index 0000000..764e829
 > --- /dev/null
 > +++ b/package/groff/Config.in
 > @@ -0,0 +1,15 @@
 > +config BR2_PACKAGE_GROFF
 > +	bool "groff"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	help
 > +	  Groff (GNU troff) is a typesetting system that reads plain text mixed
 > +	  with formatting commands and produces formatted output. Output may be
 > +	  PostScript or PDF, html, or ASCII/UTF8 for display at the terminal.
 > +	  Formatting commands may be either low-level typesetting requests
 > +	  (?primitives?) or macros from a supplied set. Users may also write
 > +	  their own macros. All three may be combined.
 > +
 > +	  http://www.gnu.org/software/groff/
 > +
 > +comment "groff needs a toolchain w/ C++"
 > +	depends on !BR2_INSTALL_LIBSTDCPP

Is this just to fix the setserial issue or do you really have a need for
groff on the target?

-- 
Bye, Peter Korsgaard
