From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 18:37:20 +0100
Subject: [Buildroot] Supporting multiple versions of toolchain
	components?
In-Reply-To: <20140212090324.4cb9fe84@skate>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>	<52F936C7.4040300@mind.be>	<20140210234117.352533a5@skate>	<52F9D9D0.8090409@mind.be>	<20140211093221.28248844@skate>	<52FA5AD8.4040506@mind.be>
 <20140212090324.4cb9fe84@skate>
Message-ID: <52FBB150.3000306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 09:03, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 11 Feb 2014 18:16:08 +0100, Arnout Vandecappelle wrote:
> 
>>> That is indeed true, but I'm pretty sure some advanced users test the
>>> latest versions of the various components.
>>
>>  Do you sometimes do run-time tests of internal glibc toolchain builds?
> 
> Obviously before sending the patch that adds 2.19, I did do a run-time
> test of a minimal ARM glibc+Busybox system in Qemu. The amount of
> testing is minimal, but at least it boots all the way to userspace.

 Yes, but will you do more runtime experiments with glibc 2.19 in the
next 6 months? Probably not, because you simply don't need it.

[snip]
>>  But I didn't realize that the autobuilder test package configurations,
>> not glibc issues, and the packages will fail with either version of
>> glibc. So you're right, this point is moot.
> 
> Your point is not entirely moot. C library headers will be different
> between glibc 2.18 and 2.19, so you could imagine having package build
> failures specific to a given version of glibc. This is typically what
> we have with uClibc (and which was discussed at length during the
> latest meeting), where we have multiple versions of uClibc that don't
> behave the same as they don't offer the same features. However, the
> amount of application-visible changes between glibc 2.18 and 2.19 is
> probably a lot smaller, but maybe not inexistent.

 I think about one third of our autobuilder configurations use an
(e)glibc-based toolchain, with varying versions, and AFAIK we've never
seen a failure on one glibc version but not on others. So I think we can
safely say it is close to non-existent.

> 
>>  So it's just the additional complexity of having the choice, duplicating
>> the patches (none for glibc 2.19), and carrying the legacy. I guess
>> that's not too bad.
> 
> Yes.
> 
>>> Again, I believe what you're proposing is a fairly radical move from
>>> the Buildroot tradition. So we need to get some consensus or decision
>>> here.
>>
>>  Note that I'm not immediately advocating for removing the multiple
>> version support where we have it already. Rather, I propose to not add
>> more multiversion packages.
> 
> I certainly agree with you on this. I would propose to:
> 
>  1/ Remove the multiversion selection on Busybox, because I don't
>     really see why we have this specifically for Busybox.
> 
>  2/ Keep a maximum number of three gcc, binutils, gdb and C library
>     versions. Like: the latest one, the N-1 (default), and the N-2.

 OK!


 Regards,
 Arnout

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
