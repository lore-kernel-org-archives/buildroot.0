From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 15 Dec 2014 12:31:56 +0000
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <CABbD_XBC4pGrQJtNrOXajgt0kFQ62CHhVo7f4dHnTBv_Ue4c7g@mail.gmail.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <CABbD_XBC4pGrQJtNrOXajgt0kFQ62CHhVo7f4dHnTBv_Ue4c7g@mail.gmail.com>
Message-ID: <1418646715.4981.17.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

On Mon, 2014-12-15 at 12:43 +0100, K?roly Kasza wrote:

> I would add another case: when BR is used to build a system without a
> dedicated console, but the
> SoC can be modified to provide one (like a NAS without a serial port,
> but with miniUART inside).
> In those cases I've seen OEMs use askfirst in inittab, as it uses less
> memory then a getty always waiting.
>  
> 
>         I'm not sure if the same thing works for SysVinit so marking
>         it
>         dependent on Busybox init.
> I think it does, but I will test it also when I'll have time.
> 
> 
> Anyway, I like this option. Also tested it with my build: x86_64 build
> and target platform, uClibc, GCC 4.9.2, kernel 3.18 w/ integrated
> initrd, VMware PXE booted, openvmtools included. Works as intended.
> 
> 
> Tested-by: Karoly Kasza <kaszak@gmail.com>
> Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Thanks a lot for your feedback.

I just wanted to add that IMHO this might be even a default option.
I didn't do it as default because this is a new option and it's a good
practice to no mark new options as default.

But if this patch gets accepted probably in the future we may set it as
default.

Reason is simple - if you build something not from X_defconfig (which
was created and tested by some other guy so it is expected to work) then
chances are high that you will select improper serial port and its
settings. Just because there's too much rope... tty{0|S|AMA|ARC|...} and
all speed and other things.

But let's first make sure this change is accepted.

-Alexey
