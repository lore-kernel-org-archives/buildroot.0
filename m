From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Sep 2019 21:21:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-09-04
In-Reply-To: <CA+1k=2YVgAWv7P08r6uYV1Sw587rDEGkztKktDnes_pRc05pEg@mail.gmail.com>
References: <5d70a88b.1c69fb81.7a1b0.c1f5SMTPIN_ADDED_MISSING@mx.google.com>
 <CA+1k=2YVgAWv7P08r6uYV1Sw587rDEGkztKktDnes_pRc05pEg@mail.gmail.com>
Message-ID: <8063f083-05e5-51a0-9e16-a58b367eb741@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joel,

On 05/09/2019 20:09, Joel Carlson wrote:
> On Thu, Sep 5, 2019 at 12:17 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> Autobuilder failures
>> ====================
>>
>> This is the list of Buildroot build failures that occurred on
>> 2019-09-04, and for which you are a registered architecture developer
>> or package developer. Please help us improving the quality of
>> Buildroot by investigating those build failures and sending patches to
>> fix them. Thanks!
>>
>> Results for the 'master' branch
>> -------------------------------
>>
>> Build failures related to your packages:
>>
>>     arch     |             reason             |                                       url
>> -------------+--------------------------------+---------------------------------------------------------------------------------
>>     arm      |        capnproto-0.7.0         | http://autobuild.buildroot.net/results/f6b0219c8cfb8bd46748f527cb2381ea1088e170
>>   riscv64    |          cmocka-1.1.5          | http://autobuild.buildroot.net/results/cd45c6392e578f6210bf373e3c6a5256da61d9da
>>   sparc64    |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/b4629907e0a0f787ac6a16afe21423d8b358e1d1
>>    xtensa    |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/d8abc93dfad1e25808ddb878471ae4acf4658912
>>   mips64el   |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/dd051b1353e7b45615c83248c8df54a3cbe7ab72
>>     arc      |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/8dd8f87a02ef08d82d1896ee89044a478d3f3db6
>>     or1k     |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/54bb70e9077be7676e9aa42f901bb1e2b5c8054f
>>   powerpc    |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/15e0955c62f4f3152dc55d1797842c128e1f8be9
>>   aarch64    |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/d64ae22ba7f64b705b31ec5dd987268511d5edc3
>>     arc      |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/664628c9a1b629990b8dc3f3a78a996848a7a59e
>>     arm      |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/ed028513fb1333010370e6314f38748ff60afa7c
>>     i686     |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/b955b258099052a9ecca22a5c9806b201260be5c
>>     arc      |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/0f9614648706118a1aa2bd7af2c60c2412b4ab56
>>     arm      |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/2375aeb0aaaf9e8d9fca8479484815794063f14a
>>   powerpc    |      host-capnproto-0.7.0      | http://autobuild.buildroot.net/results/46601ccf5573cb51da03fea2a62225b26408d4c3
>>
>> --
>> http://autobuild.buildroot.net
> 
> Capnproto got bumped to version 0.7.0 recently, which requires C++14.
> This patch was submitted to set a requirement on the package:
> https://patchwork.ozlabs.org/patch/1150841/
> 
> I'm not sure why, but I can't seem to reproduce it locally

 Those failures are for *host* capnproto. The build failures seem indeed to be
on machines that have host GCC 4.8.

 Regards,
 Arnout

, like
> looking at d64ae22ba7f64b705b31ec5dd987268511d5edc3.  When I pull that
> down, the toolchain in that build seems to have the appropriate GCC
> version and both host-capnproto and capnproto configure just fine.
> But all the autobuild log failures seem to be that the configure is
> running and its failing because the toolchains don't seem to have
> C++14 support.
> 
> So I'm not sure what my issue is with not being able to reproduce it,
> but I'm hoping that the already submitted patch might alleviate the
> issue.
> 
> Regards,
> -Joel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
