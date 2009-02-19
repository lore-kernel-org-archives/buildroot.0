From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 19 Feb 2009 14:39:30 +0100
Subject: [Buildroot] BR-2009.01 U-Boot not working on my AT91SAM9261ek
	Board
References: <BAY124-DS7756E1F27FE5A88524B2BD2B20@phx.gbl>
	<871vtubrym.fsf@macbook.be.48ers.dk>
Message-ID: <8FBA208F64F44F5CB99ACBC50EE5CF84@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sent: Thursday, February 19, 2009 12:12 PM
Subject: Re: [Buildroot] BR-2009.01 U-Boot not working on my AT91SAM9261ek 
Board


>>>>>> "QuickX" == QuickX  <quickx@hotmail.com> writes:
>
> Hi,
>
> QuickX> I've finally had some time to attempt to update my project to
> QuickX> BR-2009.02 and noticed some things, so thought I'd share.
>
> QuickX> 1. microperl (default config option) doesn't build on Kubuntu
> QuickX> 8.10 (Make Errors).
>
> Details please.
>
> QuickX> 2. php (default config option) doesn't build on Kubuntu 8.10
> QuickX> (it doesn't try to download but complains it can't find it in
> QuickX> the dl directory).
>
> Details please.
>
> QuickX> 3. U-Boot (Add architecture specific patch -> Add AT91
> QuickX> specific patches to u-Boot) causes u-Boot to not work on
> QuickX> board.
>
> QuickX> Little more info on "3" is if this option is set (default)
> QuickX> then Hyperterminal sits at the at91bootstrap message forever
> QuickX> and doesn't load u-boot.  If I turn this option off and then
> QuickX> issue the following, it works.
>


U-Boot builds if you build manually:
make sure that the buildroot toolchain is in your path.
$make u-boot-unpacked (or similar)
$ cd $(UBOOT_DIR)
$ make <board>
$ make

I have seen this problem as well, that is why I reintroduced the 
1.2.0-atmel.

> Sigh, Ulf - This is your mess, please sort it out.

When I got time.

>
> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
