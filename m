From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 22 Mar 2016 11:36:23 +0100
Subject: [Buildroot] [PATCH v3 0/3] dpdk: new package
Message-ID: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

this my thrid approach to upstream support of the DPDK into Buildroot. Briefly:

* The DPDK is a library (www.dpdk.org) that allows high-speed (10-100 Gbps)
  packet sending/receiving at very high packet rates while bypassing the Linux
  Kernel.
* I maintain the ARM(v7) part of the DPDK so I am interested in building DPDK
  by Buildroot.
* The DPDK tests require pexpect and ptyprocess python packages to run so they
  are included.

Changes for v3:

* Line overfull fixes (all patches).
* Hopefully solved issues reported by T. Petazzoni.
* As using a newer DPDK, the patch now utilizes the new installation infra.
* I've decided to include building of example applications, however, it is not
  built nor installed in a standardized way, so, it's done by dpdk.mk.

Jan Viktorin (3):
  python-ptyprocess: new package
  python-pexpect: new package
  dpdk: new package

 package/Config.in                              |   3 +
 package/dpdk/Config.in                         |  53 ++++++++++++
 package/dpdk/dpdk.hash                         |   2 +
 package/dpdk/dpdk.mk                           | 109 +++++++++++++++++++++++++
 package/python-pexpect/Config.in               |  11 +++
 package/python-pexpect/python-pexpect.mk       |  14 ++++
 package/python-ptyprocess/Config.in            |   7 ++
 package/python-ptyprocess/python-ptyprocess.mk |  13 +++
 8 files changed, 212 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk
 create mode 100644 package/python-pexpect/Config.in
 create mode 100644 package/python-pexpect/python-pexpect.mk
 create mode 100644 package/python-ptyprocess/Config.in
 create mode 100644 package/python-ptyprocess/python-ptyprocess.mk

-- 
2.7.0
