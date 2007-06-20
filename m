From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 20 Jun 2007 12:02:48 +0200
Subject: [Buildroot] Patch: makefile debugging help
Message-ID: <f0528b5b0706200302j15d13f77re3c77619b9094805@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

One very small patch to the main Makefile:

Two new targets, show-var and print-var, can help one to debug package
makefiles.
[credit: inspired by my days with the pkgsrc team at NetBSD]

Example:

$ make show-var VARNAME=GENEXT2_DIR
GENEXT2_DIR expands to     /home/mezis/buildroot/build_i686/genext2fs-1.4
GENEXT2_DIR is defined as  $(BUILD_DIR)/genext2fs-$(GENEXT2_VERSION)

$ make print-var VARNAME=GENEXT2_DIR
/home/mezis/buildroot/build_i686/genext2fs-1.4

Very basic but saves me a lot of time...
Also allows me to use build automation tools that run make and
check/install the resulting image.

Hope this helps
-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mk-debugging-helper.patch
Type: application/octet-stream
Size: 428 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070620/616bbc39/attachment.obj 
