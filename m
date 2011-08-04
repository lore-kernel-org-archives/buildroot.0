From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 4 Aug 2011 09:28:31 +0200
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
 Buildroot environment
In-Reply-To: <4E396681.4000807@rt-rk.com>
References: <4E396681.4000807@rt-rk.com>
Message-ID: <CAAXf6LVsTZJ0X_2oGYx43ctO2FEX81RqdfJwmBmHtgAiF_a1zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aleksandar,

On Wed, Aug 3, 2011 at 5:17 PM, Aleksandar Zivkovic
<Aleksandar.Zivkovic@rt-rk.com> wrote:
>
> Hi all,
>
> I would like to add additional package to Buildroot that will build Linux kernel driver.
> For that I need:
> - dependency: build of this package mustn't be started before kernel source is available
> - kernel source directory: currently, the best I know is: $(BASE_DIR)/build/linux-$(BR2_LINUX_KERNEL_VERSION)
>
> I started with package approach but bumped to stated dependency problem. Next what I tried is to edit linux/linux.mk to include my driver source download, extract. build and install but not so familiar with Buildroot scripting...
>
>
> Did somebody already done something similar? What is best approach? Examples are welcomed...

The following mail shows the approach I am using.
http://lists.busybox.net/pipermail/buildroot/2011-July/044690.html

In my case, the kernel sources come from a Mercurial repository, but
these settings are easily changeable as the Makefile uses the generic
package infrastructure.

Best regards,
Thomas
