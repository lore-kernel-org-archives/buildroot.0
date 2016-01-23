From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 21:48:22 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <56a3b4eeb29e1_57733f8e785e4ed04615@ultri2.mail>
References: <CAAXf6LVpYZ7vkXWLPB373i0dXDSaLP3tGi+MXWaoVzbXMY_byQ@mail.gmail.com>
 <56a3b4eeb29e1_57733f8e785e4ed04615@ultri2.mail>
Message-ID: <20160123214822.2746cc01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Sat, 23 Jan 2016 15:14:22 -0200, Ricardo Martincoski wrote:

> Maybe there is a solution that does not limit the version of patch, following
> the idea of symlinks or hardlinks.
> It still needs more tests, but it seems to work with patch 2.5.4.
> I created 2 hooks, one before patching to rename the file, and other after to
> rename it back.
> 
> See example below. I used POST_EXTRACT instead of PRE_PATCH because some
> developer could use 'make package-extract', create a copy of the extracted
> directory, edit the needed files and then use diff to create the patch.
> This way hand-editing the patch would not be needed.
> 
> Please let me know if you agree with this approach.

I think you can remove the post patch hook, i.e keep the file named
with the _, and simply adjust:

LIBSOIL_MAKEFILE = "../projects/makefile/alternate Makefile.txt"

to:

LIBSOIL_MAKEFILE = ../projects/makefile/alternate_Makefile.txt

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
