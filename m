From: David Corvoysier <david.corvoysier@orange.com>
Date: Wed, 11 Dec 2013 15:05:03 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52A862B4.50103@orange.com>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
 <52A842A3.3010302@mind.be> <201312111325.49600.yann.morin.1998@free.fr>
 <52A862B4.50103@orange.com>
Message-ID: <52A8710F.7040406@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I did another try from a clean environment and the second 
solution didn't work either: LIBGLES_DEPENDENCIES has the right 
(modified) value when it the LIBGLES_CONFIGURE_CMDS is evaluated, but 
not when the dependencies themselves are evaluated (I think it happens 
in pkg-generic.mk).

So, the build doesn't fail on the LIBGLES_CONFIGURE_CMDS test, but if 
the xx_userland package has not been installed beforehand, it is not 
installed automatically when libgles is built.

David

Le 11/12/2013 14:03, David Corvoysier a ?crit :
> Guys,
>
> The first solution did not work (as yann pointed out, the variable is 
> not exported), but the second does.
> Who's in for a patch (me ?)
>
> David
>
