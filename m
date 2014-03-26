From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Wed, 26 Mar 2014 08:01:31 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-triggerd: new package
In-Reply-To: <5331E316.4030706@mind.be>
References: <1395734396-31668-1-git-send-email-rebillout@syscom.ch>
 <1395734396-31668-2-git-send-email-rebillout@syscom.ch>
 <5331E316.4030706@mind.be>
Message-ID: <53327B4B.2010005@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>   For the other dbus-* packages, the dbus dependencies are repeated (even
> though they're automatic because of the depends on DBUS). So I would do
> that here as well. And that means of course that there should also be a
> comment in case of missing toolchain features. See dbus-cpp for an example.
You're right, I forgot the comments, and the host-pkgconf dependency as 
well.
I will do as you suggest for the DBUS dependencies.

>   Patch misses a description + Signed-off-by.
Correct.

>   If you're anyway patching the Makefile, you can just as well make it:
>
> CFLAGS?=-Wall -O3
> CFLAGS+=`$(PKG_CONFIG) --cflags dbus-1`
> LDLIBS+=`$(PKG_CONFIG) --libs dbus-1`
>
>
>
>   Will you send this patch upstream?
Yep. I will send a patch right now.


>   This should be $(TARGET_CONFIGURE_OPTS) which includes all of the above
> and more.
OK. Actually, I've always been wondering it was OK to use 
TARGET_CONFIGURE_OPTS in a generic package, I never dared to do it.

>   Note BTW that the patch above refers to LDLIBS instead of LDFLAGS. Is
> LDFLAGS used?
Yep, LDFLAGS is used automatically by Make in this Makefile.



Thanks for your comments, I will send the patch upstream a wait a little 
for the author's comments on it.


Regards


-- 
Arnaud R?billout
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140326/f245da9a/attachment.html>
