From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 29 May 2017 10:39:16 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2017-05-27
In-Reply-To: <20170528062749.B447920E8B@mail.free-electrons.com>
References: <20170528062749.B447920E8B@mail.free-electrons.com>
Message-ID: <1496054355.7990.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2017-05-28 at 08:27 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-05-27, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your architectures:
> 
> ?????????arc |????????????????wireshark-2.2.6 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_6aefa88b01161c2e
> 9e730cdb7ec68478e034d3c0&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=sDHcL0pAdgIBIQ7zmgIaqHh6szUoxNj5jT2Kzu-
> WvjQ&s=u73vlDz5xil5ezLPswIZDvcVhFwUV4WlU5g8s4qNVwM&e=?

That seems to be a well-known generic problem with gcc 6.x headers:
------------------------------------>8-----------------------------------
/home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.3.0/cstdlib:75:25: fatal error: stdlib.h: No such file or
directory
?#include_next <stdlib.h>
?????????????????????????^
------------------------------------>8-----------------------------------

ARM/glibc:?http://autobuild.buildroot.net/results/8b8/8b8cdb727d770bbea5d1b7c74a85c7574331a5f5//
AARCH64/glibc:?http://autobuild.buildroot.net/results/77f/77ffd6956022e3f535a8aefdde8a36af05ed32b2//

I remember we saw that quite some times in other packages.

I'll take a look at it sometime soon if time permits.

-Alexey
