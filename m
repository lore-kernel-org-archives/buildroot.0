From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Sun, 28 Feb 2016 08:43:01 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
 package/Makefile.in so it exists globally.
In-Reply-To: <87y4a5rey9.fsf@dell.be.48ers.dk>
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
 <20160216213554.60f53246@free-electrons.com> <56C3A41B.7070200@mind.be>
 <CAM+bi4t1R+Dd_aF_OHV_MeGRHyFi3PZD5kfwmCqcYtWK=bvS3A@mail.gmail.com>
 <20160217094715.19c767b3@free-electrons.com> <56D1A1E6.7020601@mind.be>
 <87y4a5rey9.fsf@dell.be.48ers.dk>
Message-ID: <CAM+bi4uMCY5fngJNiSbdfxypxucS5U5wxsanAB8LPaKqJzUYzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2016-02-27 23:00 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>   >  However, this doesn't completely stop the 'make menuconfig
> savedefconfig': once
>  > a .config file exists, you can still do that. But it could have some
> funky side
>  > effects (not that I can think of any right away, but it feels a bit
> iffy). So I
>  > think it would be good to enforce that all the noconfig_targets can
> only be
>  > called on their own on the command line. This would block completely
> silly
>  > things like 'make menuconfig defconfig' (it would also block
> potentially valid
>  > things like 'make foo_defconfig menuconfig', but I think adding an
> extra '&&
>  > make' in the middle of that is not so painful).
>
> No, that seems ok (as long as it is clear from the error message that
> you need to do so).
>

I agree. For example from the point of view of buildroot-submodule there's
no problem to invoke make twice, and, as you say, if there's an error
message that explains that two targets cannot be called at once, that's all
right then.

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160228/077824fe/attachment.html>
