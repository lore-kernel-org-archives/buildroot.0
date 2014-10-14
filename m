From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Oct 2014 23:09:51 +0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <543D7FF6.6060302@zacarias.com.ar>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <20141014195411.GI3500@tarshish> <543D7FF6.6060302@zacarias.com.ar>
Message-ID: <20141014200950.GJ3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Oct 14, 2014 at 04:56:38PM -0300, Gustavo Zacarias wrote:
> On 10/14/2014 04:54 PM, Baruch Siach wrote:
> > That is a heavy dependency. As you noted in another message, it also make 
> > the autobuilder skip this package. I suggest to download just 
> > spidev_test.c from 
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
> > and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). 
> > This solves both the autobuilder issue, and the toolchain headers 
> > dependency.
> 
> Problem is that makes it need a newish kernel which i don't like since
> you can't always run the latest and greatest.
> For instance i'm using it on a 3.10-ish based kernel at the moment and
> if i did that i wouldn't be able to use it.
> I suspect the same logic will apply to other users as well.

Then maybe adding a version choice would be best. spidev_test.c didn't change 
between v2.6.34 and v3.15, so two versions should be enough.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
