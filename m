From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 09:05:36 +0100
Subject: [Buildroot] [PATCH] glibc: add 2.19 as a supported version
In-Reply-To: <20140210234117.352533a5@skate>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>	<52F936C7.4040300@mind.be>
 <20140210234117.352533a5@skate>
Message-ID: <52F9D9D0.8090409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 23:41, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Mon, 10 Feb 2014 21:29:59 +0100, Arnout Vandecappelle wrote:
> 
>>  How useful is it to offer a choice for the libc version?
>>
>>  For uClibc it makes a tiny bit of sense because you may have custom
>> patches or a custom config, which you don't want to port when going to a
>> new buildroot version. But I don't think that's a very good reason to
>> begin with.
>>
>>  For glibc, however, I really don't see a reason to keep multiple versions.
> 
> My plan was to offer no more than two versions: N-1 and N, so that we
> can add N, and give it some testing before having all users move

 I don't think there will be a lot of testing happening there...

> immediately from N-1 to N. This is pretty much what we do with gcc,
> binutils and gdb as well. I believe the toolchain components are quite
> critical, that's why we're a bit more conservative with these than with
> the other components.
> 
> Do we have a reason to keep multiple versions for binutils, gcc and
> gdb, but not for glibc?

 No, I don't think we have a reason to keep multiple versions for
binutils, gdb, and also busybox BTW.

 For gcc it's a bit more appropriate. I have seen (proprietary) packages
that fail to build with a different gcc version - usually because of
-Werror and different warnings in -Wall.


 Having multiple versions also means that you need:

- multiple autobuilder instances (preferably for all architectures) to
cover both versions;

- legacy stuff for the old versions;

- a deprecation path for the old versions.

 So it's really quite a bit of overhead for IMHO limited advantage.

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
