From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 29 Apr 2008 15:07:42 -0700
Subject: [Buildroot] Buildroot ARM toolchain build Error: libexpat
In-Reply-To: <326f33790804281532w187e0968lcc383e59fe65c77a@mail.gmail.com>
References: <326f33790804281532w187e0968lcc383e59fe65c77a@mail.gmail.com>
Message-ID: <326f33790804291507pb562331k1782b1b5c48af0f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A little more info on the problem. I tried to build again using a different
configuration just to see if the problem was unique, but I ran into the same
one again. After a little bit of Google searching, it seems to me that there
might be an undefined symbol error. I looked  at the config.log file to see
if I could find it but couldn't pinpoint anything.

I should also point out, when I look at config.log:

(/root/buildroot/build_arm/avahi-0.6.22/config.log), I see that the line $
./configure has "--disable-expat" in it. Is this why my build is getting the
error that libexpat can't be found?

Thanks for any help!

On Mon, Apr 28, 2008 at 3:32 PM, Arun Reddy <reddyac@gmail.com> wrote:

> Hi everyone,
>
> I have done a kernel configuration for at91sam9263ek, and I am now going
> through the build process. I have fixed up some errors I encountered with
> missing packages, but I then encountered that...
>
> Checking for XML_ParserCreate in -lexpat... no
> Checking for XML_ParserCreate in -lbsdxml... no
> Configure: error: *** neither libexpat not libbsdxml could be found ***
>
> I made sure to install the expat package (apt-get install libexpat-dev)
> and tried to find out if I needed to install the libbsdxml package as well,
> but couldn't find enough information online about what libbsdxml is (it does
> seem like it's just another name for libexpat) or any solutions to this
> error.
>
> Anyone know what the problem here is, and what package I actually need?
> Thanks!
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080429/dbd2f85f/attachment.htm 
