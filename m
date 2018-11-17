From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 19:19:44 -0600
Subject: [Buildroot] [next] test_rust: use standard defconfig fragment
 style
In-Reply-To: <20181116222147.13887-1-ricardo.martincoski@gmail.com>
References: <20181116222147.13887-1-ricardo.martincoski@gmail.com>
Message-ID: <CANQCQpaAQYGCURDzmd563Vo0_3n9J_qD4KsO+P_D8SowoTOCiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Fri, Nov 16, 2018 at 4:22 PM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Since commit "2927f412be support/testing: standardize defconfig
> fragments style" all other test cases use the same style for defconfig
> fragments:
>  - start after a backslash;
>  - be declared as a multi-line string literal;
>  - be indented one level more than the variable that contains it.
>
> Do the same here for consistency.
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  support/testing/tests/package/test_rust.py | 78 +++++++++++-----------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
> index 2dc814f99d..9854c3692e 100644
> --- a/support/testing/tests/package/test_rust.py
> +++ b/support/testing/tests/package/test_rust.py
> @@ -57,25 +57,25 @@ class TestRustBase(infra.basetest.BRTest):
>
>  class TestRustBin(TestRustBase):
>      config = \
> -             """
> -             BR2_arm=y
> -             BR2_cortex_a9=y
> -             BR2_ARM_ENABLE_NEON=y
> -             BR2_ARM_ENABLE_VFP=y
> -             BR2_TOOLCHAIN_EXTERNAL=y
> -             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -             BR2_SYSTEM_DHCP="eth0"
> -             BR2_LINUX_KERNEL=y
> -             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
> -             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> -             BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> -             BR2_TARGET_ROOTFS_CPIO=y
> -             # BR2_TARGET_ROOTFS_TAR is not set
> -             BR2_PACKAGE_HOST_CARGO=y
> -             BR2_PACKAGE_HOST_RUSTC=y
> -             """
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_HOST_CARGO=y
> +        BR2_PACKAGE_HOST_RUSTC=y
> +        """
>
>      def test_run(self):
>          self.build_test_prog()
> @@ -86,26 +86,26 @@ class TestRustBin(TestRustBase):
>
>  class TestRust(TestRustBase):
>      config = \
> -             """
> -             BR2_arm=y
> -             BR2_cortex_a9=y
> -             BR2_ARM_ENABLE_NEON=y
> -             BR2_ARM_ENABLE_VFP=y
> -             BR2_TOOLCHAIN_EXTERNAL=y
> -             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -             BR2_SYSTEM_DHCP="eth0"
> -             BR2_LINUX_KERNEL=y
> -             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
> -             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> -             BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> -             BR2_TARGET_ROOTFS_CPIO=y
> -             # BR2_TARGET_ROOTFS_TAR is not set
> -             BR2_PACKAGE_HOST_CARGO=y
> -             BR2_PACKAGE_HOST_RUSTC=y
> -             BR2_PACKAGE_HOST_RUST=y
> -             """
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_HOST_CARGO=y
> +        BR2_PACKAGE_HOST_RUSTC=y
> +        BR2_PACKAGE_HOST_RUST=y
> +        """
>
>      def test_run(self):
>          self.build_test_prog()
> --
> 2.17.1
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
