From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:03:14 +0200
Subject: [Buildroot] [PATCH 1/2] gettext: drop host-gettextize eye candy
	fixups
In-Reply-To: <1466495278-30897-2-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 21 Jun 2016 09:47:57 +0200")
References: <1466495278-30897-1-git-send-email-peter@korsgaard.com>
 <1466495278-30897-2-git-send-email-peter@korsgaard.com>
Message-ID: <87furxkrnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The real functional change (to not wait for confirmation) was alredy handled
 > below in HOST_GETTEXT_GETTEXTIZE_CONFIRMATION, and we otherwise don't patch
 > upstream purely for cosmetical reasons so drop it.

 > gettextize is also quite noisy as is, so the single 'Press return' line imho
 > isn't a big issue:

 >>>> fetchmail 6.3.26 Gettextizing
 > Copying file config.rpath
 > Not copying intl/ directory.
 > Copying file po/Makefile.in.in
 > Copying file po/Makevars.template
 > Copying file po/Rules-quot
 > Copying file po/boldquot.sed
 > Copying file po/en at boldquot.header
 > Copying file po/en at quot.header
 > Copying file po/insert-header.sin
 > Copying file po/quot.sed
 > Copying file po/remove-potcdate.sin
 > Creating po/ChangeLog
 > Copying file m4/gettext.m4
 > Copying file m4/iconv.m4
 > Copying file m4/lib-ld.m4
 > Copying file m4/lib-link.m4
 > Copying file m4/lib-prefix.m4
 > Copying file m4/nls.m4
 > Copying file m4/po.m4
 > Copying file m4/progtest.m4
 > Creating m4/ChangeLog
 > Updating configure.ac (backup is in configure.ac~)
 > Creating ChangeLog

 > Please update po/Makevars so that it defines all the variables mentioned
 > in po/Makevars.template.
 > You can then remove po/Makevars.template.

 > Please run 'aclocal -I m4 -I m4-local' to regenerate the aclocal.m4 file.
 > You need aclocal from GNU automake 1.9 (or newer) to do this.
 > Then run 'autoconf' to regenerate the configure file.

 > You might also want to copy the convenience header file gettext.h
 > from the /home/peko/source/buildroot/output-test/host/usr/share/gettext directory into your package.
 > It is a wrapper around <libintl.h> that implements the configure --disable-nls
 > option.

 > Press Return to acknowledge the previous three paragraphs.
 >>>> fetchmail 6.3.26 Autoreconfiguring

 > CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
