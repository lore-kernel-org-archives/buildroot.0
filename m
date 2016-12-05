From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 5 Dec 2016 23:33:00 +0100
Subject: [Buildroot] LibreSSL support?
Message-ID: <20161205223300.GA5002@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Are there any plans for adding support for LibreSSL?

I've found a patch [1] in patchwork, from M. Hadjinlian, posted two
years ago. The review concludes with the need for the introduction of a
virtual package, as LibreSSL uses the same names for its binaries and
libraries as OpenSSL (openssl, libcrypto, libssl and libtls).

So, what would be the best solution:

a)
  1. introduce the virtual package openssl-compat.
  2. make libressl and openssl provide openssl-compat.
  3. update all packages depending on/selecting openssl to depend on/select
     openssl-compat.

b)
  1. rename openssl to openssl-genuine.
  2. introduce virtual package openssl.
  3. make openssl-genuine and libressl provide openssl.

Comments and suggestions welcome.

[1] https://patchwork.ozlabs.org/patch/398963/

--
ELB
