From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 1 Oct 2014 11:11:01 +0200
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <2070245131.25765734.1411732584201.JavaMail.root@openwide.fr>
References: <CAM+bi4sfYENe4DM8vDvEen+kSKqQWyyEAReD8NKX9gnHMArjgA@mail.gmail.com>
 <2070245131.25765734.1411732584201.JavaMail.root@openwide.fr>
Message-ID: <CAM+bi4tCHcCha7T5eo1RPTf0fYpOFUjsmy5fhHQ4Nj=-qwHzNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

2014-09-26 13:56 GMT+02:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> That's an incencitive to upstream, no ? :P
>
> more seriously, if you want to do that, I would recommand
> * either renaming the package entirely.
> * or use the OVERRRIDE_SRC_DIR macro (see usermanual)

On this case I would. It's a simple bump version from V2_7 to github master,
but since it's not a release I'm not sure it is desirable. Maybe it's
better to wait for V2_8,
although libconfuse's development is pretty much stagnated.

I don't want to rename the package, because that would mean having to
modify all packages that depend on this one,
so at the end it's less cumbersome to have a custom branch of
buildroot in which I have made these little changes.

>> All in all, however, I'm very happy with the environment your
>> Makefile
>> provides. I've done a couple changes that I hope will publish in the
>> following week for comments.
>>
>
> please do, I'll happily integrate... At this stage the framework satisfies all my needs so I need external ideas to make it live :)

I've just uploaded a few files to this github repository.

https://github.com/agamez/buildroot-submodule

There are only a couple differences between that version and yours.
First, I solved a typo on your Makefile (now called common.mk),
and then I've made it so that several projects can coexist under the
same directory.
Thus, two Makefile exist (Makefile.Project1 and Makefile.Project-X)

Configuration and buildroot generated files for each one are now saved
under Project1 and Project-X directory.

This now satisfies my need of two almost similar projects, sharing up
to 90% source code but with a couple differences.
I need to be able to compile both and have them on different
directories, thus the two output directories.

Now you are able to make -f Makefile.Project1 menuconfig, or make -f
Makefile.Project-X or whatever,
without interfering one project with the other.

I hope you like it!

Regards

-- 
?lvaro G?mez Machado
