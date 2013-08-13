From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Aug 2013 14:21:39 -0300
Subject: [Buildroot] Processor clasification
In-Reply-To: <806C53D969FD42429BD6758EEA7CF891@JohanW7>
References: <806C53D969FD42429BD6758EEA7CF891@JohanW7>
Message-ID: <520A6B23.30801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2013 12:23 PM, Sagaert Johan wrote:

> Hi all;
>  
> What is the correct classification ?
>  
> When entering uname -a , the cpu spec is specified as armv6l , so what
> is the relation with the selection menu 
> example CORTEX A9..
>  
> So if i have a cpu that tells me from the datasheet it is an 'armv6te'
> what is then the right selection in the cpu variant menu ?
> It confuses me a bit.

Hi.
Cortex A9 & co are ARM cores (ARM920, ARM926, Cortex-A8, and so on).
armvX (X = number) is the ISA implemented, for instance the lowest
common these days would be armv4.
The letters after the ISA number are options, for example T means the
processor supports the thumb instruction set extension... say... armv4t
(some cores support more or less stuff depending on what the vendor chose).
The L means little-endian configuration.
v4 ISA is basically arm 920/922 cores.
v5 ISA is the very common arm 926 core.
v6 ISA are the arm 11 (36/56/76) cores.
v7 ISA are the Cortex A* cores.
v8 ISA are the 64-bit Aarch64 cores.
Usually looking at /proc/cpuinfo can give you some extra detail, for
instance some Cortex A* cores support VFP math and other don't.
http://en.wikipedia.org/wiki/List_of_ARM_microprocessor_cores is pretty
accurate.

Regards.
