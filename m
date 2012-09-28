From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Sep 2012 19:27:32 +0200
Subject: [Buildroot] Support for package liblog4c-localtime
In-Reply-To: <5065CE40.70500@mail.ru>
References: <5065CDD1.2000502@mail.ru>
	<5065CE40.70500@mail.ru>
Message-ID: <20120928192732.69a9c393@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Varnin,

On Fri, 28 Sep 2012 20:20:16 +0400, Alexander Varnin wrote:

> Sorry, forget to include patch file.

Please don't send patches as attached files, because we can't easily
comment on them. If you want to send patches properly, use the 'git
send-email' tool.

A few comments:

 * You're specifying a LIBLOG4C_SOURCE variable, but this variable is
   ignored because your LIBLOG4C_SITE starts with git://. You have to
   decide whether you want a tarball download (so LIBLOG4C_SOURCE
   should be a tarball name, and LIBLOG4C_SITE should be a http or ftp
   url) or if you want a Git download (so LIBLOG4C_SOURCE should not be
   set, and LIBLOG4C_SITE should point to a Git repository)

 * LIBLOG4C_INSTALL_STAGING should be set to YES. Your package is a
   library, and you are defining the <foo>_INSTALL_STAGING_CMDS
   variable.

 * Looking at https://github.com/rcmadruga/log4c-localtime, this
   package seems to use the autotools, so you should be using the
   autotools-package infrastructure, and most likely you don't need to
   define any of the LIBLOG4C_BUILD_CMDS, LIBLOG4C_INSTALL_STAGING_CMDS
   and LIBLOG4C_INSTALL_TARGET_CMDS variables.

 * There should not be a commented line in your
   <foo>_INSTALL_TARGET_CMDS variable. Ditto for <foo>_DEVICES and
   <foo>_PERMISSIONS.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
