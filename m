From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 23:09:48 +0100
Subject: [Buildroot] BR2012.rc1 :: problem to build a new package
In-Reply-To: <CAPEB33ygJQjjcT_fj-kPX1NUSr3C1z3kZvE22uH0dU5LF4n_Vg@mail.gmail.com>
References: <CAPEB33x+aVFQoFgN8FXUDWsdqux4Kgf6cPnpMnxN3eRLedGB2g@mail.gmail.com>
 <201203160054.10741.arnout@mind.be>
 <CAPEB33ygJQjjcT_fj-kPX1NUSr3C1z3kZvE22uH0dU5LF4n_Vg@mail.gmail.com>
Message-ID: <CAHXCMMLkbaQc_rY1vP=yzwaHKDB=0eG1-a-5vdqb93CPt2M31Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johann, all,

2012/3/18 MERCADIER Johann <johann.mercadier@imerir.com>:
> Hi Arnout,
>
> ??Thanks for your suggestions, it helped me. Troubles were caused?by a small
> mistake:
>
>>
>> ?So you should have the line
>> <PKG>_DEPENDENCIES += freetype fontconfig
>> in your .mk file.
>>
> => I forgot to remove the 'lib' prefix from the libraries name, that I got
> with a ldd
>
>
>> ?Normally configure should pick it up automatically then.
>>
>> ?Make sure that the Config.in also has the lines
>> ? ? ? ?select BR2_PACKAGE_FREETYPE
>> ? ? ? ?select BR2_PACKAGE_FONTCONFIG
>
> => this part was already OK
Glad you successfully find your way out :-)

> => Now that's work. FbTerm is integrated and I can launch it. No troubles til now.
> I went to the website and created a signature.
> Now what I am confused with is the proper way to create a patch, do I have to :
> ?? * use the a simple 'diff' ?command, with only the files I modified?
> ?? or
> ?? * use git + git format + git send-mail?... As it's explain here: http://tutoriels.itaapy.com/wiki/tutoriel-git/#bien-configurer-son-git
>
> ??At the end where the signature must be added? Obviously not in the patch All the one I read didn't have such an information on it.
You will find most of the answers here:
http://elinux.org/Buildroot_how_to_contribute

Note that if you didn't had the SOB at commit time, git can add it
when generating patches, just add '-s' option to the git format-patch
command line.
To generate them, I usually use:
$ git format-patch -M -n -s master

As usual, man is your friends ;-)
Have a look at:
$ man git-format-patch
$ man git-send-email

>
> I didn't find relevant relevant information on that part. some infos will be great so as I can finished this part and know it for next time.
You're right, we are working on make it clearer.
We are gathering all pieces of doc and put them in such a way it easy
to find out the relevant information.
It is a continuous process...


Regards,

Sam
