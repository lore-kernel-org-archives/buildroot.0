From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 05 Feb 2013 18:59:11 +0100
Subject: [Buildroot] [PATCH v2] New package: googletest
In-Reply-To: <20130205175752.00d8e32e@skate>
References: <1360076909-5929-1-git-send-email-sho@relinux.de>
 <1360077510-6556-1-git-send-email-sho@relinux.de>
 <20130205164745.6fc9d9aa@skate> <51113304.5020807@relinux.de>
 <20130205175752.00d8e32e@skate>
Message-ID: <5111486F.6090907@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.02.2013 17:57, schrieb Thomas Petazzoni:
> Dear Stephan Hoffmann,
>
> On Tue, 05 Feb 2013 17:27:48 +0100, Stephan Hoffmann wrote:
>
>>>> --- /dev/null
>>>> +++ b/package/gtest/Config.in
>>>> @@ -0,0 +1,20 @@
>>>> +config BR2_PACKAGE_GTEST
>>> Maybe the package directory should be named "googletest" and the option
>>> BR2_PACKAGE_GOOGLETEST. But I'm not sure since the upstream tarball is
>>> just "gtest".
>> Hello Thomas,
>>
>> first I named it googletest, but since it is named gtest upstream and
>> unzip produces a directory with this name I decided to changed it.
> Ok. The fact that we don't control the unzip output directory is a bit
> annoying, but it's a separate matter.
>
> In general we really try to keep a 1:1 mapping between:
>  * the option name
>  * the directory name
>  * the name of the label attached to the configuration option in the
>    menuconfig
>
> With the current proposal, people would see a "googletest" label in
> menuconfig, and might therefore look for package/googletest/... which
> won't exist.
That's right, I think I'll name it gtest everywhere, as also Jeremy
Rosen proposes.
>
>>> Even though I understand that it is composed only of a static library,
>>> I find this GTEST_INSTALL_TARGET = NO a bit strange. But well, ok.
>> Yes, it is, but when there is nothing to install? Maybe it's also
>> possible to compile it to a .so, but I am not sure if it's worth the
>> effort. This way we can use googletest on the target and, when the
>> testuites are not instaled, do not waste any space there.
> Ok.
>
>> BTW: Running googletest on the target out of eclipse works well.
> Does it mean that you're using the Eclipse Buildroot plugin?
Yes, I played around with it a little and I like it. It gives a real
jumpstart into cross development for buildroot targets.
>> I didn't find any. Of course it would be nicer. As far as I understand
>> the documentation one shall point the compiler and linker to the build
>> directory.
> Ok.
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
