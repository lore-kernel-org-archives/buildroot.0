From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 00:29:07 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <55EF5C7D.3040908@openwide.fr>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
 <55EF582F.1090407@mind.be> <55EF5C7D.3040908@openwide.fr>
Message-ID: <55EF6133.8060309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-09-15 00:09, Romain Naour wrote:
> Hi Arnout, All,
> 
> Le 08/09/2015 23:50, Arnout Vandecappelle a ?crit :
>> On 08-09-15 21:27, Brendan Heading wrote:
>>> Fixes :
>>> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
>>
>>  So, we now have three versions to fix this:
>>
>> Romain patches gdb to avoid recursing in the doc directory [1][2]
>> Vicente does the same but with a sed instead of patch [3].
>> Brendan adds host-texinfo to dependencies (this patch) [4].
>>
>>  Which one do we choose?
>>
>>  host-texinfo takes a bit of time to build because it also depends on
>> host-ncurses, but it's not a huge problem.
>>
>>  The best solution is adding an upstreamable --disable-doc, but that will take a
>> bit of work still (esp. because we can't easily autoreconfigure).
> 
> I sent a patch to gdb mailing list to add --disable-docs option but it's not
> tested since I can't regenerate the configure script locally.
> 
> See https://sourceware.org/ml/gdb-patches/2015-09/msg00073.html
> 
> I'm waiting for a review.
> 
>>
>>  So for me Brendan's patch is fine. What do the others think?
> 
> I would prefer to avoid host-texinfo dependency if possible.

 I agree, but perhaps we can commit Brendan's patch until the --disable-docs
option is there.

 Regards,
 Arnout


[snip[


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
