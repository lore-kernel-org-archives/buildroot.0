From: Fabio Urquiza <fabiorush@gmail.com>
Date: Fri, 28 Sep 2018 10:59:19 -0300
Subject: [Buildroot] [PATCH 0/4] Initial support to blockchain clients
Message-ID: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set of patches is the first one of a serie that will provide buildroot
with several blockchain clients. The first ones that will be added are three
bitcoin clients:

 - Bitcoin Core (C++ based client)
 - BTCD (Goland based client)
 - Neutrino (Goland based lightweight client)

In order to build the Golang clients, a dependency resolving tool needed to
be added (Glide), and Go host building support needed to be implemented.

Next patches of the serie shall add suport to lighting network and Etherium
clients.

Fabio Urquiza (4):
  host-go-glide: new package
  bitcoin: new package
  btcd: new package
  neutrino: new package

 package/Config.in               |  6 ++++++
 package/Config.in.host          |  1 +
 package/bitcoin/Config.in       | 26 ++++++++++++++++++++++++++
 package/bitcoin/bitcoin.hash    |  3 +++
 package/bitcoin/bitcoin.mk      | 17 +++++++++++++++++
 package/btcd/Config.in          | 10 ++++++++++
 package/btcd/btcd.hash          |  3 +++
 package/btcd/btcd.mk            | 15 +++++++++++++++
 package/go-glide/Config.in.host | 12 ++++++++++++
 package/go-glide/go-glide.hash  |  3 +++
 package/go-glide/go-glide.mk    | 14 ++++++++++++++
 package/neutrino/Config.in      | 13 +++++++++++++
 package/neutrino/neutrino.hash  |  3 +++
 package/neutrino/neutrino.mk    | 14 ++++++++++++++
 package/pkg-golang.mk           | 36 ++++++++++++++++++++++++++++++++----
 15 files changed, 172 insertions(+), 4 deletions(-)
 create mode 100644 package/bitcoin/Config.in
 create mode 100644 package/bitcoin/bitcoin.hash
 create mode 100644 package/bitcoin/bitcoin.mk
 create mode 100644 package/btcd/Config.in
 create mode 100644 package/btcd/btcd.hash
 create mode 100644 package/btcd/btcd.mk
 create mode 100644 package/go-glide/Config.in.host
 create mode 100644 package/go-glide/go-glide.hash
 create mode 100644 package/go-glide/go-glide.mk
 create mode 100644 package/neutrino/Config.in
 create mode 100644 package/neutrino/neutrino.hash
 create mode 100644 package/neutrino/neutrino.mk

-- 
2.7.4
