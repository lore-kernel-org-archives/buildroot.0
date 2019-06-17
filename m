From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:12:23 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/flatbuffers: Enable host
 build
In-Reply-To: <20190616202337.27216-2-bernd.kuhls@t-online.de>
References: <20190616202337.27216-1-bernd.kuhls@t-online.de>
 <20190616202337.27216-2-bernd.kuhls@t-online.de>
Message-ID: <20190617201223.38f6b08c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 16 Jun 2019 22:23:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Host version of flatc compiler is needed for Kodi 18.x:
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindFlatBuffers.cmake#L51
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: removed upstream patch after version bump to v1.11.0

I've applied, but I have a comment, see below.

> +HOST_FLATBUFFERS_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS="-std=c++11" \

This line means you will have to change the dependency of Kodi to
require host gcc >= 4.8 instead of host gcc >= 4.6 as is done today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
