From: Martin Bark <martin@barkynet.com>
Date: Sat, 16 Jun 2018 23:05:58 +0100
Subject: [Buildroot] [PATCH v2 0/3] package/ca-certificates improvements
Message-ID: <20180616220601.4629-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This patch set includes the following improvements to ca-certificates:

1. fix a bug meaning one of the hashes in ${TARGET_DIR}/etc/ssl/certs was wrong
2. fix rebuilds
3. make the contents of ${TARGET_DIR}/etc/ssl/certs/ca-certiicates.crt reproducible.

The result of these patches means ${TARGET_DIR}/etc/ssl/certs now exactly matches Ubuntu 18.04 and Debian sid which both use ca-certiicates 20180409 too

Thanks

Martin

Martin Bark (3):
  package/ca-certificates: don't hash certificates.crt
  package/ca-certificates: fix rebuilds
  package/ca-certificates: create ca-certificates.crt reproducibly

 package/ca-certificates/ca-certificates.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--
2.17.1
