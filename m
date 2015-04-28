From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Tue, 28 Apr 2015 06:38:34 +0000
Subject: [Buildroot] uClibc build verbosity control
References: <C2D7FE5348E1B147BCA15975FBA230756659BC9F@IN01WEMBXB.internal.synopsys.com>
 <20150427092110.GF8309@waldemar-brodkorb.de>
 <64AC6559-D358-40F8-8543-1C2D6DEEE01E@gmail.com>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230756659BE0C@IN01WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 28 April 2015 01:46 AM, Bernhard Reutner-Fischer wrote:

On April 27, 2015 11:21:10 AM GMT+02:00, Waldemar Brodkorb <wbx@openadk.org><mailto:wbx@openadk.org> wrote:


>Hi Vineet,
>Vineet Gupta wrote,
>


>> Hi,
>>
>> uClibc verbosity control V=xx is different from other mainstream


>projects: namely Busybox and Linux kernel.


>> To print full cmdlines (when debugging obscure toolchain issues) we


>need to pass V=2 whereas kernel/busybox take V=1.


>>
>> Can this be changed (I can provide a patch) assuming this doesn't


>break existing scripts upsetting some people.


>>
>> My issue is specifically when using likes of Buildroot, there's no


>obvious way to get the cmdlines of uClibc and/or other projects (unless
>there's some obvious way I'm missing).


Just add V=2 to make flags used for uclibc?

Still requires manually hacking some Makefile etc, since V=xx is tyoically given at cmdline once for entire build.



>
>Good idea. Send a patch. I am pro.


I found the terse output with just defines rather neat.
If there is consensus that the current V=1 has no benefit then we can drop it in favour of just silent 0 and fully verbose 1.


No, the idea is to keep both V=1 and V=2, but make them like other projects.
e.g. in kernel build, V=2 prints the single liners, while V=1 prints the verbose cmdline,
While in uClibc it's the other way around. Same with Busybox AFAIKR.

Simple patch below addresses that, please consider applying.
---------------------->8-------------------------
