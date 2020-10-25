From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Oct 2020 05:15:16 -0300
Subject: [Buildroot] [PATCH v1 0/2] Add support to generate OCI images
Message-ID: <20201025081518.22309-1-sergio.prado@toradex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sergio Prado <sergio.prado@e-labworks.com>

This patch set adds support to OCI images.

The OCI image format is a specification for container images defined and
maintained as an open standard by the Open Container Initiative [1].

To generate the image according to the specification [2], a tool called
sloci-image is used.

[1] https://opencontainers.org/
[2] https://github.com/opencontainers/image-spec/blob/master/spec.md

The generated container images were tested on x86_64, arm and aarch64.

Sergio Prado (2):
  package/sloci-image: new host package
  oci: add new filesystem type

 DEVELOPERS                                    |  1 +
 fs/Config.in                                  |  1 +
 fs/oci/Config.in                              | 88 +++++++++++++++++
 fs/oci/oci.mk                                 | 97 +++++++++++++++++++
 package/Config.in.host                        |  1 +
 ...ues-when-generating-the-OCI-image-co.patch | 55 +++++++++++
 package/sloci-image/Config.in.host            |  7 ++
 package/sloci-image/sloci-image.hash          |  5 +
 package/sloci-image/sloci-image.mk            | 19 ++++
 9 files changed, 274 insertions(+)
 create mode 100644 fs/oci/Config.in
 create mode 100644 fs/oci/oci.mk
 create mode 100644 package/sloci-image/0001-Fix-escaping-issues-when-generating-the-OCI-image-co.patch
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk

-- 
2.17.1
