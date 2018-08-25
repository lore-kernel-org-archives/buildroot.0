From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Aug 2018 15:58:59 +0200
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <20180825133116.GC2419@scaer>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
 <CANQCQpb6Cgt+YoniwLCd8jGhLdrzCCJDcAyXjcSAWbETrZ=mUQ@mail.gmail.com>
 <20180825133116.GC2419@scaer>
Message-ID: <b3af3af4-1379-7e0c-fff9-329a33064a88@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 25/08/2018 ? 15:31, Yann E. MORIN a ?crit?:
> Matthew, Julien, All,
> 
> On 2018-08-24 18:54 -0500, Matthew Weber spake thusly:
>> On Fri, Aug 24, 2018 at 2:02 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> Now, I also had a look at all the timeouts, and I also noticed a single
>>> other pattern. Julien's and Matthew's autobuilder would always choke on
>>> host-libsodium, and it happens only on those two autobuilders:
>>>     http://autobuild.buildroot.org/?reason=host-libsodium
>>> All failing at the same point:
>>>     checking whether segmentation violations can be caught when using the C compiler...
>>
>> Tried a few things...
>> 1) Setup this config and did a make host-libsodium.  No hang.
>> 2) Took the test code from that configure test and could execute it without hang
>> 3) Doing a full build now and we'll see if there is a sequencing/file
>> configuration driving this.
>>
>> Any other ideas?
> 
> I found the commit that added this check:
>     https://github.com/jedisct1/libsodium/commit/c3045e2cb02dc1dae29cdb0dafd6cdb6469b8de8
> 
> So, does your host compiler runs asan by default? If so, do you have
> ASAN_OPTIONS set in your environment?
> 
> (just throwing random guesses at it to see if any sticks...)


Last time we had autobuilders timeout was due to "futex(wait) system call", see
[1]. I'm not sure it's related but it was another mysterious unreproducible
(locally) bug.

Best regards,
Romain

[1]
https://git.buildroot.net/buildroot/commit/?id=0e162b932d67668a4f075da803efb62b01ec917d

> 
> Regards,
> Yann E. MORIN.
> 
