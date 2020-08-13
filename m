From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu, 13 Aug 2020 15:02:18 +0200
Subject: [Buildroot] [PATCH 0/2] bcc front end tool for eBPF
Message-ID: <1597323740-20153-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bcc is a front-end tool for eBPF :
https://github.com/iovisor/bcc/blob/master/README.md.
eBPF is the most powerful Linux tracer, and bcc
allows to write eBPF scripts in C and PYTHON3.

bcc can help to troubleshoot issues quickly on
embedded systems (as long as Linux kernel
version >= 4.1).

bcc can also make it easy to create observabilty tools,
SDN configuration, ddos mitigation, intrusion detection
and secure containers. More information is available at:
http://www.brendangregg.com/ebpf.html.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---

Jugurtha BELKALEM (2):
  package/llvm: add BPF backend
  package/bcc: new package

 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/bcc/0001-fix-aarch64-cross-compile.patch | 65 ++++++++++++++++++++++++
 package/bcc/Config.in                            | 49 ++++++++++++++++++
 package/bcc/bcc.hash                             |  3 ++
 package/bcc/bcc.mk                               | 63 +++++++++++++++++++++++
 package/llvm/Config.in                           |  6 +++
 package/llvm/llvm.mk                             |  5 ++
 8 files changed, 193 insertions(+)
 create mode 100644 package/bcc/0001-fix-aarch64-cross-compile.patch
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk

-- 
2.7.4
