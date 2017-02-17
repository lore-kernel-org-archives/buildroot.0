From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 17 Feb 2017 08:13:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-15
In-Reply-To: <20170216221556.59616853@free-electrons.com>
References: <20170216072900.AAE4920BC6@mail.free-electrons.com>
 <CALdGskKtWsQOyKehenpwZHyaMuYHQ600kiMr4w080DNYGRcBKQ@mail.gmail.com>
 <20170216102154.4f896bea@free-electrons.com>
 <20170216111120.107a7a61@free-electrons.com>
 <20170216191445.GI12810@waldemar-brodkorb.de>
 <20170216221556.59616853@free-electrons.com>
Message-ID: <76065848-61AA-4769-A457-B2432BDB3D70@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 16.02.2017 um 22:15 schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> 
> Hello,
> 
>> On Thu, 16 Feb 2017 20:14:45 +0100, Waldemar Brodkorb wrote:
>> 
>> I have a clear idea what is the problem in uClibc-ng. It is arm
>> specific. But I have trouble to reproduce the czmq issue with the
>> internal static arm toolchain. (simple config, not the autobuild
>> config).
> 
> You can try to reproduce this build failure:
> 
>  http://autobuild.buildroot.net/results/704/7041b34327b0752d3f4294a5541c785dd9989d51/
> 
> It occurs with the internal toolchain. Steps to reproduce:
> 
> mkdir foobar
> cd foobar
> wget http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
> chmod +x br-reproduce-build
> BASE_GIT=/path/to/local/buildroot/git/repository ./br-reproduce-build 7041b34327b0752d3f4294a5541c785dd9989d51
> 
>> Is there any difference between internal and external static
>> toolchains, when both created with buildroot?
> 
> The only differences are:
> 
> 1. host-mpc, host-mpfr and host-gmp are linked statically inside gcc,
>    so that we don't have rpath issues
> 
> 2. the toolchain wrapper is tweak to support the moving of files
>    outside of the usr/ subdir that I'm doing as part of the toolchain
>    "packaging"

I could reproduce it with the glibmm package and have a tested patch ready.
I will sent it in the evening.

best regards
 Waldemar 
