From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 11:27:51 -0500
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
 <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>
Message-ID: <OF56171A80.616C14AA-ON86257BE4.0059D6AD-86257BE4.005A710F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 09/12/2013 
11:18:06 AM:
 
> In fact, I have the same thing, but the actual problem is that w3m is
> missing on the system, which can be fixed with 'sudo apt-get install
> w3m'. After this, the text version builds fine.

Thanks! That fixed my problems, I guess I didn't even check to see if
I had that package installed. I didn't think of checking to see if w3m
was installed - thanks for pointing out the obvious :)

> Samuel: shouldn't we check the dependencies for building the manual
> before someone attemps to do that? On my Linux Mint system
> (=Ubuntu-based) I had to install asciidoc (which pulled in a lot of
> tex deps) and w3m.

One I idea I had to solve these dependancies issues between specific
versions and packages for all the different distro's is to add all 
of the packages that are needed for building manual or any other 
buildroot maintenance script (stuff that is in support/scripts) to
buildroot as host packages and then put together a 
buildroot_maintenance_defconfig that will build all of the packages
need for the host system to run this scripts. Let me know what 
you think about that and we can maybe continue this discussion 
in a different thread. 

> Best regards,
> Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/467b18d7/attachment.html>
