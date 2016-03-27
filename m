From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sun, 27 Mar 2016 03:31:21 +0200
Subject: [Buildroot] [PATCH v4 0/3] dpdk: new package
In-Reply-To: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've hopefly fixed all the issues. The installation of DPDK examples has been
fixed according to T. Petazzoni suggestions. The DPDK *can* install examples
but it does it in quite a wierd way (with built garbage and into directories
app/ and lib/). Moreover, by overriding the target installation directory, the
build fails as it cannot find some SDK libraries.

DPDK 16.04-rc2 is out. The final release should appear in the next 2 weeks.

Regards
Jan

Jan Viktorin (3):
  python-ptyprocess: new package
  python-pexpect: new package
  dpdk: new package

 package/Config.in                                |   3 +
 package/dpdk/Config.in                           |  64 ++++++++++++++
 package/dpdk/dpdk.hash                           |   2 +
 package/dpdk/dpdk.mk                             | 106 +++++++++++++++++++++++
 package/python-pexpect/Config.in                 |  11 +++
 package/python-pexpect/python-pexpect.hash       |   4 +
 package/python-pexpect/python-pexpect.mk         |  15 ++++
 package/python-ptyprocess/Config.in              |   7 ++
 package/python-ptyprocess/python-ptyprocess.hash |   4 +
 package/python-ptyprocess/python-ptyprocess.mk   |  14 +++
 10 files changed, 230 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk
 create mode 100644 package/python-pexpect/Config.in
 create mode 100644 package/python-pexpect/python-pexpect.hash
 create mode 100644 package/python-pexpect/python-pexpect.mk
 create mode 100644 package/python-ptyprocess/Config.in
 create mode 100644 package/python-ptyprocess/python-ptyprocess.hash
 create mode 100644 package/python-ptyprocess/python-ptyprocess.mk

-- 
2.7.0
