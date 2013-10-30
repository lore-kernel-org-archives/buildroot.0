From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Oct 2013 21:28:31 -0300
Subject: [Buildroot] [PATCHv2 0/5] Add apache thrift
Message-ID: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the apache thrift runtime and host tool.

Changes for v2:
* Fix indentation in python-thrift cross building
* Explicitly select/depend on zlib in thrift
* Patch Makefile.am instead of Makefile in thrift

Gustavo Zacarias (5):
  libevent: add host variant
  boost: add host variant
  python-thrift: fix cross building
  python-thrift: bump to version 0.9.1 and switch to apache
  thrift: new package

 package/Config.in                             |  1 +
 package/boost/boost.mk                        | 33 +++++++++++++++
 package/libevent/libevent.mk                  |  1 +
 package/python-thrift/python-thrift.mk        | 21 ++++++----
 package/thrift/Config.in                      | 23 ++++++++++
 package/thrift/thrift-01-libevent-cross.patch | 16 +++++++
 package/thrift/thrift-02-autoreconf.patch     | 22 ++++++++++
 package/thrift/thrift-03-zlib-cross.patch     | 16 +++++++
 package/thrift/thrift.mk                      | 60 +++++++++++++++++++++++++++
 9 files changed, 185 insertions(+), 8 deletions(-)
 create mode 100644 package/thrift/Config.in
 create mode 100644 package/thrift/thrift-01-libevent-cross.patch
 create mode 100644 package/thrift/thrift-02-autoreconf.patch
 create mode 100644 package/thrift/thrift-03-zlib-cross.patch
 create mode 100644 package/thrift/thrift.mk

-- 
1.8.1.5
