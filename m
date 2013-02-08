From: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri, 08 Feb 2013 06:18:38 +0000
Subject: [Buildroot] Running Packages
In-Reply-To: <CAFzEKXETDCU8FTapwDLP1gpTOP=y9ETGjUfrDRxUxMGtkxi-+Q@mail.gmail.com>
References: <CAFzEKXETDCU8FTapwDLP1gpTOP=y9ETGjUfrDRxUxMGtkxi-+Q@mail.gmail.com>
Message-ID: <511498BE.4030108@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 00:55, Aditya Rawat wrote:
> Okay this my first attempt of adding custom packages to Buildroot where
> I added  the "Php" package along with all its extensions.
> After the build when I try the updated image it does seem to have the
> php package installed
> I tried "php -v" in shell and it could not find anything :(
> 
> Is there something I am missing the equation ?, maybe more any other
> configuration that is required.

Hi Aditya,

There are a lot of steps in between. You need to take it one step at a time.

First check that your package is integrated into the buildroot system.

Assuming you called your package php, run the command below to see if
your package is integrated into the buildroot system:

make php-dirclean php

You should see at least the following (and usually a lot lot more):
>>> php Configuring
>>> php Building
>>> php Installing to target

If the the package is being compiled, but just missing from the target,
then watch carefully what happens during the 'Installing to target' step.

By the way, buildroot has a php package. Which version of buildroot are
you using?

Regards,
Dimitris
