From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Tue, 18 Nov 2014 15:54:42 +0100
Subject: [Buildroot] [PATCH V3 0/5] Add ICAP server support
In-Reply-To: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Changes in V3:
  - squid: fix patch split, fix patch title (ICAP server => ICAP client),
  add init script, remove dir creation in *.mk files.
  - c-icap: depends on BR2_TOOLCHAIN_HAS_THREADS and !BR2_PREFER_STATIC_LIB.
  Use zlib, bzip2 and berkeleydb, if available. Enable IPv6, if available.
  Disable explicitly LDAP. Add init script. Remove dir creation in *.mk files.
  - c-icap-modules: no changes

* Changes in V2:
  - squid: split patch
  - c-icap: Fix commit message, fix new lines at end of file, remove 
  unneeded lines/options, enable large files support if available.
  - c-icap-modules: Fix commit message, fix indentation, new lines at end of 
  file, remove unneeded lines/options

---
Guillaume GARDET (5):
  package/squid: define the log directory, pidfile and swapdir
  package/squid: add init script
  package/squid: enable ICAP client support in squid
  c-icap: new package
  c-icap-modules: new package

 package/Config.in                        |  2 +
 package/c-icap-modules/Config.in         |  7 ++++
 package/c-icap-modules/c-icap-modules.mk | 27 ++++++++++++++
 package/c-icap/Config.in                 | 15 ++++++++
 package/c-icap/S96cicap                  | 35 +++++++++++++++++
 package/c-icap/c-icap.mk                 | 64 ++++++++++++++++++++++++++++++++
 package/squid/S97squid                   | 36 ++++++++++++++++++
 package/squid/squid.mk                   | 13 ++++++-
 8 files changed, 198 insertions(+), 1 deletion(-)
 create mode 100644 package/c-icap-modules/Config.in
 create mode 100644 package/c-icap-modules/c-icap-modules.mk
 create mode 100644 package/c-icap/Config.in
 create mode 100644 package/c-icap/S96cicap
 create mode 100644 package/c-icap/c-icap.mk
 create mode 100644 package/squid/S97squid

-- 
1.8.4.5
