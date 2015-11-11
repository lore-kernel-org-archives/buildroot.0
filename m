From: Michael Schweikart <micky@schweikarts-vom-dach.de>
Date: Wed, 11 Nov 2015 17:56:03 +0100
Subject: [Buildroot] issue with dhcp on buildroot
In-Reply-To: <5643291E.1040902@zacarias.com.ar>
References: <2864886.JM8PMHTYst@mars> <5643291E.1040902@zacarias.com.ar>
Message-ID: <56437323.5080400@schweikarts-vom-dach.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

yes you are completely right. The configuration is for a x86. When I 
change to the glibc it works.
Many thanks.

best regards

On 11.11.2015 12:40, Gustavo Zacarias wrote:
> On 11/11/15 05:47, Michael Schweikart wrote:
>
>> Hi,
>>
>> i have setup a buildroot environment and build it. I deploy it on 
>> device under
>> test and the systems boots up(Kernel Version 4.3). As soon as the 
>> network and
>> udhcpc (v1.24.1) starts i get the following messages.
>>
>> Sending discover...
>> udhcpc: sendto: Invalid argument.
>> Sending discover...
>> udhcpc: sendto: Invalid argument.
>> No lease, failing
>>
>> If i setup an static ip address i am able to ping the device under 
>> test. I try
>> to ping a IP form the device under test i get the following error.
>>
>> ping: sendto: Destination address required
>>
>> Is there anybody out there how can support me?
>>
>> best regards
>
> Hi, by any chance is that x86? (not x86_64)
> Because kernel 4.3 and uclibc don't see eye-to-eye and this is one of 
> the problems i've got when trying that combination.
> Switching to some other libc (musl, glibc) has no problem, and any 
> uclibc variant has this problem.
> I guess it's related to the x86 vm86 patches/rework that went into 
> 4.3, since rolling back to 4.2.x makes the problem go away.
> Regards.
>
