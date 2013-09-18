From: Michael Rommel <rommel@layer-7.net>
Date: Thu, 19 Sep 2013 00:31:57 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
	from the URL address
In-Reply-To: <523A118C.8080001@trzebnica.net>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <5239CA66.4000108@trzebnica.net>
 <9FA76BDE-EE31-4C40-B226-FBBBDFB35FCE@layer-7.net>
 <523A118C.8080001@trzebnica.net>
Message-ID: <08C45844-EB1B-4340-B512-CF37E0007815@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

> What we have now is:
> about 800 package URLs without trailing slash 
> about 230 package URLs with a trailing slash
> 
> We have following possibilities:
> *  current package URLs:
> 1. leave all current package URLs as they are
> 2. change all current package URLs for those without trailing slash
> 3. change all current package URLs for those with a trailing slash
> 4. other action (what?)
> *  new package URLs:
> a. add the trailing slash to all new package URLs
> b. other action (what?)
> 
> What should we do : 1+a, 2+a, 3+a, 4+a, 1+b, 2+b, 3+b or 4+b ?

given the volume of updates on this mailinglist, actually, one idea could be to first agree on what would be the recommended way to put URLs in the Config.in files.

Either way, a possible method could be to adjust the packages gradually, as they are upgraded. As Thomas said, the URLs should be tested before we change them.

Another way could be to write a script that takes the URLs and checks whether we get a 301 back. These can probably be safely changed to the newly provided location if it just adds a trailing slash.
This could give the cleanup a bit of a head start and could probably also clarify, if my original assumption, that I got from the RFC holds true in the real world.

Thanks for your suggestions!!

  Michael.
