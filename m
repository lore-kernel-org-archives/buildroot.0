From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:32:21 +0100
Subject: [Buildroot] [PATCH v3 1/1] openocd
In-Reply-To: <1418583737-19280-1-git-send-email-claudio.laurita@integrazionetotale.it>
References: <1418583737-19280-1-git-send-email-claudio.laurita@integrazionetotale.it>
Message-ID: <20150102163221.1c5a860a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Claudio Laurita,

On Sun, 14 Dec 2014 20:02:17 +0100, Claudio Laurita wrote:
> This patch adds the management of (almost) all the config options of
> openocd 0.8.0. A BR config variable is added for (almost) every adapter 
> known to openocd and all the dependencies are automatically calculated
> from the chosen adapters, so only the necessary libraries are built.
> Note that CMSIS_DAP adapter requires hidapi (not libhid) and hidapi 
> is not actually included in buildroot, so it has been removed.
> Also zy1000 adapters are actually broken in openocd (as far as I know)
> and have been removed.
> The host version of the package enables all the possible adapters and
> the related libraries.
> 
> Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>

Thanks, applied after doing a number of changes:

    [Thomas:
     - Slightly fixup the commit log.
     - Rename the patches to the new patch naming convention.
     - Update hash file using a contribution from Vincent Stehl?.
     - Move the thread dependency from the OpenOCD option down to each
       sub-option that actually needs it (when it needs libusb,
       libusb-compat or libftdi). We keep only one comment, as we would
       otherwise have to add too many repeatitive comments.
     - Remove commented options.
     - Add missing dependency on BR2_ARCH_HAS_ATOMICS when selecting
       BR2_PACKAGE_LIBFTDI.
     - Remove trailing white spaces.
     - Pass -std=gnu99, needed to build with a basic toolchain.
     - Write the OPENOCD_DEPENDENCIES and OPENOCD_CONF_OPTS conditions in
       a more compact way.
     - Adjust indentation for HOST_OPENOCD_CONF_OPTS.
     - Reword the comment above HOST_OPENOCD_CONF_OPTS.]

Final commit visible at
http://git.buildroot.net/buildroot/commit/?id=aa441aa84c38ad5319c4ff7fb27c84530e19c204.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
