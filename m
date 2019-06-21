From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 21 Jun 2019 11:23:36 +0100
Subject: [Buildroot] [PATCH 0/3] Add jailhouse package
Message-ID: <20190621102339.22286-1-ccaione@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jailhouse is a partitioning Hypervisor based on Linux. It is able to run 
bare-metal applications or (adapted) operating systems besides Linux. 
For this purpose, it configures CPU and device virtualization features 
of the hardware platform in a way that none of these domains, called 
"cells" here, can interfere with each other in an unacceptable way.

https://github.com/siemens/jailhouse

The package is composed by at least 3 elements:
- The source code
- A python library installed with pip at 'make install' time
- A set of python helpers using the python library

Since we do not want to use pip to install the library, I created and 
additional python-jailhouse package to support a clean installation.

@Asaf, @Yegor
Sorry for sending this again. I got bounced the first time because I was 
not subscribed with this email address.

Carlo Caione (3):
  package/jailhouse: new package
  package/python-jailhouse: new package
  package/jailhouse: introduce python helpers

 package/Config.in                            |  2 +
 package/jailhouse/Config.in                  | 26 +++++++++++++
 package/jailhouse/jailhouse.hash             |  2 +
 package/jailhouse/jailhouse.mk               | 40 ++++++++++++++++++++
 package/python-jailhouse/Config.in           |  7 ++++
 package/python-jailhouse/python-jailhouse.mk | 14 +++++++
 6 files changed, 91 insertions(+)
 create mode 100644 package/jailhouse/Config.in
 create mode 100644 package/jailhouse/jailhouse.hash
 create mode 100644 package/jailhouse/jailhouse.mk
 create mode 100644 package/python-jailhouse/Config.in
 create mode 100644 package/python-jailhouse/python-jailhouse.mk

-- 
2.20.1
