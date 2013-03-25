From: Daniel Price <daniel.price@gmail.com>
Date: Mon, 25 Mar 2013 11:10:26 -0700
Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
In-Reply-To: <514FF0DA.4030105@mind.be>
References: <CAKduhSuJ_-2B7i7YOKyuErfhve_CXi1UvmNX_U7iQUXYt3c7hw@mail.gmail.com>
 <ECCCCA15FFC640AAA891EA6FC4BB8F28@beraninstruments.com.local>
 <CAKduhSt3Vkpc+bLP4UM8On472BZqZ7aRVRmFZsG0kOKEm4XtEg@mail.gmail.com>
 <2F83768108B8464BAD971EB5BCDBE1E5@beraninstruments.com.local>
 <EBADBC9F10F448F49B067CB7A90C908C@beraninstruments.com.local>
 <514FF0DA.4030105@mind.be>
Message-ID: <CAKduhSvRJ33u=udY32-zyRuc4CMhdMrbMb4O4SKoWkcfO1hXaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 24, 2013 at 11:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/03/13 13:29, Will Moore wrote:
>>
>> It might help to see what Arnout is up to with his grub2 patch which is
>> also
>> looking at providing a bootloader with host and target tools.  See
>> http://patchwork.ozlabs.org/patch/191813/
>
>
>  That patch has been sitting in the freezer :-)
>
>  As you can see from the corresponding mail thread, there is no convergence
> about what to call the two variants of a bootloader. It's a bit like gcc:
> the normal variant builds an installer running on the host, but it includes
> binary code for the target; the other variant is completely running on the
> target.
>
>  Note that for u-boot, the chosen solution is to create a completely
> separate package uboot-tools for the target. But it's a bit a special case,
> because mkimage is not an installer.
>

Thanks Arnout,

For my purposes, I wound up wanting both the host- and the target-
tools, and, like you did with grub2 (IIRC), I opted to make syslinux5
a normal package so I could drive both host and target builds.

I will post my patch as a reference for others when I have a chance to
clean it up slightly.  At least it might save someone else some work,
as it took a fair amount of experimentation to get it to work.

      -dp

--
Daniel.Price at gmail.com; Twitter: @danielbprice
