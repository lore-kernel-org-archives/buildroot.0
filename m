From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 May 2021 21:39:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: needs gcc >= 5
In-Reply-To: <20210427065201.1162637-1-fontaine.fabrice@gmail.com>
References: <20210427065201.1162637-1-fontaine.fabrice@gmail.com>
Message-ID: <1436e69a-4b1e-f15f-2b66-473a79f547cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2021 08:52, Fabrice Fontaine wrote:
> spa (i.e. plugins which can be disabled but also tools which can't be
> disabled) fails to build on gcc 4.8 since bump to version 0.3.26 in

 So what about gcc 4.9?

 I honestly don't give a damn, so applied to master, thanks.

 Regards,
 Arnout

> commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> 
> In file included from ../spa/include/spa/pod/builder.h:34:0,
>                  from ../spa/include/spa/param/audio/format-utils.h:34,
>                  from ../spa/plugins/audioconvert/test-audioadapter.c:36:
> ../spa/include/spa/utils/hook.h:57:50: error: initializer element is not constant
>  #define SPA_CALLBACKS_INIT(_funcs,_data) (struct spa_callbacks){ _funcs, _data, }
>                                                   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e7a36ec7166a287667572e5140685e6371a9f107
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
