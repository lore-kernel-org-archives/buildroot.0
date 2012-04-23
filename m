From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 23 Apr 2012 14:33:35 +0200
Subject: [Buildroot] Buildroot SKIPS PATCHES ???
In-Reply-To: <4F9341C9.8000508@petroprogram.com>
References: <4F9341C9.8000508@petroprogram.com>
Message-ID: <CAAXf6LX+De-fWuqb-nZBGyMkoqBdeqYz+qp=hDkUybCE_a-G4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Sun, Apr 22, 2012 at 1:24 AM, Stefan Fr?berg
<stefan.froberg@petroprogram.com> wrote:
> Good day
>
>
> I have tried adding two new packages to my local copy of buildroot,
> first one is xplc-package (version 0.3.13) and the second one is
> wvstreams (version 4.2.2) which needs xplc.
>
> The first one, xplc, builds nicely.
>
>
> But for some reason, for wvstreams package the Buildroot does not apply
> the patches at all.
> Buildroot just skips all the nine wvstreams patch-files and continues
> configuring ...
> :-(
>
> I have included all files (Config.in, .mk-files and patches) for both
> packages here.
> I would be very gratefull if somebody could help to solve this mystery.
>
> Please contact me at:
> stefan.froberg at petroprogram.com
>

Have you solved this problem already?

I have copied your wvstreams .mk file and one of the patches, and did
not have problems applying the patches.
Which version of buildroot are you using?
Have you tried deleting the entire output/build/wvstreams* directory
(thus removing the stamp files) ?
What is the output of the wvstreams build? It should print a message
about each phase (download, extract, patch, configure, ...).

Do you have other patches or directories inside package/wvstreams ?
The current rules for patching are somewhat complicated and can depend
on such other files. The rules are in package/Makefile.package.in.

Best regards,
Thomas
