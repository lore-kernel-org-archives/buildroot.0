From: Vadym Kochan <vadim4j@gmail.com>
Date: Fri, 5 Apr 2019 11:50:38 +0300
Subject: [Buildroot] [Q] Make kconfig more flexible with selecting
 options
In-Reply-To: <87o95l112v.fsf@dell.be.48ers.dk>
References: <CAMw6YJJjLr3GwmZzBMymTGnirpW8BoVD9o4B-Hye69=QRLA83g@mail.gmail.com>
 <87o95l112v.fsf@dell.be.48ers.dk>
Message-ID: <20190405085038.GA2725@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Apr 05, 2019 at 07:19:04AM +0200, Peter Korsgaard wrote:
> >>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:
> 
>  > Hi All!
>  > I am almost sure that the idea will be rejected but I will try)
> 
>  > I am trying to make external buildroot trees ability to select any
>  > config option,
>  > even if it is not boolean or tristate.
> 
>  > For example, I have external rpi br2 tree which in case of u-boot would
>  > select default uboot board name as "rpi_3_32b" (BR2_TARGET_UBOOT_BOARD_DEFCONFIG
>  > if it not set already), something like this:
> 
>  > ----------------
>  > config XXX
>  >     default BR2_TARGET_UBOOT_BOARD_DEFCONFIG "rpi_3_32b"
>  > -----------------
> 
>  > of course to make it possible it needs to extend the kconfig parser,
>  > there is one
>  > RFC which I think allows to select config option with value other than
>  > tristate or boolean:
> 
>  >     https://marc.info/?l=linux-kbuild&m=127956469118089&w=2
> 
>  > and the linux kernel community rejected this approach ( I did not dig
>  > into the implementation in details).
> 
> Applying an unmaintained intrusive patch from 2010 is not really a
> realistic option. Did you try the alternative proposed in the mailing
> list thread?
> 
> E.G. add something like this to your overlay:
> 
> config BR2_TARGET_UBOOT_BOARD_DEFCONFIG
>         string
>         default "rpi_3_32b"
> 
> Then the u-boot defconfig option should afaik default to that.
> 
> But I am not quite sure why you would want to do this in the first place
> instead of just providing a defconfig file with the right options set?

Thank you! I tried just copy whole original BR2_TARGET_UBOOT_BOARD_DEFCONFIG with
different value and it did not work, but your shorter sample really
works. So thank you for your suggestion)

Regards,
Vadim Kochan
