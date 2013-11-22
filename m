From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 16:20:49 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122091411.59d82eb5@skate> (Thomas Petazzoni's message of
 "Fri, 22 Nov 2013 09:14:11 +0100")
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
Message-ID: <87y54go432.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 > A patch has been sent by Thomas DS to make libglib and all its reverse
 > dependencies not available on !MMU. I believe it's the good way to go
 > for now, until we have a proper patch to make libglib2 usable on !MMU
 > systems. Peter, can you merge http://patchwork.ozlabs.org/patch/292839/ ?

Done.


 >> avr32 |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/e22d94fca3eabb4e54d82af04319f17ad8e10c20/

 > Simon Dawson has already sent a patch to fix this:
 > http://patchwork.ozlabs.org/patch/293203/. Peter, can you merge this.

Done.


 >> arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c3082693fe0da0c54d4bbf950dd6d74e1395c1d9/

 > libvncserver needs thread support.

Ahh, I already tried fixing that in:

commit b6ee44b6d497f412b5b6c6223462a8a687c82af7
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Wed Nov 13 09:07:41 2013 +0100

    libvncserver: fix build without pthread
    
    Fixes http://autobuild.buildroot.net/results/761/7618028d0781269d2f6f0a14d814da456f207475/
    
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


But the openssl support in libvncclient apparently doesn't look at that
option. I'll take a closer look.


 >> mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/fd7e7e53290f235b540ed5f3c784e2584fdb41e0/

 > There is no support for mips64 in QtScript, which uses JavaScriptCore.
 > Options are:

 >  * Disable the possibility of enabling QtScript on mips64el/mips64

 >  * Adapt the patch that was done for webkit-gtk to allow
 >    mips64el/mips64 usage: http://patches.openembedded.org/patch/51625/

The first approach seems simples/safest for 2013.11.


 >> arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1ec3664f28492bf3da53dcbe8ceeb165bce8df6d/

 > Patch has been sent to fix this:
 > http://patchwork.ozlabs.org/patch/293270/. To be applied.

Done.


 >> mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/bab68bcf8714f215ac0b0c2546fa06608377fbb0/

 > Fixed by http://patchwork.ozlabs.org/patch/293207/.

Done.

-- 
Bye, Peter Korsgaard
