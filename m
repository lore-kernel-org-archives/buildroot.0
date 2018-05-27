From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 May 2018 22:54:55 +0200
Subject: [Buildroot] [PATCH 1/1] ti-sgx-*: bump from SDK 02.00 to SDK
 04.00
In-Reply-To: <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
References: <1527175458-16091-1-git-send-email-tolvupostur@gmail.com>
 <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
Message-ID: <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Einar,

Le 24/05/2018 ? 17:38, Einar J?n a ?crit?:
> Hi,
> 
> Just to explain this one. The ti-sgx-* drivers are very old, but
> nothing is using them except beaglebone_qt5_defconfig.
> I bumped beaglebone_qt5_defconfig to the same level as
> beaglebone_defconfig (the SDK 4.00 version in
> http://www.ti.com/tool/PROCESSOR-SDK-AM335X)
> 
> The ti-sdx-* drivers have been bumped to the same SDK 4.00 version.
> The  ti-sdx-um has a dependency on a new package ti-sdx-libgdm, which
> in turn depends on wayland.
> 
> This again gives QT a valid EGL backend for beaglebone_qt5.
> 
> Let me know if this should be done differently.

Thanks for this patch. We will need it soon in order to remove the gcc 5
dependency in beaglebone_qt5 defconfig.

I'm not sure if we must bump all packages related to the TI SDK or bump all
packages one by one to ease the review.

This patch add a new ti-sgx-libgbm package, it should be added in a separate patch.

Also, BR2_PACKAGE_TI_SGX_KM_AM4430 and BR2_PACKAGE_TI_SGX_KM_AM5430 symbols are
removed. It must be handled in Config.in.legacy.

Why S80ti-sgx is removed ?

Best regards,
Romain

> 
> Best regards,
> Einar J?n
> 
> On 24 May 2018 at 17:24, Einar Jon Gunnarsson <tolvupostur@gmail.com> wrote:
>> Added new package ti-sgx-libgbm
>> Fixed build and added license file hashes.
>>
>> Bumped beaglebone_qt5 to same level as beaglebone
>>
>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> ---
>>  ...nux-4.1-sgx.fragment => linux-4.9-sgx.fragment} |  0
>>  configs/beaglebone_qt5_defconfig                   | 14 +++++------
>>  package/Config.in                                  |  1 +
>>  package/ti-sgx-demos/ti-sgx-demos.hash             |  3 ++-
>>  package/ti-sgx-demos/ti-sgx-demos.mk               | 20 ++++++++++++---
>>  package/ti-sgx-km/Config.in                        | 17 +++++--------
>>  package/ti-sgx-km/ti-sgx-km.hash                   |  3 ++-
>>  package/ti-sgx-km/ti-sgx-km.mk                     | 22 ++++++++--------
>>  package/ti-sgx-libgbm/Config.in                    |  9 +++++++
>>  package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  3 +++
>>  package/ti-sgx-libgbm/ti-sgx-libgbm.mk             | 17 +++++++++++++
>>  package/ti-sgx-um/Config.in                        |  3 ++-
>>  package/ti-sgx-um/S80ti-sgx                        | 14 -----------
>>  package/ti-sgx-um/powervr.ini                      |  4 +--
>>  package/ti-sgx-um/ti-sgx-um.hash                   |  3 ++-
>>  package/ti-sgx-um/ti-sgx-um.mk                     | 29 ++++++++++++++++------
