From: Martin Bark <martin@barkynet.com>
Date: Sun,  6 May 2018 17:19:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/ca-certificates: bump version to
 20180409
In-Reply-To: <20180506161944.7451-1-martin@barkynet.com>
References: <20180506161944.7451-1-martin@barkynet.com>
Message-ID: <20180506161944.7451-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Mozilla certificate authority bundle to version 2.22.

The following certificate authorities were added (+):
  + "GDCA TrustAUTH R5 ROOT"
  + "SSL.com EV Root Certification Authority ECC"
  + "SSL.com EV Root Certification Authority RSA R2"
  + "SSL.com Root Certification Authority ECC"
  + "SSL.com Root Certification Authority RSA"
  + "TrustCor ECA-1"
  + "TrustCor RootCert CA-1"
  + "TrustCor RootCert CA-2"

The following certificate authorities were removed (-):
  - "ACEDICOM Root"
  - "AddTrust Low-Value Services Root"
  - "AddTrust Public Services Root"
  - "AddTrust Qualified Certificates Root"
  - "CA Disig Root R1"
  - "CNNIC ROOT"
  - "Camerfirma Chambers of Commerce Root"
  - "Camerfirma Global Chambersign Root"
  - "Certinomis - Autorit? Racine"
  - "Certum Root CA"
  - "China Internet Network Information Center EV Certificates Root"
  - "Comodo Secure Services root"
  - "Comodo Trusted Services root"
  - "DST ACES CA X6"
  - "GeoTrust Global CA 2"
  - "PSCProcert"
  - "Security Communication EV RootCA1"
  - "Swisscom Root CA 1"
  - "Swisscom Root CA 2"
  - "Swisscom Root EV CA 2"
  - "TURKTRUST Certificate Services Provider Root 2007"
  - "TUBITAK UEKAE Kok Sertifika Hizmet Saglayicisi - Surum 3"
  - "UTN USERFirst Hardware Root CA"

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 00296e2a8c..8100dde357 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   4c093ceee1f1428d5aa7e9a5324b92961c0c0f06                         ca-certificates_20170717.tar.xz
-sha256 e487639b641fa75445174734dd6e9d600373e3248b3d86a7e3c6d0f6977decd2 ca-certificates_20170717.tar.xz
+sha1   edf0ec04b02fcbc90cc65906ff83fb042894a3b7                         ca-certificates_20180409.tar.xz
+sha256 7af6f5bfc619fd29cbf0258c1d95107c38ce840ad6274e343e1e0d971fc72b51 ca-certificates_20180409.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b99e6f47ca..d628157c0f 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20170717
+CA_CERTIFICATES_VERSION = 20180409
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20170814T210836Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20180411T111033Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
-- 
2.17.0
