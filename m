From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Wed, 30 Nov 2011 18:33:12 +0200
Subject: [Buildroot] OT: Using oprofile
In-Reply-To: <4EB19B97.10902@carallon.com>
References: <4EB19B97.10902@carallon.com>
Message-ID: <CAMP44s0oPqwswyMRMTV+aSnLNQQZRsmG+XVJB1kwgwyPEDS-Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 2, 2011 at 9:35 PM, Will Wagner <will_wagner@carallon.com> wrote:
> I know this is slightly off topic, but I assume some buildroot users must be
> doing this...
>
> I want to use oprofile on my target, which I have the basics working (using
> buildroot master). However I am having two problems which I am not sure how
> to work around:
>
> - when trying to profile with vmlinux it fails saying objdump is not
> installed (which it is not). It says I can pass in the kernel range, I'm
> just not sure how to get it.

You can read the soucecode, objdump is a shell script. Check
get_image_range() and run the objdump commands on your machine.

> - the app I would like to profile is stripped and I have no source on the
> target. I want to get more detailed call info so I assume I need to copy the
> collected data back onto my build machine where I can then do the analysis.
> Is this the correct way of doing it? Does anyone have examples of what they
> do.

You need the debug symbols. They can be installed in a separate
location, but you need them. There are some hacks that could be used
on some systems so you don't need those symbols (I remember we used
something like that for the Nokia N900), but that's pretty obscure.

Cheers.

-- 
Felipe Contreras
