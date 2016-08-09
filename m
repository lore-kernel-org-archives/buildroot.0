From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 9 Aug 2016 16:07:59 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <20160809141535.4c9b8169@free-electrons.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
Message-ID: <17850212-c769-63c4-f05b-79adc47f470c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 09/08/2016 ? 14:15, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue,  9 Aug 2016 08:30:32 +0200 (CEST), Thomas Petazzoni wrote:
> 

[snip]

> 
>>          arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/89bf12f8333d47af0cb5775c859e26f300af56cc/
> 
> edje_cc: Critical. Unable to open temp file "(null)" for pre-processor.
> 
> Romain? This looks like a transient error, but I'm not sure.

I already seen this issue on autobuilders but I'm not able to reproduce it
locally...

> 
>> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c3f724afbf79434864be7901dadaf6d848edefea/
> 
> make[4]: *** No rule to make target `../sim/microblaze/libsim.a', needed by `gdb'.  Stop.
> make[4]: *** Waiting for unfinished jobs....
> 
> Yet another case of GDB Simulator build failure :-/ Waldemar ?

I'm not sure the GDB Simulator for microblaze really build/work. We use the
Xilinx fork which provide a pretty old version (7.5 or 7.6).

> 
>>       x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/576eccb104ff23e60bfa9d15ce5bf8cab064a64f/
> 
> Would be fixed by https://patchwork.ozlabs.org/patch/655854/.

As pointed out by Khem Raj, we should be careful with this patch. In doubt
disable lshw for musl.

> 
>>       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/c32851d3497b296904793c7d9af20cc8eb655a27/
> 
> error: assignment of read-only variable 'stdin'
> 
> musl-related.

The issue has already been reported upstream by Brendan Heading and nothing
happened to fix it.

https://www.redhat.com/archives/linux-lvm/2016-February/msg00027.html

> 
>>        nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/3117e3f39cd0b72a9a5d177091e9bbbd3e631363/
> 
> tftpd.c:(.text.startup+0x5c): warning: Unable to reach (null) (at 0x00000000) from the global pointer (at 0x00011a80) because the offset (-72320) is out of the allowed range, -32678 to 32767.
> 
> Romain, is this a known NIOSII toolchain issue?

Humm, not sure. It remind me an old nios2 issue, maybe the gcc compiler require
a backported patch ?

[snip]

Best regards,
Romain


> 
> Thomas
> 
