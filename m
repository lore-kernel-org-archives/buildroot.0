From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 15 Jul 2016 00:07:30 +0200
Subject: [Buildroot] [Patch v2 0/4] Add support for Cargo,
	the Rust package manager
Message-ID: <1468534054-14110-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for Cargo, the Rust package manager by providing a
package for the host variant.

v1 -> v2:

 - bump cargo to 0.11.0
 - make host-libssh2 depends on host-openssl

Eric Le Bihan (4):
  libssh2: add host variant
  libhttpparser: add host variant
  cargo-bootstrap: new package
  cargo: new package

 package/cargo-bootstrap/cargo-bootstrap.hash |   3 +
 package/cargo-bootstrap/cargo-bootstrap.mk   |  14 ++++
 package/cargo/0001-Allow-use-of-wget.patch   |  56 ++++++++++++++
 package/cargo/cargo.hash                     |   2 +
 package/cargo/cargo.in                       |   2 +
 package/cargo/cargo.mk                       | 106 +++++++++++++++++++++++++++
 package/cargo/config.in                      |   2 +
 package/libhttpparser/libhttpparser.mk       |   9 +++
 package/libssh2/libssh2.mk                   |   6 ++
 9 files changed, 200 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk
 create mode 100644 package/cargo/0001-Allow-use-of-wget.patch
 create mode 100644 package/cargo/cargo.hash
 create mode 100644 package/cargo/cargo.in
 create mode 100644 package/cargo/cargo.mk
 create mode 100644 package/cargo/config.in

-- 
2.4.11
