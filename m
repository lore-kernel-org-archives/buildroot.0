From: malcolm blaney <mblaney@gmail.com>
Date: Thu, 13 Nov 2008 14:44:10 +1030
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
Message-ID: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build dropbear, and have found that having
$(TARGET_CONFIGURE_OPTS) in the command to build:
$(DROPBEAR_DIR)/$(DROPBEAR_BINARY) in the file:
package/dropbear/dropbear.mk breaks my build. With it present the
value of CFLAGS in dropbear's makefile is not used and so some include
paths go missing. It seems to build fine when removed, or when placed
before $(MAKE) on the line.

I read the discussion from last year on having
$(TARGET_CONFIGURE_OPTS) before or after $(MAKE), so is this an
example of a package that needs fixing? Was there a general solution
for this problem?

thanks,
Malcolm.
