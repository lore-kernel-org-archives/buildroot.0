From: <bogus@does.not.exist.com>
Date: Sat, 23 Jun 2007 20:07:03 -0000
Subject: No subject
Message-ID: <mailman.1.1184255627.1096.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* under $(STAGING_DIR)/{bin,lib,include} and $(STAGING_DIR)/{bin,lib}
for the toolchain (e.g. uclibc)
* under $(STAGING_DIR)/usr/{bin,lib,include} and
$(STAGING_DIR)/usr/{bin,lib} for other packages (e.g. gtk)

Is this correct?

If so, we have a problem.
Half the of the package/*/*.mk use one option, half use the other.
As I "svn uped" today, the fontconfig package I had a hard time
patching broke, because expat decided AGAIN to install directly under
/lib.

Please, please establish a clear policy on this, so we can start
submiting patches
-- 
Julien Letessier
<julien.letessier@technosens.fr>
