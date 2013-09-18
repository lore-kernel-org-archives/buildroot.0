From: Michael Rommel <rommel@layer-7.net>
Date: Wed, 18 Sep 2013 19:56:21 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
	from the URL address
In-Reply-To: <5239CA66.4000108@trzebnica.net>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <5239CA66.4000108@trzebnica.net>
Message-ID: <9FA76BDE-EE31-4C40-B226-FBBBDFB35FCE@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,


On Sep 18, 2013, at 17:44 , Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> wrote:
>> Could you clarify why this is desirable? Note that urls with our without trailing slash are not identical: the web server needs to properly support this. For example, the autobuild website does not properly do it (something very annoying ;) )
>> 
> 
> The only reason is - for BR consistency.
> 

actually I would not recommend to implement that. The RFC 3986 states in chapter 6.2.3: "In general, a URI that uses the generic syntax for authority with an empty path should be normalised to a path of "/".

It is common practise to redirect from the URL without trailing slash to one with a trailing slash. So in essence, in most times when the user selects a url without a trailing slash, an unnecessary  round trip to the web server occurs.

  Michael.

-- 
Michael Rommel, Erlangen, Germany

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130918/2eec9b71/attachment.html>
