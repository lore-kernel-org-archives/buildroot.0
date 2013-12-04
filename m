From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Dec 2013 11:12:10 -0300
Subject: [Buildroot] [PATCH] flac: update to version 1.3.0
In-Reply-To: <1386150285.4433.2.camel@sven>
References: <1386108662.6732.3.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>	
 <529E5DCA.7080105@zacarias.com.ar> <1386150285.4433.2.camel@sven>
Message-ID: <529F383A.1040407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 06:44 AM, Sven Neumann wrote:

> On Di, 2013-12-03 at 19:40 -0300, Gustavo Zacarias wrote:
>> Hold off this one a bit, IIRC it failed miserably to run on MIPS and/or PPC.
>> Let me retry and see before comitting it.
>> Regards.
> 
> Fine with me. I have only tested builds on two ARM platforms (XScale and
> Cortex-A8).

On qemu-mips-malta i get a floating point exception when encoding a
simple wav file (might be qemu at fault).
For powerpc altivec is still leaking inside leading to build failures
(or probably bad code) since it seems there are no powerpc processors
without altivec? 8-O
I'll concoct a patch for the altivec failure and test it, though i'd
need someone to test mips on real hardware.
Regards.
