From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 16 Jun 2015 22:22:46 +0200
Subject: [Buildroot] Problem with package efl 1.14.1
In-Reply-To: <CALW-xeoh40gFPTU_zWeeOF+ZQLxE5-aN8KC1OiR_2ZsmVDXmsQ@mail.gmail.com>
References: <CALW-xeoh40gFPTU_zWeeOF+ZQLxE5-aN8KC1OiR_2ZsmVDXmsQ@mail.gmail.com>
Message-ID: <55808596.2050506@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

No need to send your email to buildroot at buildroot.org and buildroot at busybox.net.
In fact, it's the same mailing list.

Le 15/06/2015 11:54, Guillaume s?tan a ?crit :
> Hello,
> 
> I try to use the package EFL.1.14.1 with builbroot because I must use a touch
> screen with a target arm (ZC706 EvaluationKIt  -- Zynq-7000Soc).

You told me privately that the ZC706 EvaluationKIt have a compatibility issue
with efl. Can you give some details about your issue ? Is the issue is really
related to efl ?

> 
> So, I find this version of buildroot make by Romain Naour
> (https://github.com/RomainNaour/buildroot). But I haven't managed to run this
> version with my settings, I spoke with Romain and even its settings didn't work
> on my computer.

Thanks for testing this series, but there are still some cross-compilation issue
to be fixed (libelementary) and some packaging issue (legacy handling, reverse
dependency, missing package etc...)

If you want to help me on this topic you're welcome, otherwise I recommend you
to first try with the efl 1.7 package which is probably more tested at this time.

> 
> Please, can you explain me what tools are needed to compile buildroot ?
> 

[snip]

> 
> Link to my mistakes :
> http://code.bulix.org/h4r426-88552

I recommend you to select eudev or systemd in order to have
BR2_PACKAGE_HAS_UDEV=y and avoid "unmet direct dependencies warning"
(packaging issue fixed locally)

Your build issue is not related to the efl package here, but host-libglib2-2.42.2.

File "../../gio/gdbus-2.0/codegen/gdbus-codegen", line 34
SyntaxError: Non-ASCII character '\xc3' in file
../../gio/gdbus-2.0/codegen/gdbus-codegen on line 34

I don't know what happened here...
gdbus-codegen is a generated python script, maybe you have some encoding issue
on your machine.

Can you post again your issue related to host-efl package ? (related to link
issue with _eina_log_state)

> 
> Link to my settings:
> http://code.bulix.org/se58te-88553
> 

Best regards,
Romain
