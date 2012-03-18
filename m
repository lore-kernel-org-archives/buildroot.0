From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Sun, 18 Mar 2012 21:41:09 +0000
Subject: [Buildroot] BR2012.rc1 :: problem to build a new package
In-Reply-To: <201203160054.10741.arnout@mind.be>
References: <CAPEB33x+aVFQoFgN8FXUDWsdqux4Kgf6cPnpMnxN3eRLedGB2g@mail.gmail.com>
 <201203160054.10741.arnout@mind.be>
Message-ID: <CAPEB33ygJQjjcT_fj-kPX1NUSr3C1z3kZvE22uH0dU5LF4n_Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

  Thanks for your suggestions, it helped me. Troubles were caused by a
small mistake:


>  So you should have the line
> <PKG>_DEPENDENCIES += freetype fontconfig
> in your .mk file.
>
> => I forgot to remove the 'lib' prefix from the libraries name, that I got
with a ldd


 Normally configure should pick it up automatically then.
>
>  Make sure that the Config.in also has the lines
>        select BR2_PACKAGE_FREETYPE
>        select BR2_PACKAGE_FONTCONFIG
>
=> this part was already OK


>  As soon as you have something that works more or less, post it and
> we'll give feedback!SO-0809-Leuven-M.S.G
>
 Preferably, use git send-email to send the patch.  That makes sure all the
> tabs and line breaks are properly conserved, and that the commit message
> and authorship is correct.  Also add your Signed-off-by line to the commit
> message (see http://kerneltrap.org/files/Jeremy/DCO.txt).
>
=> Now that's work. FbTerm is integrated and I can launch it. No troubles
til now.
I went to the website and created a signature.
Now what I am confused with is the proper way to create a patch, do I have
to :
   * use the a simple 'diff'  command, with only the files I modified?
   or
   * use git + git format + git send-mail?... As it's explain here:
http://tutoriels.itaapy.com/wiki/tutoriel-git/#bien-configurer-son-git

  At the end where the signature must be added? Obviously not in the patch
All the one I read didn't have such an information on it.

I didn't find relevant relevant informations on that part. some infos will
be great so as I can finished this part and know it for next time.

Thank you in advance.

Regards.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120318/1434eb4e/attachment.html>
