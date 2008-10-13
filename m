From: Anders Blomdell <anders.blomdell@control.lth.se>
Date: Mon, 13 Oct 2008 10:06:06 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
In-Reply-To: <20081013073057.GA9429@mx.loc>
References: <48F1CE78.3040908@control.lth.se>
	<20081013081228.14f1e6c7@hcegtvedt>
	<48F2EF1B.70102@control.lth.se> <20081013073057.GA9429@mx.loc>
Message-ID: <48F3016E.9080308@control.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer wrote:
> On Mon, Oct 13, 2008 at 08:47:55AM +0200, Anders Blomdell wrote:
>> Hans-Christian Egtvedt wrote:
>>> On Sun, 12 Oct 2008 12:16:24 +0200
>>> Anders Blomdell <anders.blomdell@control.lth.se> wrote:
>>>
>>>> in target/device/Atmel/atngw100/Makefile.in there is a line
>>>>
>>>> BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.9.1.config
>>>>
>>>> unfortunately this makes it impossible to change busybox config 
>>>> (primarily I want to turn off telnet) to a custom version. What is
>>>> the correct way to handle this?
>>>>
>>> Well, naming indicates that you will need to add a
>>> busybox-<version>.config file.
>> And change the Makfile.in as well, IMHO that is the wrong path to follow.
>>> It is probably a good idea to scrap the <version> part as well, just
>>> have a generic busybox.config file. Kconfig options should not change
>>> that often, and user will be asked to answer yes/no to new features
>>> most times.
>> Is there any good reason at all to unconditionally ignore the busybox 
>> config choosen by the user (many of the Atmel boards and a few other 
>> does this)? Would a patch that just removes all these unconditional 
>> configurations be accepted, or is there any deep reason for not allowing 
>> Atmel users choose their own busybox configuration (and in the default 
>> case choose the buildroot default instead of a board specific one)?
> 
> Did you read docs/README and try what's documented there (see
> "finegrained")?
No, missed that (or more correctly I interpreted that setting
BR2_PACKAGE_BUSYBOX_CONFIG should be equivalent).

Regards

Anders Blomdell


-- 
Anders Blomdell                  Email: anders.blomdell at control.lth.se
Department of Automatic Control
Lund University                  Phone:    +46 46 222 4625
P.O. Box 118                     Fax:      +46 46 138118
SE-221 00 Lund, Sweden
