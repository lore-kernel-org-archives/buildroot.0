From: tema <apanfilov@spectracom.com>
Date: Wed, 1 Aug 2018 14:07:07 +0300
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 1.105
In-Reply-To: <20180801105740.6d5ba467@windsurf>
References: <20180801074108.8926-1-apanfilov@spectracom.com>
 <20180801105740.6d5ba467@windsurf>
Message-ID: <a26b609c-b8d6-10aa-c6a9-9ea17a73e9be@spectracom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 > Is this version still independent from the Javascript stuff that newer
 > versions need ? I thought we were stuck to 0.103 because of the
 > dependency of newer versions on MozJS.

Could you please provide name of the package which depends on polkit?

 > Also, do you have a defconfig that exhibits the issue. I'm surprised
 > our autobuilders haven't found any build issue.

defconfig used for build:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
BR2_PACKAGE_NETWORK_MANAGER=y
BR2_PACKAGE_SYSTEMD_POLKIT=y

This is build output:
 ? CCLD???? clients/cli/nmcli
clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function 
`compare_users':
nm-polkit-listener.c:(.text.compare_users+0x48): undefined reference to 
`polkit_unix_user_get_name'
clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function 
`initiate_authentication':
nm-polkit-listener.c:(.text.initiate_authentication+0x1c4): undefined 
reference to `polkit_unix_user_get_name'
collect2: error: ld returned 1 exit status

Thanks!

On 01.08.2018 11:57, Thomas Petazzoni wrote:
> Hello,
>
> On Wed,  1 Aug 2018 10:41:08 +0300, Artem Panfilov wrote:
>> Fixes build issue with network-manager package when polkit package is
>> enabled.
>>
>> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
> Is this version still independent from the Javascript stuff that newer
> versions need ? I thought we were stuck to 0.103 because of the
> dependency of newer versions on MozJS.
>
> Could you comment on this ?
>
> Also, do you have a defconfig that exhibits the issue. I'm surprised
> our autobuilders haven't found any build issue.
>
> Thanks!
>
> Thomas
