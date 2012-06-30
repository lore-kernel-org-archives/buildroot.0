From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 15:02:12 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
 configured to do so
In-Reply-To: <20120630105559.7e57508a@skate>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate> <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate>
Message-ID: <4FEEF8D4.4080702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/30/12 10:55, Thomas Petazzoni wrote:
> Le Sat, 30 Jun 2012 10:32:14 +0200,
> Peter Korsgaard<jacmet@uclibc.org>  a ?crit :
>
>>   Thomas>  I am not fully sure I like this. Do we want to have the same
>>   Thomas>  stuff in all packages, or should we think about doing this
>>   Thomas>  globally in some way?
>>
>> Agree, I've added it globally now.
>
> Yes, seen that, great. Does this addition of -static to TARGET_LDFLAGS
> play well with --enable-static for AUTOTARGETS packages?

  --enable-static should mean that static libraries should be built,
while -static says that the executable should only be linked with
static libraries.  But of course, with all the non-standard autotools
stuff out there, you never know...

  I expect that adding -static to LDFLAGS will break quite a few packages.
Would it be possible to add a BR2_PREFER_STATIC_LIB test to the autobuilds?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
