From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Sep 2015 09:27:08 -0300
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <20150925140611.13ec8719@free-electrons.com>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
 <20150923230236.5b5c5302@free-electrons.com>
 <0dc07792d2e04be6b1628563695e9e28@LysExc01.nanotronic.local>
 <20150925140611.13ec8719@free-electrons.com>
Message-ID: <56053D9C.6030703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/09/15 09:06, Thomas Petazzoni wrote:

>> Size is no reason. Including IPv6 support is a matter of a few kilobytes.
>>
>> So my resolution is to add IPv6 support to the linux kernel we use to.
>
> What is the size difference of the kernel with/without IPv6 enabled? If
> it's very significant, then maybe we need to revisit this? Gustavo?
>
> Thomas

Hi Thomas.
Size delta kernel 4.2.1 x86_64_defconfig:
System is 5879 kB vs 5704 kB
Not much.

Keep in mind that even if we introduce the ipv6 option back this will be 
an issue anyway with glibc and musl-based systems since the kernel might 
lack ipv6 as well, sounds more like a bug than anything else.

Regards.
