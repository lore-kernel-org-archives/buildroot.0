From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 10:43:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <20190930233542.6a084b17@windsurf.home>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
 <20190930233542.6a084b17@windsurf.home>
Message-ID: <0926d9c9-b986-330d-5617-9d7805ed09b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/09/2019 23:35, Thomas Petazzoni wrote:
> Hello James,
> 
> On Sun, 29 Sep 2019 05:57:31 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
>> Remove FindLibUV patch which is now upstream.
>>
>> Resync/reformat rename cmake rootfile patch for 3.15.3 with git format-patch.
>>
>> Set cmake version min to 3.10.
> 
> What is the reasoning for changing the minimal CMake version to 3.10 ?
> This minimum version is the minimum version required by all
> cmake-package packages in Buildroot, and is important when the
> system-provided cmake is used as opposed to using Buildroot's
> host-cmake. So I don't see how it can be related to a version bump of
> CMake.

 As explained elsewhere, this is for *webkit*.

 However, what is not explained elsewhere is that this bump of the minimum cmake
version should really have been done in a separate patch, with an explanation in
the commit message of which packages triggered it.


> The second question is how many cmake-package packages you have tested
> with this patch applied ? We don't need all of them to be tested, but
> it would be good to test a fair amount of them, and provide in the
> commit log the defconfig that was used to test all those packages.

 I think the only reasonable way to deal with such a situation is to just apply,
and to revert after a day or so if the autobuilders go red. We've done this a
couple of times in the past. A patch sitting in patchwork is never going to
trigger people to take care of the issues, autobuilder failures are a lot more
concrete.

 That said, a cmake bump should be relatively safe. Remember that we're using
the system's cmake on many autobuilders, and there are plenty of distros where
system cmake is vastly more recent than 3.8.

 Regards,
 Arnout
