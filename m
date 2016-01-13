From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Wed, 13 Jan 2016 09:43:10 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
In-Reply-To: <569579C5.1010409@mind.be>
References: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
 <569579C5.1010409@mind.be>
Message-ID: <alpine.DEB.2.11.1601130838470.11251@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2016, Arnout Vandecappelle wrote:

> Date: Tue, 12 Jan 2016 23:10:13 +0100
> From: Arnout Vandecappelle <arnout@mind.be>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
> 
> Hi Jonathan,
>
> On 11-01-16 13:45, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> This patch adds the ypbind-mt package that contains a multithreaded
>> ypbind daemon for Linux. It uses threads for better response and
>> supports the ypbind protocols version 1, 2 and 3. ypbind finds the
>> server for a given NIS domain and stores information about it in a
>> binding file on the local host.

[snip]
>> diff --git a/package/Config.in b/package/Config.in
>> index f3b4812..b226518 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1476,7 +1476,7 @@ endif
>
> There's something funky about this patch fragment (i.e. it's wrong). Did you
> manually edit it?
>
>>  	source "package/xinetd/Config.in"
>>  	source "package/xl2tp/Config.in"
>>  	source "package/xtables-addons/Config.in"
>> +	source "package/ypbind-mt/Config.in"
>
> This conflicts with your own yp-tools submission from a few hours before. You
> should put these patches in a single series to avoid that kind of problem.
>
>>  	source "package/znc/Config.in"
>>
>>  endmenu

[snip]
Hi Arnout,
TP explicitly asked to submit yp-tools and ypbind-mt in separate 
submissions.

It is not clear to me how to submit a patch that depends on another 
pending patch having been applied. The possibilities that I see are:

1. Patch against the current origin and ignore the fact that there is a 
dependency on the yp-tools patch having been applied

2. Provide the same line added by the patch for yp-tools as part of this 
patch. That is, the ypbind-mt patch would add two lines to 
package/Config.in.

3. Provide a patch for ypbind-mt that assumes that the patch for yp-tools 
has already been applied to the origin.

What is the correct decision?

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
