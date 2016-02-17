From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 17 Feb 2016 09:22:48 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
 package/Makefile.in so it exists globally.
In-Reply-To: <56C3A41B.7070200@mind.be>
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
 <20160216213554.60f53246@free-electrons.com> <56C3A41B.7070200@mind.be>
Message-ID: <CAM+bi4t1R+Dd_aF_OHV_MeGRHyFi3PZD5kfwmCqcYtWK=bvS3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, guys

2016-02-16 23:35 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:

>  Hi Alvaro,
>
>  In addition to Thomas's comments, please use your full name in the
> Signed-off-by line.
>
>
Well, I've been reviewing the original thread (
http://lists.busybox.net/pipermail/buildroot/2015-June/130347.html) in
order to write a good commit and I've just realized that this patch wasn't
in fact written by me, it was written by Thomas in respones to my
inquiries, so I think the Signed-off-by line should in fact belong to him,
not me. Sorry I took over that, it wasn't my intention.



> On 16-02-16 21:35, Thomas Petazzoni wrote:
> >  1/ Why should we care about buildroot-submodule, and if we care, what
> >     is the actual problem ?
>

Because it provides a nice workflow, which even though not perfect, is very
useful at least to me and to Jeremy Rosen, its original author :) Not that
it should matter much to anyone who doesn't use it, I guess.

But, anyhow, reviewing the original thread, the bug this patch solves does
not only affect buildroot-submodule, although I discovered it by using that
piece of software, so the commit message was in fact very wrong, sorry.

There's one case of make invocation that won't work without this patch,
which is this:

make menuconfig savedefconfig

After exiting menuconfig, the following error is reported:

make[1]: /BR2_DEFCONFIG=/d: Command not found
Makefile:849: recipe for target 'savedefconfig' failed
make[1]: *** [savedefconfig] Error 127
common.mk:65: recipe for target 'menuconfig' failed
make: *** [menuconfig] Error 2

>
> >  2/ What do you mean by "use Buildroot from out of tree" ? I do out of
> >     tree builds every day and it works just fine. So this aspect needs
> >     to be detailed.
>
>
As explained above, that was simply false. Oops. I had forgotten about the
details of these and I thought it only affected make -C invocations, but
it's not a matter of current path but of those two make targets invoked at
the same time.



>  I suspect we're not going to like the justification :-)
>

Why not?


Best regards, sorry about all the trouble!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160217/76c9f91a/attachment-0001.html>
