From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 11:40:02 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <CAMbDF3+bn0hyNGLz42r-kXXS+6BL2Wig-ZHxhG7fOFyEhTQS7g@mail.gmail.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
 <CAMbDF3+bn0hyNGLz42r-kXXS+6BL2Wig-ZHxhG7fOFyEhTQS7g@mail.gmail.com>
Message-ID: <20171212114002.6f48877f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 10:04:38 +0100, Johannes Schmitz wrote:

> I find it definitely useful for debugging. I wouldn't have been able to
> isolate the issue with the size and CRC without this option because if you
> want to compare with hexdump you want everything to exactly match to see
> what's wrong. Without this, the next person might go down the same way like
> myself. The default of uboot when saving the environment is 0x00 and the
> default of mkenvimage is 0xFF. My idea is to make it the same to (0x00) to
> make the developers life easier. My experience is that any of these details
> takes some amount of your time to sort out so a less confusing default can
> safe time for everyone. On the other hand people might want to deliberately
> set it to 0xFF to exactly check the boarders of the env partition on the SD
> card, especially during development of genimage.cfg. Furthermore it makes
> you understand quicker what happens during env image generation. If you
> hide the option from the user/platform developer again makes life harder. I
> am speaking from the point of view of a buildroot newcomer. Now of course I
> now what's going on but would that option have been there it would have
> saved me one afternoon.

Hm, ok. I'm still not super convinced, but the code/complexity isn't
big enough to really argue more than that :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
