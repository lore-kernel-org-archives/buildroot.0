From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 27 Aug 2013 07:43:59 -0700
Subject: [Buildroot] Searching for some advice
In-Reply-To: <CAAXf6LXvd6wYTNc1szcU+4NLpbVRdkbJk_yijpWe-_=QUCHASw@mail.gmail.com>
References: <CALo-6+ijsQKnSsHOecR6P5juBBucDx6aogoPkLuXWrQ+yJHvBg@mail.gmail.com>
 <CAAXf6LXvd6wYTNc1szcU+4NLpbVRdkbJk_yijpWe-_=QUCHASw@mail.gmail.com>
Message-ID: <CALo-6+hnBKRTrZV51ERVqGQsHrOf2uENfJeDdwX19JC4RYwx2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

I understand this is not a buildroot issue and appreciate your advice as always.

I have made some progress overnight, so let me describe what I have
done to help others that may end up in a similar state when moving a
kernel version forward in an existing design.

After unsuccessfully taking my 2.6.35 device tree and finding it
incompatible with the 2.6.39 kernel, I went back to the underlying
reference board configuration, in this case an "MPC832x_rdb" and
compiled its defconfig and dts file and the kernel booted, although
the extensions done for our design are of course, non-existent.

But, ... given a kernel that boots with a device tree, I can now add
the missing pieces back in.

Charles

On 8/27/13, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Charles,
>
> [this doesn't really have anything to do with buildroot, but anyway...]
>
> On Tue, Aug 27, 2013 at 12:21 AM, Charles Krinke
> <charles.krinke@gmail.com> wrote:
>> Its my turn to be a noob today.
>>
>> I have a powerpc design using the mpc832x_rdb that is currently
>> 2.6.35.12 and I am trying to test compile 2.6.39 and am hung up in a
>> freeze right after the dtb is loaded.
>>
>> I am searching for an opinion or two on:
>>
>> a) What are the things most likely to cause a freeze after loading dtb
>> between a 2.6.35.12 kernel and 2.6.39 where the dtb has not changed
>> and
>
> From your explanation I take it that you compared the device trees in
> the linux kernel source tree (arch/powerpc/boot/dts/mpc832x_rdb.dts)
> between both kernel versions, correct?
>
> When you say 'freeze' what exactly do you mean? Did you get any output
> at all from the kernel? Any output afterwards? Are you sure the kernel
> is actually frozen, or maybe there is just no serial output?
> You could try to manipulate a LED (or other device) from some points
> in the kernel, to get some proof whether the kernel actually stopped
> completely or there is a serial output problem.
>
> How are you booting? How is the device tree passed? Are you sure the
> device tree is actually present from the location the kernel tries to
> load it from?
>
> Did you verify the kernel configuration? If you compare your original
> config with the one from the new kernel: does everything look OK? Did
> you effectively run 'make oldconfig' from the kernel sources to
> migrate the config?
> I recently also tried updating kernels, and noticed that if you just
> give the new kernel to buildroot, it will do some automatic
> application of the old config to the new kernel, without actually
> launching oldconfig. I didn't double check this (my memory may be bad)
> but the end result was anyway that some things were misconfigured.
>
>>
>> b) Is there any way to debug the kernel when it freezes after loading
>> the dtb other then admire it when it freezes.
>
> If you have access to a JTAG probe that would obviously help, because
> you could then step through the kernel.
> Alternatively, you could consider kdb or kgdb, but I haven't used them
> before and I don't know how early they are setup during boot. Very
> likely they are not yet available if the freeze is already during
> device tree loading...
>
> If there is any serial output before loading the device tree, you
> could dig in the kernel and add printk statements to zoom in on the
> problem.
>
> Best regards,
> Thomas
>


-- 
Charles Krinke
