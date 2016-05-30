From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 May 2016 23:31:53 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <20160530210928.GA19307@airbook.vandijck-laurijssen.be>
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
 <20160530095319.GA5804@airbook.vandijck-laurijssen.be>
 <87a8j73lz2.fsf@dell.be.48ers.dk>
 <20160530210928.GA19307@airbook.vandijck-laurijssen.be>
Message-ID: <744ed421-d308-297d-a497-251a7756c0d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/30/16 23:09, Kurt Van Dijck wrote:
>>
>> Hi,
>>
>>  > I understand the zsh problem, on the other hand,
>>  > any number prefixed with a 0 is octal, isn't it?
>>
>> Apparently not to zsh. I haven't found any official notice about it, but
>> googling around shows this (old!) patch:
>>
>> http://www.zsh.org/mla/workers/1995/msg00518.html
>>
>>  > Anyway, I'll re-think the patch too...
>>
>> Just moving up the SHELL= line above this check should be enough.
> 
> I see, but how would that help when bash is not on the system?
> Is bash a prerequisite?

 Yes, bash is a prerequisite. Some of our own scripts are bash scripts.
Moreover, quite a few packages just assume that the shell is bash. Requiring
bash and setting is as SHELL is the simplest way to handle that.

> 
> I was thinking on using /bin/printf to avoid using the shell builtin.

 I don't have /bin/printf, only /usr/bin/printf...

 Regards,
 Arnout

> 
> Kurt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
