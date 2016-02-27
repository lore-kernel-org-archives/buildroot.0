From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:00:46 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
	package/Makefile.in so it exists globally.
In-Reply-To: <56D1A1E6.7020601@mind.be> (Arnout Vandecappelle's message of
 "Sat, 27 Feb 2016 14:17:26 +0100")
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
 <20160216213554.60f53246@free-electrons.com>
 <56C3A41B.7070200@mind.be>
 <CAM+bi4t1R+Dd_aF_OHV_MeGRHyFi3PZD5kfwmCqcYtWK=bvS3A@mail.gmail.com>
 <20160217094715.19c767b3@free-electrons.com>
 <56D1A1E6.7020601@mind.be>
Message-ID: <87y4a5rey9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> Arnout, what do you think? In addition, I think it would be good t In
>> addition, I think it would be good to In addition, I think it would
>> be good to o

 >  I agree we should go for (1).

Yes, I also think this is the sanest / simplest thing to do.

 >  However, this doesn't completely stop the 'make menuconfig savedefconfig': once
 > a .config file exists, you can still do that. But it could have some funky side
 > effects (not that I can think of any right away, but it feels a bit iffy). So I
 > think it would be good to enforce that all the noconfig_targets can only be
 > called on their own on the command line. This would block completely silly
 > things like 'make menuconfig defconfig' (it would also block potentially valid
 > things like 'make foo_defconfig menuconfig', but I think adding an extra '&&
 > make' in the middle of that is not so painful).

No, that seems ok (as long as it is clear from the error message that
you need to do so).

-- 
Bye, Peter Korsgaard
