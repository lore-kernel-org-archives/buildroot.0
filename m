From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 17:59:33 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <20140217090354.1a2b5c73@skate>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>	<5301B63A.5000304@mind.be>
 <20140217090354.1a2b5c73@skate>
Message-ID: <53023FF5.7090703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 09:03, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Mon, 17 Feb 2014 08:11:54 +0100, Arnout Vandecappelle wrote:
> 
>>  I think there is very little reason left to use NPTL on archs that
> 
> I guess you wanted to say "to *NOT* use NPTL".

 Good guess :-)

> 
>> support it, isn't there? So I would first remove the option completely
>> for these architectures. That would also make adding a comment
>> unnecessary (since it becomes an architecture feature rather than a
>> toolchain option).
> 
> While I definitely agree for the internal toolchain backend, I don't
> think this applies nicely with the external toolchain backend. We do
> not control how the external toolchains are built, and it is perfectly
> possible to build a non-NPTL toolchain on a NPTL-supported architecture
> with Crosstool-NG for example.

 Yes, but we certainly don't support all of the possible toolchains that
can be spat out by Crosstool-NG. At least, I don't think so...


> That being said, our choice could simply be to not support these cases
> at all, and check in the external toolchain backend that the toolchain
> has NPTL support if the architecture is supposed to support it.

 ... therefore I'd be in favour of this approach.

> 
> However, this kind of strategy might fail quite quickly for "growing"
> architectures. For example, ARC currently does not have NPTL support,
> but since they appear to be quite active, maybe they will implement
> NPTL support at some point. And at this moment we will have a range of
> stable, well-tested toolchains that are non-NPTL, and the possibility
> of building NPTL-capable, but not fully tested toolchains.

 But that's indeed a very good point that I didn't think of. Indeed, for
these we'll want to support both NPTL and LinuxThreads, therefore we
still need the comments.

 Taking that aspect into consideration, removing the LinuxThreads options
is not bringing any real advantage. So forget I ever mentioned it :-)


 Regards,
 Arnout

> 
> Thoughts?
> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
