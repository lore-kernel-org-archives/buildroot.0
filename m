From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Sun, 12 Oct 2014 17:56:02 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
In-Reply-To: <543A7D79.7010008@mind.be>
References: <5439D19D.2030706@posteo.de>
 <20141012091818.04db85ae@free-electrons.com> <543A4928.5080901@posteo.de>
 <543A7D79.7010008@mind.be>
Message-ID: <543AA492.2080907@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 10/12/2014 03:09 PM, Arnout Vandecappelle wrote:
> On 12/10/14 11:26, J?rg Krause wrote:
>> Dear Thomas Petazzoni,
>>
>> On 10/12/2014 09:18 AM, Thomas Petazzoni wrote:
>>> Dear J?rg Krause,
>>>
>>> On Sun, 12 Oct 2014 02:55:57 +0200, J?rg Krause wrote:
>>>> I have a package which uses libdaemon for running as a daemoon and for
>>>> creating the pid file. libdaemons default directory for opening the pid
>>>> file is /usr/var/run. However, buildroot does not create this directory
>>>> in the output directory by default. The package compiles successfully
>>>> but fails to run because of the missing directory.
>>>>
>>>> How should I deal with this?
>>>>
>>>> 1) patch libdaemon.mk: LIBDAEMON_CONF_OPTS = ... --localstatedir=/var
>>>> 2) add /usr/var/run to my rootfs overlay directory
>>>>
>>>> What do you think? Any other suggestions?
>>> I'd say (1).
>> Looks good. I will prepare a patch.
>>
>>> Isn't --localstatedir a common autoconf variable ? I see 26 packages
>>> passing --localstatedir=/var in Buildroot. Maybe it's time to move as a
>>> common definition, like --prefix=/usr ?
>> Yes, it is. There was a discussion on the mailing list long time ago:
>>
>>      Making --localstatedir=/var global?
>>      (http://lists.busybox.net/pipermail/buildroot/2011-April/042918.html.)
>>
>> And also this one:
>>
>>      Bizarre things on the allyespackageconfig build
>>      (http://lists.busybox.net/pipermail/buildroot/2013-May/071856.html)
>   +1 to making it a global pkg-autotools option. J?rg, care to prepare a patch
> for that? Removing the existing --localstatedir should be a separate patch then.

I will prepare a patch for this. Should I add this to host configure, 
too? I guess so...
