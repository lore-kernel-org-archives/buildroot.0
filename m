From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 31 Mar 2020 08:55:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/openssh: bump to version 8.2p1
In-Reply-To: <CADyEP=TCvkTwoj4GrNqs_80nmNQ7493X-C01t6uG+f+55Dbr1w@mail.gmail.com>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200330162411.9678-2-romain.naour@smile.fr>
 <CADyEP=TCvkTwoj4GrNqs_80nmNQ7493X-C01t6uG+f+55Dbr1w@mail.gmail.com>
Message-ID: <a2ea8dc5-568f-02ef-50fc-05bf6fc2da6f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

Le 31/03/2020 ? 07:34, David PIERRET a ?crit?:
> Hi,
> 
> I'm not able to complete the boot on qemu_aarch64_virt_defconfig.
> boot stuck after the network initialisation.

Thanks for testing!

Can you try by adding -device virtio-rng-pci on the Qemu command line ?
The system emulated by Qemu lack of entropy sources, the boot process is stuck
several dozen of seconde waiting for minimum entropy level.

Note, this is not related to the version bump. You should be able to reproduce
the issue with openssh 8.1p1.

See:
https://git.buildroot.net/buildroot/commit/?id=450863097f588fe85d23e83cff14a75f1740d8fa

I'll double check on my side.

Best regards,
Romain

> 
> regards
> 
> On Mon, Mar 30, 2020 at 6:24 PM Romain Naour <romain.naour@smile.fr> wrote:
>>
>> This new version is mandatory to allow the glibc package bump to version 2.31.
>> Otherwise it's not possible to connect to the remote host, as reported by [1] [2].
>> Upstream commit [3][4] fixes the issue.
>>
>> [1] https://bugs.archlinux.org/task/65386
>> [2] https://bugs.gentoo.org/708224
>> [3] https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
>> [4] https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630
>>
>> Release Note:
>> https://www.openssh.com/txt/release-8.2
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Reviewed-by: David Pierret <david.pierret@smile.fr>
>> ---
>>  package/openssh/openssh.hash | 4 ++--
>>  package/openssh/openssh.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
>> index 4db933f7b0..2f962d4337 100644
>> --- a/package/openssh/openssh.hash
>> +++ b/package/openssh/openssh.hash
>> @@ -1,4 +1,4 @@
>> -# From https://www.openssh.com/txt/release-8.1 (base64 encoded)
>> -sha256 02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff  openssh-8.1p1.tar.gz
>> +# From https://www.openssh.com/txt/release-8.2 (base64 encoded)
>> +sha256 43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671  openssh-8.2p1.tar.gz
>>  # Locally calculated
>>  sha256 73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
>> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
>> index 0411133bdc..d50572128a 100644
>> --- a/package/openssh/openssh.mk
>> +++ b/package/openssh/openssh.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -OPENSSH_VERSION = 8.1p1
>> +OPENSSH_VERSION = 8.2p1
>>  OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>>  OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
>>  OPENSSH_LICENSE_FILES = LICENCE
>> --
>> 2.21.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
