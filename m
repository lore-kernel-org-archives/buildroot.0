From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 18 Sep 2013 22:48:12 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <9FA76BDE-EE31-4C40-B226-FBBBDFB35FCE@layer-7.net>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <5239CA66.4000108@trzebnica.net>
 <9FA76BDE-EE31-4C40-B226-FBBBDFB35FCE@layer-7.net>
Message-ID: <523A118C.8080001@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Michael,


> Hi Jerzy,
>
>
> On Sep 18, 2013, at 17:44 , Jerzy Grzegorek 
> <jerzy.grzegorek at trzebnica.net <mailto:jerzy.grzegorek@trzebnica.net>> 
> wrote:
>>>
>>> Could you clarify why this is desirable? Note that urls with our 
>>> without trailing slash are not identical: the web server needs to 
>>> properly support this. For example, the autobuild website does not 
>>> properly do it (something very annoying ;) )
>>>
>>
>> The only reason is - for BR consistency.
>>
>
> actually I would not recommend to implement that. The RFC 3986 states 
> in chapter 6.2.3: "In general, a URI that uses the generic syntax for 
> authority with an empty path should be normalised to a path of "/".
>
> It is common practise to redirect from the URL without trailing slash 
> to one with a trailing slash. So in essence, in most times when 
> the user selects a url without a trailing slash, an unnecessary  round 
> trip to the web server occurs.
>

Thanks for the clarification.

What we have now is:
about 800 package URLs without trailing slash
about 230 package URLs with a trailing slash

We have following possibilities:
*  current package URLs:
1. leave all current package URLs as they are
2. change all current package URLs for those without trailing slash
3. change all current package URLs for those with a trailing slash
4. other action (what?)
*  new package URLs:
a. add the trailing slash to all new package URLs
b. other action (what?)

What should we do : 1+a, 2+a, 3+a, 4+a, 1+b, 2+b, 3+b or 4+b ?

Regards,
Jerzy


>   Michael.
>
> -- 
> Michael Rommel, Erlangen, Germany
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130918/ab7fcdbe/attachment.html>
