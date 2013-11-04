From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 07:47:15 +0100
Subject: [Buildroot] github tarball urls: http vs https
In-Reply-To: <CAAXf6LUsvpTG1-tNk5aWgR5qNgBYFu0h6a50VkrZ3r4YVviCxQ@mail.gmail.com>
References: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
 <52753AB6.20904@trzebnica.net>
 <CAAXf6LUsvpTG1-tNk5aWgR5qNgBYFu0h6a50VkrZ3r4YVviCxQ@mail.gmail.com>
Message-ID: <527742F3.6070405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/11/13 19:04, Thomas De Schampheleire wrote:
> Hi Jerzy, Arnout, all,
>
> On Sat, Nov 2, 2013 at 6:47 PM, Jerzy Grzegorek
> <jerzy.grzegorek@trzebnica.net> wrote:
> [..]
>>> Packages that are hosted on github and downloaded with the tarball
>>> method, can either have a http or https URL. It seems that a download
>>> from http is redirected to the corresponding https URL. To avoid such
>>> an unnecessary redirect, we could update all github .mk files to use
>>> https directly.
>>>
>>> I vaguely recall a discussion on the mailing list about this, but I
>>> don't know what the outcome was. Was there a problem using the https
>>> URLs with respect to certificates?
>>
>>
>> It was my proposal.
>> Please look here:
>> http://lists.busybox.net/pipermail/buildroot/2013-October/079209.html
>>
>
> Thanks for the link. However, besides a comment from Arnout, the
> discussion was more about the VERSION part rather than the URL itself.
>
> Arnout, in that thread you wrote:
> "Also you change the URL to https here. With the recent problems with
> https URLs that we've seen on the autobuilders recently, I wonder if this
> is a good idea?"

  First of all: I didn't realize that the http URL just redirects to an 
https URL. In that case, obviously, using the https URL is better.

>
> Could you clarify what problems you were talking about?

  IIRC, at some point there was a problem that a download site used a 
certificate signed by a recent CA that was not included in the 
autobuilder's trusted certificate list, so wget would not accept it. It 
was discussed that an option was to run wget with --no-check-certificate, 
but this would defeat the purpose of https so was rejected. Of course, 
using an http URL instead of an https has the same result.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
