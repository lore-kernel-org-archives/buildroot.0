From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 22:58:27 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <87y42tc4fl.fsf@dell.be.48ers.dk>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
 <87y42tc4fl.fsf@dell.be.48ers.dk>
Message-ID: <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 22:07, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 15-09-16 12:04, Peter Korsgaard wrote:
>  >> I'll put out a 2016.08.1 release with this Saturday or Sunday. Anything
>  >> else that should be included in this bugfix release?
> 
>  >  There are still a whole bunch of autobuilder fixes that came in after the
>  > release, but probably most of these are due to -next things.
> 
>  >  Things like
>  > 4e9292f package/fbterm: fix download site
> 
> This is not really critical as we have a copy on sources.b.o, but OK, it
> is also not a "dangerous" change.
> 
>  > 3ca860a glibc: fix MIPS and SPARC builds for glibc < 2.24 with recent binutils
>  > could be useful as well.
> 
> Isn't that just for fixing builds against binutils 2.27 (which isn't in 2016.08)?

 Ah, yes, missed that bit.


 TBH, I don't think it's worthwhile to include any other patch in 2016.08.1, not
even the fbterm one. It's just more effort than it's worth.


>  >  But nothing is really screaming that it should be included.
> 
> Ok. We should probably figure out if we need to revert the CMAKE_SYSROOT
> addition (e8c3755676) and include that if needed.

 Er, why would we need to revert it? Did I miss something?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
