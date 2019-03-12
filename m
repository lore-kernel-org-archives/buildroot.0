From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 09:57:34 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain: allow PIC/PIE without RELRO
In-Reply-To: <32338_1552371732_5C875014_32338_448_1_20190312062209.GC4924@r-lnx-nyma7486-2>
References: <cover.1552286891.git.yann.morin@orange.com>
 <11977_1552286921_5C8604BE_11977_87_1_9c1d9253-d6be-4870-a4dd-b45f5c87742f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <3c26a901-4f69-163b-266a-5627f818b75c@mind.be>
 <32338_1552371732_5C875014_32338_448_1_20190312062209.GC4924@r-lnx-nyma7486-2>
Message-ID: <2d087cfc-e1a4-da43-5b4f-46920b60452c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 07:22, yann.morin at orange.com wrote:
> Arnout, All,
> 
> On 2019-03-12 01:36 +0100, Arnout Vandecappelle spake thusly:
>> On 11/03/2019 07:48, yann.morin at orange.com wrote:
>>> From: "Yann E. MORIN" <yann.morin@orange.com>
>>>
>>> Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
>>> keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
>>
>>  I just checked on my host, and a simple test program compiled with -no-pie
>> -Wl,-z,relro -Wl,-z,now does work, so indeed the two seem to be independent.
> 
> Still, I'd prefer tokeep the select to keep the current behaviour. We
> can drop it later on if someone has a need for it.
> 
>>  I guess it's historical accident that the global full relro and PIE are
>> typically introduced together. From what I understand, they are pretty much
>> independent.
> 
> I talked with Matt on IRC about this the other day, and his reasoning
> for doing so as it is was to mimick the way done on distros (Debian,
> FC?), so it is not a complete accident either. ;-)

 That's what I meant: it's historical accident that Fedora [1] and Debian [2]
started enabling -z,now and -pie at the same time. On their respective wiki
pages that discuss enabling these things, they are in fact treated separately.

 Regards,
 Arnout

[1] https://fedoraproject.org/wiki/Security_Features_Matrix#Userspace_Hardening
[2] https://wiki.debian.org/Hardening#User_Space
