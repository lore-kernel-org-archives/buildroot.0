From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 21 Apr 2021 13:04:11 +0300
Subject: [Buildroot] [PATCH v1] package/protozero: disable test wchar
 support
In-Reply-To: <20210418211311.8038-1-ps.report@gmx.net>
References: <20210418211311.8038-1-ps.report@gmx.net>
Message-ID: <d64bf1fc-58bb-dba2-70e7-bb61e2b08cdb@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

19.04.2021 00:13, Peter Seiderer ?????:
> No option to disable test compile available, but catch wchar support
> can be disabled with CATCH_CONFIG_NO_WCHAR define.
> 
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/1cd24b757d87b963c70bc7ff927c6d983d0b142a
> 
>    .../build/protozero-1.7.0/test/catch/catch.hpp:1691:29: error: 'wstring' is not a member of 'std'
>     1691 |     struct StringMaker<std::wstring> {
>          |                             ^~~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/protozero/protozero.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
> index e4ce1a4730..48ce04ffe0 100644
> --- a/package/protozero/protozero.mk
> +++ b/package/protozero/protozero.mk
> @@ -10,6 +10,9 @@ PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
>   PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
>   PROTOZERO_INSTALL_STAGING = YES
>   
> +PROTOZERO_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DCATCH_CONFIG_NO_WCHAR=1"
> +
>   ifeq ($(BR2_PACKAGE_PROTOBUF),y)
>   PROTOZERO_DEPENDENCIES += protobuf
>   endif
> 
