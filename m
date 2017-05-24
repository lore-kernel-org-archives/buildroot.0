From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 24 May 2017 13:46:52 -0500
Subject: [Buildroot] [PATCH v4 1/3] refpolicy: new package
In-Reply-To: <20170520204143.18154-1-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
Message-ID: <CANQCQpZc_Orc9wgJfUOM5qEGMbCP2UkgPKpFXCvYFzYom_yBZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Sat, May 20, 2017 at 3:41 PM, Adam Duskett <aduskett@gmail.com> wrote:
> The patch is for adding selinux reference policy (refpolicy).
> It is a complete SELinux policy that can be used as the system policy
> for a variety of systems and used as the basis for creating other policies.
>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---

Please list the person who suggested the change or group by the person
requesting the change.
https://buildroot.org/downloads/manual/manual.html#submitting-patches
21.5.4. Patch revision changelog

> Changes v3 -> v4:
>   - Split the REFPOLICY_MAKE define into several lines for formatting
>     cleanliness.
>   - Added TEST_TOOLCHAIN=$(HOST_DIR) to the REFPOLICY_MAKE define. This
>     fixes repfolicy from attempting to use selinux tools on the host
>     machine.  Line 49 of the Makefile shows that userbindir, usersbindir,
>     and sbin dir are set when the TEST_TOOLCHAIN variable is passed to
>     the Makefile. TEST_TOOLCHAIN in this instance looks to match up properly
>     with the HOST_DIR, so pass HOST_DIR as TEST_TOOLCHAIN. This fix has been
>     tested with Debian 8 sid without SELinux installed.
>   - Removed Coverletter from patch set.
>

<snip>

test-pkg tested this patch series against the following.  Plus my own
personal development use of refpolicy.

# BR2_PACKAGE_CHECKPOLICY is not set
BR2_PACKAGE_POLICYCOREUTILS=y
# BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW is not set
# BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND is not set
BR2_PACKAGE_REFPOLICY=y
BR2_PACKAGE_REFPOLICY_VERSION="30"
# BR2_PACKAGE_REFPOLICY_STATE_ENFORCING is not set
BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE=y
# BR2_PACKAGE_REFPOLICY_STATE_DISABLED is not set
BR2_PACKAGE_REFPOLICY_STATE="permissive"
# BR2_PACKAGE_REFPOLICY_CUSTOM_GIT is not set
# BR2_PACKAGE_SEPOLGEN is not set
BR2_PACKAGE_SETOOLS=y

### Limited # of builds because of BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
(arm/powerpc/intel)

                armv5-ctng-linux-gnueabi [ 1/49]: OK
              armv7-ctng-linux-gnueabihf [ 2/49]: OK
                        br-aarch64-glibc [ 3/49]: OK
                  br-arm-cortex-a9-glibc [ 6/49]: OK
               br-powerpc64-power7-glibc [26/49]: OK
                     i686-ctng-linux-gnu [34/49]: OK


Tested-by: Matt Weber  <matthew.weber@rockwellcollins.com>
Acked-by: Matt Weber  <matthew.weber@rockwellcollins.com>
