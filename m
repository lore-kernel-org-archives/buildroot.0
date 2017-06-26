From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Jun 2017 11:20:13 +0200
Subject: [Buildroot] [PATCH] doxygen: fix a build issue
Message-ID: <1498468814-2179-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have submitted this fix for upstream inclusion, but I don't know how
long it will take for the maintainers to respond. In the meantime I'm
still getting these build reports everyday on my e-mail.

This patch fixes the doxygen build issues by fixing a script generating
a C header file. The script redirects its stderr to the generated file
so any warning emitted by it or its child processes ends up in this
very file. This is obviously broken and needs to be changed.

Bartosz Golaszewski (1):
  doxygen: fix a build issue

 ...build-fix-the-way-lang_cfg.h-is-generated.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/doxygen/0002-build-fix-the-way-lang_cfg.h-is-generated.patch

-- 
2.9.3
