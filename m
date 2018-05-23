From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 May 2018 23:34:54 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <5e270035-af43-1f1f-401c-cfc34b76b435@gmail.com>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <87bmd8ismc.fsf@dell.be.48ers.dk>
 <cb31aa8e-774c-8608-135b-b371f01242ef@mind.be>
 <5e270035-af43-1f1f-401c-cfc34b76b435@gmail.com>
Message-ID: <c5390f0d-cef1-4826-5157-8afa42c170e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-05-18 22:19, Romain Naour wrote:
> Arnout, All,
> 
> Le 23/05/2018 ? 00:08, Arnout Vandecappelle a ?crit?:
>>
>>
>> On 21-05-18 23:52, Peter Korsgaard wrote:
>>>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
>>>
>>> Hi,
>>>
>>>  > See the reply from Arnout and Dagg for gcc 4.9:
>>>  > http://patchwork.ozlabs.org/patch/767087
>>>
>>>  > I'm not sure that the odroidc2 defconfig is able to build with gcc >= 4.9 since
>>>  > it's stuck at kernel odroidc2-3.14.y and uboot odroidc2-v2015.01.
>>>  > Dagg, what do we do for this board?
>>>
>>> I believe that mainline support for this board is fairly far, so if that
>>> is the only thing keeping 4.9 around I think we can drop it.
>>
>>  I voted for keeping 4.9 because quite a few chips are stuck with ancient vendor
>> kernels and U-Boot. For the kernel I'd accept it, but for U-Boot it's generally
>> more difficult to go to an upstream version, there is not much of a security
>> reason to bump U-Boot, and backporting the compiler.h changes is not entirely
>> trivial. I think keeping the 4.9 option makes the out-of-the-box experience for
>> people who are stuck in this situation easier.
>>
>>  Also, "maintaining" the 4.9 version really doesn't pose much of an overhead. At
>> least as long as we support multiple gcc versions, and there are no issues
>> building gcc 4.9 on recent distros.
> 
> gcc 4.9 still build with gcc 8 as host compiler but with a lot of warning.
> 
> Note that we don't keep any specific version of Binutils for gcc 4.9.x.
> It's not sure that recent Binutils version will be compatible with gcc 4.9.x.

 I don't see a reason why recent binutils shouldn't be compatible with old gcc.
People are still successfully building gcc 2.95...

 Regards,
 Arnout

> 
>>
>>  So I'm still voting for keeping 4.9, at least until it starts breaking on
>> recent distros. If we remove something, remove 5.
> 
> Ok
> 
> Best regards,
> Romain
> 
>>
>>  Regards,
>>  Arnout
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
