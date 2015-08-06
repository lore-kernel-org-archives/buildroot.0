From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 6 Aug 2015 10:08:54 +0000
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150806113014.163c6592@free-electrons.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
Message-ID: <55C3323C.1000004@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I'm currently on holiday until beginning of September.

Le 06/08/2015 11:30, Thomas Petazzoni a ?crit :
>>           arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4edecf424246204aa68c9670b4950bafcf8fe973/
>
> Glib auto-detection... ()
> [...]
> cannot find -ldl
>
> Julien?
>
> Note that the build-end.log is very very large, for some reason. I
> recommend you to download it with wget, and look at it with less/cat,
> instead of your web browser.
>

I'm not sure I will have the time to work on that one until then...

>>       aarch64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/
>
> Julien, any idea?
>
> cp -dpf /home/test/autobuild/instance-2/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libqgsttools*.so.* /home/test/autobuild/instance-2/output/target/usr/lib
> cp: cannot stat `/home/test/autobuild/instance-2/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libqgsttools*.so.*': No such file or directory
>

The copy of libqgsttools is hard coded in the qt5multimedia.mk file but 
the compilation of this plugin is based on an autodection in qt5base. I 
have just submitted a patch to force gstreamer detection[1] and allow 
gst1.0 support[2] but I didn't check all the cases. We may let autobuild 
do that work for me if you want a quick fix of this issue.

[1] https://patchwork.ozlabs.org/patch/504627/
[2] https://patchwork.ozlabs.org/patch/504628/
