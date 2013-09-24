From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 24 Sep 2013 12:47:59 -0500
Subject: [Buildroot] [PATCH v2 13/17] audit: new package
In-Reply-To: <20130918070020.22ff8ca9@skate>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>	<1378936777-28308-14-git-send-email-clshotwe@rockwellcollins.com>
 <20130918070020.22ff8ca9@skate>
Message-ID: <OF1C36952D.12623546-ON86257BF0.0061A062-86257BF0.0061C58C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/18/2013 
12:00:20 AM:

> In this patch for 'audit', you are replacing a nice C program by a
> Python script, with the argument that it helps cross-compilation. I
> must say I quite disagree with that: building a small C 
> program for the
> host has always been easier than programs that require executing a
> Python script at build time.
> 
> Why not keeping the existing C program, and just adjust 
> the way it is
> built to get it built by the native compiler?
> 
> There is a fairly standardized way of doing that with the autotools,
> that consists in using the CC_FOR_BUILD variable instead 
> of CC to build
> this tool. In native compilation, CC_FOR_BUILD == CC == 
> gcc, while in
> cross-compilation, CC_FOR_BUILD == gcc and CC == <arch-tuple>-gcc.
> 
> See http://www.sourceware.org/autobook/autobook/autobook_270.html.
> 
> There is apparently even an existing m4 macro to define 
> CC_FOR_BUILD:
> http://ac-archive.sourceforge.net/ac-archive/
> ac_prog_cc_for_build.html.
> 
> Or maybe the Python script approach is something that has 
> been agreed
> upon with the audit/SELinux community?

I have been working with the audit community to get this patch accepted. 
There is an issue with the C program not pulling in the correct headers 
when you build it for this host.  The python script is able to get around 
this issue. 

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/de93ba9d/attachment.html>
