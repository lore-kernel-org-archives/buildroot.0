From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Fri, 23 Mar 2012 20:19:02 +0000
Subject: [Buildroot] Need an advice while porting Links with FrameBuffer
	support
Message-ID: <CAPEB33zYC=NcZk__9PG3RWJQKwnurkvRCO+3jAzGCpjCO7PTrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
  I currently try to port the Links webrowser for using it with the
native-framebuffer only.
  Then I had to add the "libgpm", a library needed for mouse device.
  From there I had to correct one of the file from this library which used
an old header file "stropts.h" (STREAMS interface).

  So now I'm confuse as I don't know where to put the patch? If I send this
patch to the maintener of the libGPM waiting after it could take ages
before we could get a working version. My 2nd asking is about GIT use. Do I
have to create a new branch for each of my "issues"? Here is want I
intended to do, but I will prefer to have a good advice before doing wrong
thing...
i) create a branch for LINK
   modify package/Config.in
   create package/links/Config.in
   create package/links/link.mk

ii) create a branch for patching libgpm and work in it
    Do what is needed
    Create the patch

iii) Back to the LINK branch
    make
    check if it works as it should be (Test on the target)
    create patchs
    Send them

iv) Back to master

Is that a good way to proceed or thing can be made easier or in a better
way?
All suggestions are welcome!

Thanks
-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120323/dc07445b/attachment-0001.html>
