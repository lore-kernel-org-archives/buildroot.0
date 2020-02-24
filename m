From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 19:26:49 +0200
Subject: [Buildroot] [PATCH 0/3] add frr package
Message-ID: <20200224172652.30932-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FRR is free software that implements and manages various IPv4 and IPv6
routing protocols. It runs on nearly all distributions of Linux and BSD
as well as Solaris and supports all modern CPU architectures.

FRR currently supports the following protocols:

    BGP
    OSPFv2
    OSPFv3
    RIPv1
    RIPv2
    RIPng
    IS-IS
    PIM-SM/MSDP
    LDP
    BFD
    Babel
    PBR
    OpenFabric
    VRRP
    EIGRP (alpha)
    NHRP (alpha)

FRR package requires rtrlib which is added in separate
patch. There was issues on target 'make install' which
I could not fix otherway than adding half-custom install
hook to install binaries and configs.

RTRLib package requires LYD_PRIV option to be enabled in
libyang package, hence enabled it in separate patch.

Vadim Kochan (3):
  package/libyang: enable LYD_PRIV option
  package/rtrlib: new package
  package/frr: new package

 DEVELOPERS                 |   2 +
 package/Config.in          |   2 +
 package/frr/Config.in      |  23 ++++++++
 package/frr/S50frr         |  38 ++++++++++++++
 package/frr/frr.hash       |   2 +
 package/frr/frr.mk         | 105 +++++++++++++++++++++++++++++++++++++
 package/libyang/libyang.mk |   3 +-
 package/rtrlib/Config.in   |  13 +++++
 package/rtrlib/rtrlib.hash |   2 +
 package/rtrlib/rtrlib.mk   |  20 +++++++
 10 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 package/frr/Config.in
 create mode 100644 package/frr/S50frr
 create mode 100644 package/frr/frr.hash
 create mode 100644 package/frr/frr.mk
 create mode 100644 package/rtrlib/Config.in
 create mode 100644 package/rtrlib/rtrlib.hash
 create mode 100644 package/rtrlib/rtrlib.mk

-- 
2.17.1
