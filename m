From: Anders Blomdell <anders.blomdell@control.lth.se>
Date: Mon, 13 Oct 2008 12:28:41 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
In-Reply-To: <87k5cc24h4.fsf@macbook.be.48ers.dk>
References: <48F1CE78.3040908@control.lth.se>
	<87k5cc24h4.fsf@macbook.be.48ers.dk>
Message-ID: <48F322D9.4070409@control.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Anders" == Anders Blomdell <anders.blomdell@control.lth.se> writes:
> 
> Hi,
> 
>  Anders> in target/device/Atmel/atngw100/Makefile.in there is a line
>  Anders> BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.9.1.config
> 
> Yes, this is done so specific boards can enforce certain
> busybox/uclibc configurations. For most boards this is fine, but you
> can ofcause start to question it for evaluation boards.
To me it looks like this diminishes the value of buildroot for these boards, I
would suggest something like the attached patch (i.e. providing board specific
defaults without forcing the user to always use them)

> Either change the config that it points to or don't select that board
> (or create your own board config based on the atngw).
And put these restrictions in the buildroot documentation, so others will find
it sooner than I did...

Regards


Anders


-- 
Anders Blomdell                  Email: anders.blomdell at control.lth.se
Department of Automatic Control
Lund University                  Phone:    +46 46 222 4625
P.O. Box 118                     Fax:      +46 46 138118
SE-221 00 Lund, Sweden
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: atmel_buildroot.patch
Url: http://busybox.net/lists/buildroot/attachments/20081013/bb270309/attachment.txt 
