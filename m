From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 12 Nov 2012 00:34:13 +0100
Subject: [Buildroot] [PATCH 02/23] manual: make clean target consistent
 with others in buildroot
In-Reply-To: <50A02D3E.8060701@mind.be>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-3-git-send-email-s.martin49@gmail.com>
 <50A02D3E.8060701@mind.be>
Message-ID: <CAHXCMMJC5CA4jtpX9HscYhpq-E5jntjkrWYej6CZi=SBwy7dSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/11 Arnout Vandecappelle <arnout@mind.be>:
> On 11/11/12 14:14, Samuel Martin wrote:
>>
>> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> index 1eaf73a..83d2fcb 100644
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -38,10 +38,10 @@ $(call
>> GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
>>   $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P
>> latex.output.revhistory=0")
>>   $(call GENDOC_INNER,$(1),text,txt,text,Text)
>>   $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
>> -clean: clean-$(1)
>> -clean-$(1):
>> +clean clean-$(1): $(1)-clean
>
>
>  I think you can safely remove clean-$(1) - or should we consider this API?
Actually, I kept it to, at least, not break the release.
IIRC, Peter generates the manual and includes it in the release tarball.
That's why I choose the safe path ;-) but I can remove it as soon as
Peter has confirmed it does not break anything.

Regards,

-- 
Sam
