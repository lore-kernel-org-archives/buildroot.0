From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 May 2019 18:12:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build due to gcc
 bug 68485
In-Reply-To: <20190531153756.4592-1-fontaine.fabrice@gmail.com>
References: <20190531153756.4592-1-fontaine.fabrice@gmail.com>
Message-ID: <2c297cc1-2a29-ac54-29b9-a632fb25a2af@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Il 31/05/2019 17:37, Fabrice Fontaine ha scritto:
> Fixes:
>   - http://autobuild.buildroot.org/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b

Can you please improve commit log like this commit [1]?

Thanks
Giulio

[1]: 
https://github.com/buildroot/buildroot/commit/39dde1ffb6a7111c2fa2b340c940e4d3e685aa29

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/opencv3/opencv3.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 292ce81432..49b29d9f1e 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
>   OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +OPENCV3_CXXFLAGS += -O0
> +endif
> +
>   # OpenCV component options
>   OPENCV3_CONF_OPTS += \
>   	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
