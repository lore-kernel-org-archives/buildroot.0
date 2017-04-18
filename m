From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:55:50 -0400
Subject: [Buildroot] [RFC 0/4] fix genimage wrapper argument parsing
Message-ID: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The genimage wrapper can be used in the post-image script but 
BR2_ROOTFS_POST_SCRIPT_ARGS passes BINARIES_DIR as the first argument.

In order to make genimage.sh play nicely with
BR2_ROOTFS_POST_IMAGE_SCRIPT, this patch series shifts the first
argument by one before looping over the other arguments.

When calling genimage.sh directly, one should always pass BINARIES_DIR
as the first argument like:

    ${TOPDIR}/support/scripts/genimage.sh ${BINARIES_DIR} \
        -c path/to/genimage.cfg

Etienne Phelip (4):
  genimage.sh: fix argument parsing
  genimage.sh: fix getopts traces
  genimage.sh: strip getopts EOL characters
  genimage.sh: add usage to die function

 support/scripts/genimage.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.9.3
