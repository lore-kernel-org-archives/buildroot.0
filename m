From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Mar 2018 17:27:46 -0300
Subject: [Buildroot] [PATCH 0/6] tpm2-{tss, abrmd,
 tools} fix compilation errors
Message-ID: <20180322202752.2562-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Declare dependency on a toolchain with C++ because tpm2-tss 1.4.0 still
contains some C++ code. This has already changed on upstream, so future
versions will drop the dependency on a C++ compiler.

Declare dependencies of tpm2-tools on MMU, threads and wchar (for
libglib and dbus).

Disable stack smashing protection if the toolchain does not support it.
This must be done explicitly because the configuration scripts attempt
to enable SSP without proper testing.

Carlos Santos (6):
  tpm2-tss: declare dependency on a toolchain with C++
  tpm2-tss: allow building without stack smashing protection (SSP)
  tpm2-abrmd: declare dependency on a toolchain with C++
  tpm2-abrmd: allow building without stack smashing protection (SSP)
  tpm2-tools: propagate dependencies of selected packages
  tpm2-tools: allow building without stack smashing protection (SSP)

 package/tpm2-abrmd/Config.in     | 5 +++--
 package/tpm2-abrmd/tpm2-abrmd.mk | 4 ++++
 package/tpm2-tools/Config.in     | 8 ++++++++
 package/tpm2-tools/tpm2-tools.mk | 4 ++++
 package/tpm2-tss/Config.in       | 3 +++
 package/tpm2-tss/tpm2-tss.mk     | 4 ++++
 6 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.14.3
