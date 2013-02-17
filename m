From: Shawn J. Goff <shawn7400@gmail.com>
Date: Sun, 17 Feb 2013 18:22:53 -0500
Subject: [Buildroot] Adding a ModemManager package
In-Reply-To: <51214BB2.4090907@mind.be>
References: <51210E6F.6000504@gmail.com> <51214BB2.4090907@mind.be>
Message-ID: <5121664D.2070207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 02/17/2013 04:29 PM, Arnout Vandecappelle wrote:
> On 17/02/13 18:07, Shawn J. Goff wrote:
>> I'm trying to add a ModemManager package. While building, I'm getting
>> this error during the installation step: "/usr/lib/libgcc_s.so: file not
>> recognized: File format not recognized". This looks like it's looking at
>> my host's libgcc_s.so instead of the target's version. If that's the 
>> case
>> I'm not sure why or how to fix it. I did have to use autogen.sh to 
>> create
>> the configure script and lots of other stuff; I did this on my host
>> system, so I'm not sure if that is affecting it.
>
>  Hi Shawn,
>
>  I haven't been able to reproduce your issue because your patch didn't 
> include the libqmi package.
Oops... forgot about that. I've been sitting on that patch because 
libqmi v1.0 has some bugs that have been fixed, but they haven't set a 
version number since then, so it's just got a sha for the version 
number. I'll go ahead and submit that, though.

> However, it is very well possible that the issue is caused by running 
> 'autogen.sh'. Is it possible that the libtool patch doesn't get 
> applied? I see that libtool adds "-rpath /usr/lib" to the link 
> command, and I believe the libtool patch removes exactly that.
>
>  To create configure properly, you need to set _AUTORECONF to YES, as 
> mentioned by Thomas. Unfortunately, that is not so easy...
>
Yes - I noticed :-)
> - modem-manager uses gettext macros provided by the gettext package, 
> so you need to add host-gettext to the dependencies. But host-gettext 
> doesn't exist yet - I'll send a patch to add it.
>
Awesome.
> - modem-manager requires gtkdocize to be run. We certainly don't want 
> to add gtkdocize to buildroot. But since it just generates two files 
> for a total of 350 lines, it's easy to add that with a package patch.
Yes, actually, I do that with libqmi, so I'm familiar with that.
>
>  Hopefully this will help you to solve the problem.
>
>  Regards,
>  Arnout
