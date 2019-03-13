From: scsijon <scsijon@lamiaworks.com.au>
Date: Thu, 14 Mar 2019 09:32:10 +1100
Subject: [Buildroot] ? using compilers other than gcc!
In-Reply-To: <4380_1552287778_5C860822_4380_384_1_20190311070256.GA2834@r-lnx-nyma7486-2>
References: <43556bee-b905-8e11-c71d-d87aa92d13f5@lamiaworks.com.au>
 <4380_1552287778_5C860822_4380_384_1_20190311070256.GA2834@r-lnx-nyma7486-2>
Message-ID: <e72359ef-5378-3799-2b57-399c3a042c61@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 11/03/19 18:02, yann.morin at orange.com wrote:
> sccijon, All,
> 
> On 2019-03-11 13:04 +1100, scsijon spake thusly:
>> Downloaded the latest 2019-02 buildroot, I found where to set musl, but
>> can't see how to change the compiler from gcc to another and I want to try
>> the latest pcc?
> 
> Buildroot only supports gcc.
> 
>> However it has now seriously surfaced again into the general linux world,
>> with a few decent step-ups, and worth at least looking at as far as i'm
>> concerned, like it's still fast and tight and it's MUSL aware, needs only
>> one library package for us to work with, builds it's own GCC, and can
>> rebuild itself. And NO it doesn't do everything GCC does, but do we really
>> need all that.....
>>
>> Links worth looking at are
>> https://www.phoronix.com/scan.php?page=news_item&px=PCC-Still-Going-2016;
> 
> That dates back from more than 3 years ago now...
> 
>> http://pcc.ludd.ltu.se/supported-platforms/;
> 
> Nothing new in the "News" section since July 2015 (almost 4 years ago
> now).
> 
>> https://lwn.net/Articles/255558/.
> 
> Article dated from 2007. Hardly recenti either...
> 
> So much so for something that "has now seriously surfaced again", I'm
> afraid... :-/
> 
>> Yeah, I know none of them are new, but the people behind the latest stuff
>> put it in the work, not the doc's.
> 
I did say the articles were dated, I just included them for those that 
had not heard if it and wanted some background. I also said they were 
putting time on the system, not publicity documentation.

> Their cvs (irk!) server is down:
>      http://pcc.ludd.ltu.se/fisheye/
>      503 Service Temporarily Unavailable

"cvs -d :pserver:anonymous at pcc.ludd.ltu.se:/cvsroot co pcc" works, 
that's the listed way to download it as stated on their download page, I 
don't know about the /fisheye/, I suspect it's part of the old (unused) 
reporting system that was abandoned when it had crashed and moved.

> 
>> You can get it and it's library at http://pcc.ludd.ltu.se/ftp/pub/pcc/ if it
>> interests you.
>>
>> So, back to the question, how can I use it?
> 
> Short answer: you can't.

ok, I just asked, it's just buildroot's configuration wording seemed to 
allow alternatives, but I couldn't work out how to, thus this question.

> 
> Long answer: you can prepare a set of patches against Buildroot, to
> enable using an alternate compiler, but this is probably a daunting
> task, as everything everywhere in the infra expects gcc. Packages
> also expect gcc, and when they do allow for something else, it's
> probably clang, not pcc. Also, pcc is C only. So, such an endeavour
> would probably last years before you could eventually select pcc in
> Buildroot.
> 
> So, if I were you, I wouldn't hold my breath...
> 
> The best candidate nowadays for an alternative to gcc, is clang.

no, I want something that is totally portable/relocatable, which is why 
i'm looking at pcc in the first place.

> 
> Regards,
> Yann E. MORIN.
> 

Thanks anyway, I shall just go to one of the alternatives, it's actually 
supprising how many have appeared out there for musl, they are just not 
as far advanced as buildroot, and having used buildroot in the past I 
thought I would start with it.

scsijon
