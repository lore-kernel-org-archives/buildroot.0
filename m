From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 2 Jul 2018 10:43:25 +0200
Subject: [Buildroot] Building the Rockchip libv4l plugin
In-Reply-To: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
References: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
Message-ID: <10c8b33a-b72c-e13b-af1f-809ced49dcf8@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/2018 10:22, Baruch Siach wrote:
> Hi Buildroot list,
> 
> I'm trying to build the Rockchip libv4l2 plugin in Buildroot. The source is at
> 
>   https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/master/libv4l-rockchip_v2/
> 
> As upstream indicated[1], the code is meant to build as part of libv4l, not as 
> a standalone library. ChromiumOS sees to copy the code into the libv4l source 
> tree, and modify the relevant build configuration files[2].
> 
> What would be the best way to do that in Buildroot? A symlink to the plugin 
> source tree? Copy of the code to libv4l?
> 
> Is there any other package doing something similar?

nginx comes to mind, the nginx-dav-ext/nginx-naxsi/nginx-upload packages are
built by the nginx package.

However, the build system already supports this and the nginx module source does
not need to be moved, so it's not exactly the same thing.
