From: John Keeping <john@metanate.com>
Date: Tue, 10 Mar 2020 12:44:57 +0000
Subject: [Buildroot] [PATCH 0/2] pkg-meson/libglib2: restore use of system
 printf
Message-ID: <20200310124459.908611-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first patch here adds some meson infrastructure to allow per-package
properties to be set in cross-compilation.conf and the second uses it to
ensure libglib2 uses the system printf, which it will not otherwise do
as it depends on runtime tests to check these.

Note that patch 1 depends textually on the patch at
https://patchwork.ozlabs.org/patch/1252129/

John Keeping (2):
  package/pkg-meson.mk: add FOO_MESON_EXTRA_PROPERTIES
  package/libglib2: restore use of system printf

 docs/manual/adding-packages-meson.txt | 8 ++++++++
 package/libglib2/libglib2.mk          | 5 +++++
 package/pkg-meson.mk                  | 4 ++++
 3 files changed, 17 insertions(+)

-- 
2.25.1
