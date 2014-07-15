From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 14:25:00 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <53C562F6.8080705@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>	<1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>	<20140714130104.480ab4cf@free-electrons.com>	<53C405A3.3080301@mind.be>	<20140714212346.5ef7bfad@free-electrons.com>	<53C52F0D.70004@zacarias.com.ar>
 <20140715191515.160512e4@free-electrons.com>
 <53C562F6.8080705@zacarias.com.ar>
Message-ID: <53C563EC.6090904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/2014 02:20 PM, Gustavo Zacarias wrote:

> On 07/15/2014 02:15 PM, Thomas Petazzoni wrote:
> 
>> Except that trying to detect if it's required will still make the
>> dependency on host-gettext mandatory.
>>
>> What would be good to have is <pkg>_GETTEXTIZE + a check that verifies
>> whether the gettextize is still needed or not. This way, on the
>> packages on which we'll be adding <pkg>_GETTEXTIZE = YES, we will
>> notice when the <pkg>_GETTEXTIZE = YES can be remove after an upstream
>> bump.
> 
> Detecting if it's required via gettext.m4 says if it's using the infra,
> but you must do a grep for the serial usually in $(@D)/m4/gettext.m4 to
> know if it's a different version.
> If we do a silent warning it will probably pass unnoticed, making it
> fatal would be best probably - though we never did that kind of
> behaviour before it would only affect bumps.
> Regards.

And i forgot to cc@ the list again, broke it when adding Yann before :)
Looking at the source upstream had the great idea of NOT updating the
serial so that won't work, sigh...
Regards.
