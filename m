From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 07:32:52 +0100
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <CAJkQPOnp5gk+GZc6BewOCqtv4EnktvNe=DXbdJv-fgh8Lsdvyg@mail.gmail.com>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
 <50FA9D96.60802@mind.be>
 <CAJkQPOnp5gk+GZc6BewOCqtv4EnktvNe=DXbdJv-fgh8Lsdvyg@mail.gmail.com>
Message-ID: <5100D594.7000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 12:30, Aras Vaichas wrote:
> On 19 January 2013 13:20, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> On 17/01/13 15:47, Aras Vaichas wrote:
>>> Hello,
>>>
>>> I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
>>> to use the Linux kernel version from
>>> http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
>>> which is a specific tag in the git repository.
>>>
>>> In Buildroot I set:
>>> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>>> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1
[snip]
>>   Note that the gitorious archive URLs have an important disadvantage:
>> if the archive is not already in the cache, than the site will respond
>> with a '202 Accepted'.  I think wget treats this as a success, so
>> buildroot will try to untar that placeholder file.
>
> Thank you. Yes, I did notice the delay the first time I tried to
> download the tarball. I figured this would be a problem.
>
> I'm currently configuring Buildroot for a company, so I want (need) to
> provide links that will always work.


  You can of course use the git download method instead of the tarball. 
Since you're downloading a tag, a shallow clone should work, so the 
overhead compared to a tarball is limited.

> I think what I will do is create
> a davinci patch against a particular version of Linux and tell the
> company to store the patch in their own source repository. That
> guarantees that they can always get the file and re-recreate the same
> same kernel - assuming kernel.org always has a copy of the original
> kernel source for a particular version. :)

  To make things reproducible, it is anyway advisable to set up a 
BR2_PRIMARY_SITE where the tarballs are kept. It's a bit of a pain to 
maintain such a primary site, but it does solve a lot of potential issues 
(e.g. the kernel.org website going down :-).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
