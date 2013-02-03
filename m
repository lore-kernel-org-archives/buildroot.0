From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Feb 2013 22:47:13 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install
	application library.
In-Reply-To: <CAAfyv3429jDJubewvPwB6ePtJa96h1sKq0MT0jqJg+KSAAK4fQ@mail.gmail.com>
 (Belisko Marek's message of "Sun, 3 Feb 2013 21:44:23 +0100")
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
 <878v755vj5.fsf@dell.be.48ers.dk>
 <CAAfyv3429jDJubewvPwB6ePtJa96h1sKq0MT0jqJg+KSAAK4fQ@mail.gmail.com>
Message-ID: <87boc13w9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Belisko" == Belisko Marek <marek.belisko@gmail.com> writes:

Hi,

 Marek> +config BR2_PACKAGE_LVM2_APP_LIBRARY
 Marek> +       bool "install application library"
 >> 
 >> This option doesn't make much sense in combination with DMSETUP_ONLY, so
 >> I've made it depend on !DMSETUP_ONLY

 Belisko> This patch was from v2 and was dropped in v3 because it wasn't
 Belisko> necessary.  Please see
 Belisko> http://lists.busybox.net/pipermail/buildroot/2013-January/065740.html
 Belisko> I've tested it also with fresh build and it was working
 Belisko> without this patch.

Hmm, it didn't work for me here.

From lvm2 configure.in:

AC_ARG_ENABLE(applib,
              AC_HELP_STRING([--enable-applib], [build application library]),
              APPLIB=$enableval, APPLIB=no)
AC_MSG_RESULT($APPLIB)

E.G. applib defaults to disabled.

Makefile.in:

ifeq ("@APPLIB@", "yes")
  SUBDIRS += liblvm
endif

So I wonder how you could have gotten the liblvm subdir built without
either passing --enable-applib or explicitly calling make liblvm.

-- 
Bye, Peter Korsgaard
