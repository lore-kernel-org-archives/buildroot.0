From: Michael Schweikart <micky@schweikarts-vom-dach.de>
Date: Wed, 11 Nov 2015 11:58:17 +0100
Subject: [Buildroot] issue with dhcp on buildroot
In-Reply-To: <56431CF2.6090405@mind.be>
References: <2864886.JM8PMHTYst@mars> <56431CF2.6090405@mind.be>
Message-ID: <56431F49.6020808@schweikarts-vom-dach.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

no if i start it from the command line it is the same behavior.
Yes ping to the configured device works.

best regards

On 11.11.2015 11:48, Arnout Vandecappelle wrote:
> On 11-11-15 09:47, Michael Schweikart wrote:
>> Hi,
>>
>> i have setup a buildroot environment and build it. I deploy it on device under
>> test and the systems boots up(Kernel Version 4.3). As soon as the network and
>> udhcpc (v1.24.1) starts i get the following messages.
>>
>> Sending discover...
>> udhcpc: sendto: Invalid argument.
>> Sending discover...
>> udhcpc: sendto: Invalid argument.
>> No lease, failing
>   Is it possible that the Ethernet device doesn't exist yet when udhcpc starts?
>
>   When you start it from the command line, does it work?
>
>> If i setup an static ip address i am able to ping the device under test. I try
>> to ping a IP form the device under test i get the following error.
>>
>> ping: sendto: Destination address required
>   So you did the following:
>
> ifconfig eth0 up 192.168.1.1
> ping 192.168.1.2
>
>   and you get the 'Destination address required' error?
>
>   Does ping to the configured address work?
>
>   When you wireshark the link, do you see anything coming out?
>
>
>   Regards,
>   Arnout
>
>> Is there anybody out there how can support me?
>>
>> best regards
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
