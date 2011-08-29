From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 29 Aug 2011 17:58:29 +0200
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E4A28C1.1070509@free-electrons.com>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
 <4E43F72C.4060005@in-2-technology.co.uk> <4E441E25.4010600@fosstel.com>
 <4E444173.3090509@fosstel.com> <4E44FA0A.1000902@free-electrons.com>
 <4E454A63.6030401@free-electrons.com> <4E45673C.4010903@fosstel.com>
 <4E4A28C1.1070509@free-electrons.com>
Message-ID: <4E5BB725.9030408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pedro,

I've just sent a patch for this issue, could you test it ?

Maxime

On 16/08/2011 10:22, Maxime Ripard wrote:
> Hi,
> 
> On 12/08/2011 19:47, Pedro Sanchez wrote:
>> Thanks Maxime for looking at this. Indeed, my workstation is running
>> Linux 64 bits. I'm glad to know that cross-compiling Python goes well on
>> a 32-bit OS. I'll have to fire up a VM just to run BR :-|
> 
> Or maybe we can just fix this bug :)
> 
>> On the specific problem we have, I don't have any insight yet. All I can
>> tell you is that I did the exercise of building BR w/Python using three
>> different toolchains (CodeSourcery, Crosstool-ng, and uClibC) and I got
>> exactly the same disappointing results**.
> 
> Neither am I. I don't get why a cross-toolchain which runs fine could
> fail to build a specific module. After all, on 32 and 64 bits, we use
> the exact same toolchains (at least for the Code Sourcery one.).
> 
> After all, the host-python should be compiled for 64 bits using the
> native toolchain, and the target one compiled (in our case at least) for
> 32 bits, with the cross-toolchain. There shouldn't be any 64-to-32 bits
> compilation at all.
> 
>> Maybe this can help?
>>
>> http://blog.devork.be/2009/02/compiling-32-bit-python-on-amd64.html
> 
> Yep, I ran into that trick last week too. I'm not sure this is a good
> one though. This is a good quick fix, but I wonder what will happen if
> your target is a 64bits architecture ? Moreover, this adds the
> dependency to gcc-multilib.
> 
> Peter, what do you think of it ?
> 
> Maxime
> 


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
