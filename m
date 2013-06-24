From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 24 Jun 2013 08:22:56 -0400
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
Message-ID: <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Mon, Jun 24, 2013 at 12:41 AM, rh <richard_hubbe11@lavabit.com> wrote:
> On Sun, 23 Jun 2013 23:30:12 -0400
> Frank Hunleth
> <fhunleth@troodon-software.com> wrote:
>
> --8<--
>
>> I'd just like to point to a kernel that is maintained and has the
>> features that I need. The one at github.com/beagleboard/kernel is the
>> obvious choice since that's what's shipped on the Beaglebone Black.
>
> I was asking since I just started trying buildroot myself.

If you'd like to try out my repository for the BBB, feel free to look at:

https://github.com/fhunleth/buildroot-bbb

I don't have much in the line of instructions right now, but it should
build for you. Check out the bbb branch and run "make
beagleboneblack_defconfig" and make. I can run the images from both a
microSD card and eMMC, and things seem to be coming up.

Also, I just put in the PRU's PASM assembler and interface libraries.
I haven't checked it out yet except that it builds and can assemble
the examples.

>
>>
>> The point of my email is just that the github.com/beagleboard/kernel
>> repository is not in a form that nicely integrates with buildroot due
>> to it just containing patches for a Linux kernel. I'm just looking for
>> pointers on how best to handle this.
>
> I think the answer is in the other reply, but I'm not sure yet. From the
> brief time I've used buildroot it seems flexible enough to allow pulling
> stuff from lots of places.

Despite using br for the past few years on a handful of projects, it
seems like every time I update my tree that I learn about a few new
features.

>
>>
>> For the time being, I just ran the github.com/beaglebone/kernel script
>> to create a patched kernel, tarred it up and posted it on a server for
>> buildroot to download. It will become annoying after a few updates to
>> the patch set, and I may consider automating it, but for now it keeps
>> me moving forward. I'll happily change what I'm doing should a better
>> way come up.
>
> I think the ARM stuff needs more work before it's accepted upstream but
> don't know for sure.

Agreed.
