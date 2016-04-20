From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:03:36 +0200
Subject: [Buildroot] [PATCH v3 3/3] flannel: new package
In-Reply-To: <762e3d2b6b696656441d9818512ac7ac10221e7f.1459798147.git.geoff@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
 <762e3d2b6b696656441d9818512ac7ac10221e7f.1459798147.git.geoff@infradead.org>
Message-ID: <20160420230336.35b76075@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Apr 2016 19:31:49 +0000, Geoff Levand wrote:
> Flannel is a virtual network that gives a subnet to each host for use
> with container runtimes.
> 
> Cc: Brandon Philips <brandon.philips@coreos.com>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/Config.in            |  1 +
>  package/flannel/Config.in    |  9 +++++++++
>  package/flannel/flannel.hash |  2 ++
>  package/flannel/flannel.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 54 insertions(+)
>  create mode 100644 package/flannel/Config.in
>  create mode 100644 package/flannel/flannel.hash
>  create mode 100644 package/flannel/flannel.mk

Applied to master after doing the following changes:

    [Thomas:
      - Don't select BR2_PACKAGE_HOST_GO since this option was removed.
      - Take into account the rename of BR2_PACKAGE_GO_ARCH_SUPPORTS to
        BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS.
      - Rewrap Config.in help text, it was slightly too large.
      - Don't use the github function (the link was anyway incorrect), but
        instead a direct link to the tarball, since the tarballs are
        uploaded by the maintainers.
      - Update the hash accordingly.
      - Use $() to reference make variables and not ${}.
      - Call the go compiler from $(HOST_DIR)/usr/bin, rather than from
        HOST_GO_ROOT.]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
