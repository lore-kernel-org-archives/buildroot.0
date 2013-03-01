From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 10:19:19 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <CAKduhSsmDGk2w8p79_KY7Zb5hwdH0D-2z7kAcQK_Q5rakZGhfg@mail.gmail.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <513011C9.8030301@je-eigen-domein.nl>
 <CAKduhSsmDGk2w8p79_KY7Zb5hwdH0D-2z7kAcQK_Q5rakZGhfg@mail.gmail.com>
Message-ID: <20130301101919.50560ec2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Thu, 28 Feb 2013 20:25:59 -0800, Daniel Price wrote:

> That build problem in V8 is exactly the same as the one I had to fix
> in my nodejs (which also uses V8) patch, which I posted today.  See
> https://code.google.com/p/v8/source/detail?r=12094 for the fix.
> 
> Thomas, if we're going to have V8 in multiple places, perhaps it
> should be a separate package?  On the flip side, I don't know how
> sensitive webkit and nodejs are to version skew in V8.

That would be ideal indeed, but I'm not sure how easy it is to do. The
qt5jsbackend can indeed use an external V8, but it must be an external
V8 *source* tree, not installed V8 libraries/headers in $(STAGING_DIR).
So it's not as easy as "internal png" vs. "external png" for example.

What I would propose is to get Qt5 and NodeJS merged separately, and
then, if we find some time to work on getting the V8 stuff common, then
we'll do it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
