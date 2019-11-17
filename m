From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 18:08:06 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <20191113115115.40645a37@windsurf>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
 <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
 <20191112212446.21cbdbca@windsurf>
 <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
 <20191113115115.40645a37@windsurf>
Message-ID: <4a56ca5f-c6f3-687c-396f-987321e88fa7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/11/2019 11:51, Thomas Petazzoni wrote:
> On Wed, 13 Nov 2019 10:39:38 +0000
> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
> 
>>> So, when I say "autobuilders", I'm referring to (2) above. And I don't
>>> get why this sys/io.h doesn't occur in the autobuilders.  
>>
>> Got it, thanks. Is it possible to search the autobuilder configurations for
>> the above case? Maybe it never came up. Or maybe it *has* been tested, just
>> before this bug was introduced.
> 
> We do have an ARM toolchain configuration that builds an internal
> Buildroot toolchain with glibc:
> 
>   support/config-fragments/autobuild/br-arm-internal-glibc.config
> 
> So, I did a search with this:
> 
>   http://autobuild.buildroot.net/index.php?arch=arm&symbols%5BBR2_TOOLCHAIN_BUILDROOT_GLIBC%5D=y&symbols%5BBR2_PACKAGE_XSERVER_XORG_SERVER%5D=y
> 
> And I can see:
> 
>   http://autobuild.buildroot.net/results/b7c/b7c49525277ea1ccdd7011ab9295f6bf4050e4bb/build-end.log
> 
> which is exactly the build failure you're fixing. I'm not sure why it
> didn't happen more often.

 The X packages don't get built that often. Each package has about a 10% chance
of being built, the but X packages depend on BR2_PACKAGE_XORG7, so that's 1%...

 We should probably explictly set XORG7 more often in genrandconfig to get
better exposure of everything X related.

 BTW I verified the above assumptions by doing more queries of the database, and
it works out:

http://autobuild.buildroot.net/index.php?arch=arm&symbols%5BBR2_TOOLCHAIN_BUILDROOT_GLIBC%5D=y&symbols%5BBR2_PACKAGE_XSERVER_XORG_SERVER%5D=y
http://autobuild.buildroot.net/index.php?arch=arm&symbols[BR2_TOOLCHAIN_BUILDROOT_GLIBC]=y



 Regards,
 Arnout
