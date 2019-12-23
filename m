From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 23 Dec 2019 18:23:55 +0100
Subject: [Buildroot] [PATCH v4 0/2] new Avro packages
Message-ID: <20191223172357.68914-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apache Avro is a data serialization system, somewhat similar to protobuff or
cap'n proto. Unlike them however, Avro schemas can be distributed in JSON
files to be loaded at runtime, rather than language-specific generated code
to use at compile time, even though the latter is also possible with Avro.

http://avro.apache.org/

This series adds 2 packages for the Avro serialization format:
* 1 package for the C language bindings and files manipulation utilities
* 1 package for the Python3 language bindings, and a file manipulation utility

There are also Avro bindings for other languages such as C++, C#, Java,
Javascript, Perl, PHP or Ruby. However, because I am not familiar with these
ones and not using them, they are not part of this initial series.
---
Changes v1->v2:
* Use per-language archives from upstream
* Split new packages in multiple patches
* Keep my DEVELOPERS packages in alphabetical order

Changes v2->v3:
* avro-c depends on zlib, snappy if they are enabled
* NOTICE is not part of the license files
* fix musl patch format for avro-c
* display the prompt "avro-c" in menuconfig and add comment for shared libs
* add upstream url in Config.in

Changes v3->v4:
* Update upstream patch status
* avro-c needs host-pkgconf
* avro-c depends on xz when selected, enabling the lzma compression codec
---
Titouan Christophe (2):
  package/avro-c: new package
  package/python-avro: new package

 DEVELOPERS                                |  2 ++
 package/Config.in                         |  2 ++
 package/avro-c/0001-Compile-on-musl.patch | 40 +++++++++++++++++++++++
 package/avro-c/Config.in                  | 25 ++++++++++++++
 package/avro-c/avro-c.hash                |  5 +++
 package/avro-c/avro-c.mk                  | 26 +++++++++++++++
 package/python-avro/Config.in             | 20 ++++++++++++
 package/python-avro/python-avro.hash      |  5 +++
 package/python-avro/python-avro.mk        | 14 ++++++++
 9 files changed, 139 insertions(+)
 create mode 100644 package/avro-c/0001-Compile-on-musl.patch
 create mode 100644 package/avro-c/Config.in
 create mode 100644 package/avro-c/avro-c.hash
 create mode 100644 package/avro-c/avro-c.mk
 create mode 100644 package/python-avro/Config.in
 create mode 100644 package/python-avro/python-avro.hash
 create mode 100644 package/python-avro/python-avro.mk

-- 
2.23.0
