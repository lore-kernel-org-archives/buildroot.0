From: hartleys <hartleys@visionengravers.com>
Date: Tue, 4 Nov 2008 14:50:32 -0500
Subject: [Buildroot] svn commit: trunk/buildroot:
	toolchaintoolchain/external-toolchain
In-Reply-To: <20081104182314.580215e5@surf>
References: <20081103101839.6021A3C915@busybox.net><BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com><20081104001754.5fb48c87@surf><BD79186B4FD85F4B8E60E381CAEE1909C9177C@mi8nycmail19.Mi8.com>
	<20081104182314.580215e5@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91A31@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 04, 2008 10:23 AM, Thomas Petazzoni wrote:
> Please keep the list in Cc, other Buildroot developers can give
> very valuable insights, very often better than mine.

Sorry about that, hit the wrong reply button...

>>> Oops. Could you give me your Buildroot .config file ? And the error
>>> message you're having ?
>> 
>> Attached is the .config
>
> Is this a .config generated with the bare trunk, or with the trunk
> modified to remove the two chunks that you mentionned previously ?
>
> Since BR2_KERNEL_HEADERS_2_6_27 is set, I'm inclined to think that
> this is a .config after removal of the two chunks.

Correct. The .config is after removing the two patches. That config
builds with no problems.

>>> To build the kernel, there are two solutions:
>>>  * linux (advanced configuration)
>>>  * linux (same version as linux headers)
>>>
>>> The second solution is probably broken by my change, but the first 
>>> one seems to work fine here.
>> 
>> The second is broken with your change.
>> 
>> I tried the first but it's a bit of a pain. Every time there is a new

>> kernel I have to go in an update the values. I guess it's more of a 
>> nit...
>
> The second option < same version as linux headers > clearly cannot
work
> with my patches: since we're using an external toolchain, there's no
> version of linux headers defined in Buildroot.
>
> So my proposal is:
>
> 1) remove the option "linux (same version as linux headers)" when an
>    external toolchain is used ;
>
> 2) improve the "advanced" support to suit your needs. What do you mean
>    by < I have to go in and update the values > ?
>
> What do you think about this ?

I have no problems with your proposal. Maybe I just need a better
explanation on how the "advanced" support works.

Right now when Kernel type is set to BR2_KERNEL_LINUX_ADVANCED you get
options for the following:

Linux Kernel Version ({string}) --->
Patches --->
Linux Kernel Configuration --->
Kernel binary format ({string}) --->
Destinations for linux kernel binaries --->

There are quite a few Linux Kernel Version choices but the "latest" one
is always quite old so I have to select "Linux <custom> version then
supply all the information for what kernel I actually want to use.

Like I said, maybe I'm just doing it wrong.

>> At this point I'm still in development and a lot of the stuff I am 
>> working on is kernel related. I keep sending off patches that are 
>> slowly showing up in the newer kernels so I always want the latest 
>> stuff. I really wish I could figure out how to use git inside 
>> buildroot...
>
> Grant Likely recently sent a patch adding the ability to get the
> kernel for a Git repository. See
> http://buildroot.uclibc.org/lists/buildroot/2008-October/011037.html.
> This patch hasn't been integrated to Buildroot, yet.

I'll look at that.

>>> I don't use Buildroot to build my kernels, so I missed that problem,
>> sorry.
>> 
>> Not a problem. How else can you cross compile the kernel?
>
> See slides 136 and following in
> http://free-electrons.com/doc/embedded_linux_kernel_and_drivers.pdf.

Thanks for the link. I'll take a look at it.

Hartley
