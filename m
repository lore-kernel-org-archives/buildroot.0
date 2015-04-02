From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Fri, 03 Apr 2015 01:35:41 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <20150402220612.GD4229@free.fr>
References: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
 <20150401223752.0fd358cf@free-electrons.com> <551C6935.3050401@mind.be>
 <20150402000158.0b85c847@free-electrons.com> <20150402220612.GD4229@free.fr>
Message-ID: <551DD24D.4000800@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ;

Ok, added a selection menu in my v4 patch.

Regards  Johan

Yann E. MORIN schreef op 3/04/2015 om 0:06:
> Thomas, All,
>
> On 2015-04-02 00:01 +0200, Thomas Petazzoni spake thusly:
>> On Wed, 01 Apr 2015 23:55:01 +0200, Arnout Vandecappelle wrote:
>>
>>>   Well, I'm in agreement with Johan's earlier statement that the overhead of the
>>> host-lz4 build is negligible. It takes 20 seconds on my laptop, of which 6 are
>>> buildroot overhead from parsing package/*/*.mk.
>> 20 seconds, plus the host-lzop build time that we already build
>> unconditionally.
>>
>>>   Peter said before that all this hacking of linux (or other) config files should
>>> be avoided, and I agree.
>> Correct, except when it's related to needed dependencies in Buildroot.
>>
>> But if that's fine for everyone, I'm OK with merging an unconditional
>> host-lz4 dependency. I'll just follow what the consensus is on this
>> matter, since I don't feel like arguing too much on this
>> not-so-important issue.
>>
>> Thanks for the feedback, definitely very useful to have the opinion of
>> others to help take a decision.
> Well, I always find it very frustrating to build something that I do not
> use. 20 seconds is an eternity (even the 15-or-so it takes here).
>
> Also, I see a lot of people doing this use-case, and being quite
> frustrated:
>
>      make foo_defconfig
>      make linux-menuconfig
>      [Bam, 20s overhead, 35s on slower machines]
>
> Otherwise, 15s for a lzo, yet another 10s for lz4. What next?
>
> I would side with Thomas: add an entry in the Buildroot menuconfig to
> configure what compression to use.
>
> My 2-cent advice... ;-)
>
> Regards,
> Yann E. MORIN.
>
