From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 7 May 2012 08:47:10 -0400
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507110012.GB8916@sapphire.tkos.co.il>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
Message-ID: <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Mon, May 7, 2012 at 7:00 AM, Baruch Siach <baruch@tkos.co.il> wrote:

>> ?# v86d's configure script is not autoconf-based: parameters
>> ?# supplied by Buildroot cause it to produce no result; explicit
>> ?# invocation is needed.
>
> Since you don't use Buildroot's autoconf support, this comment is no longer
> relevant.

Well, I thought this would be the explanation why there is a configure
script, yet it is a GENTARGET.

>> +
>> +define V86D_BUILD_CMDS
>> + ? ? $(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
>
> You can used $(TARGET_CONFIGURE_OPTS) here as well.

I tried that, and it did not compile. -D__i386__ should be given
explicitly to cc.

Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
