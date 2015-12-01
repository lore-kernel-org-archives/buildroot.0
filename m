From: Stefan Peter <st3fanp3t3r@gmail.com>
Date: Tue, 1 Dec 2015 12:41:56 +0100
Subject: [Buildroot] Compile kernel module within buildroot package
In-Reply-To: <20151201084906.GA4026@arthur-bzh>
References: <20151119183653.GA1025@arthur-bzh>
 <20151130172458.0a226cd6@free-electrons.com>
 <20151201084906.GA4026@arthur-bzh>
Message-ID: <565D8784.5000403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arthur LAMBERT,

Am 01.12.2015 um 09:49 schrieb Arthur LAMBERT:
> Le Monday 30 Nov 2015 ? 17:24:58 (+0100), Thomas Petazzoni a ?crit :
>> Dear Arthur LAMBERT,
>>
> 
> Hi Thomas,
> 
>> On Thu, 19 Nov 2015 19:36:53 +0100, Arthur LAMBERT wrote:
>>
>>> I am currently using the 2015.08 version of buildroot. Kernel module compilation
>>> is broken :
>>
>> This problem has been fixed in 2015.08.1, you should upgrade to this
>> version (which has just three commits on top of 2015.08), or
>> alternatively backport
>>
>>   http://git.buildroot.net/buildroot/commit/?h=2015.08.x&id=16768877e324f6e3e1291613ae5db9af0da5a2bf
>>
>> I was able to reproduce your problem on 2015.08, and with just this
>> commit applied, lttng-modules could be built successfully.
> 
> I already found this patch. The compilation issue is fixed thanks to this commit.
> But I am always not able to get a ko file at the end of the compilation process.
> Even with the master branch.

You need to enable tracing in the kernel configuration in order for
lttng to be able to produce the kernel modules. See the help text of the
lttng-modules package for further details.

> 
> Process to run the test :
> 
> * git checkout 2015.08.1
> * git checkout -f
> * make distclean
> * make wandboard_defconfig (I am using this defconfig for my test)
> * enable lttng-modules through make menuconfig
> * make lttng-modules
> 
> Check ko file in output/target, output/builf/lttng-modules-X, output/build/linux-X
>  => no lttng kernel module file found.

They will show up in
output/target/lib/modules/3.14.28_1.0.0_ga-wandboard/extra/

With kind regards

Stefan Peter
