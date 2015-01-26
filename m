From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:27:10 +0100
Subject: [Buildroot] [PATCH 2/3] fs/iso9660: remove obsolete code
In-Reply-To: <1421697177-12995-2-git-send-email-nrubinstein@aldebaran.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
 <1421697177-12995-2-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150126232710.0586db05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Mon, 19 Jan 2015 20:52:56 +0100, No? Rubinstein wrote:
> This rule is superseded by a rule defined in fs/common.mk:
> 
>     rootfs-$(1)-show-depends:
>             @echo $$(ROOTFS_$(2)_DEPENDENCIES)
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

No, this is not correct, because iso9660.mk unfortunately does not use
the fs/common.mk code. See the comment at the top of the iso9660.mk
file:

################################################################################
#
# Build the iso96600 root filesystem image
#
# Cannot be converted to the ROOTFS_TARGET infrastructure, because of
# the temporary construction in ISO9660_TARGET_DIR.
#
################################################################################

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
