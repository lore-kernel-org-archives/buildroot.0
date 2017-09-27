From: Bradford Barr <bradford@density.io>
Date: Wed, 27 Sep 2017 13:15:25 -0400
Subject: [Buildroot] [PATCH 1/2] tbb: new package
In-Reply-To: <sj0t9exl3e.ln2@ID-313208.user.individual.net>
References: <20170926203504.22326-1-bradford@density.io>
 <20170926203504.22326-2-bradford@density.io>
 <CAHXCMM+zCdA0wEd+taFp_JOC5bx1k0OR4MOwOTJ5_trEHUsUMA@mail.gmail.com>
 <CAPpUvYjbnmbjUo1Wb-1CR1sHM8YDxS-RW5oCGAcMRdDbYBZ1xg@mail.gmail.com>
 <sj0t9exl3e.ln2@ID-313208.user.individual.net>
Message-ID: <CAPpUvYjU8rW29akmJq724LpnMZRf8E0yzCCofn_zGzYFZOfgyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh awesome! I wasn't aware of that, but I see it's here[1] in the
Buildroot manual. I'll use that before I submit a v2.

[1]:https://buildroot.org/downloads/manual/manual.html#_tips_and_tricks

Thanks!
B

On Wed, Sep 27, 2017 at 12:35 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Am Wed, 27 Sep 2017 11:49:46 -0400 schrieb Bradford Barr:
>
>> I guess I could try to compile TBB for every platform supported by
>> buildroot? Is there an easy way to do that?
>
> Hi,
>
> yes:
>
> $ echo "BR2_PACKAGE_TBB=y" > test-tbb
> $ utils/test-pkg -c test-tbb -d $HOME/buildroot/test-tbb
>
> Doing so you will see that your package also
>
>         depends on BR2_INSTALL_LIBSTDCPP
>
> because it contains c++ code.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
