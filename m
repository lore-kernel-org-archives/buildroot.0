From: Koen Martens <gmc@sonologic.nl>
Date: Tue, 20 Jun 2017 14:48:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxconsoletools: new package
In-Reply-To: <87a852g8v0.fsf@dell.be.48ers.dk>
References: <201706191656.v5JGuLc9093352@mx1.sonologic.net>
 <20170619214458.7fe41175@windsurf.home> <87a852g8v0.fsf@dell.be.48ers.dk>
Message-ID: <26C8BECF-7913-44B8-89D6-40D3451685FE@sonologic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20 June 2017 14:08:03 CEST, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas Petazzoni
><thomas.petazzoni@free-electrons.com> writes:
>
> > Hello,
> > On Mon, 19 Jun 2017 18:55:06 +0200, Koen Martens wrote:
> >> Linuxconsoletools contains the inputattach utility
> >> to attach legacy serial devices to the Linux kernel
> >> input layer and joystick utilities to calibrate and
> >> test joysticks and joypads.
> >> 
> >> The buildroot package adds options to build only certain
> >> tools.
> >> 
> >> website: http://sf.net/projects/linuxconsole/
> >> 
> >> Signed-off-by: Koen Martens <gmc@sonologic.nl>
>
> > Thanks, I've applied, after doing a few minor tweaks. See below.
>
>Sorry for the slow response, I only noticed the patch now.
>
>We already have (an old version of) this code in the input-tools
>package, so the binaries here will conflict with those.
>
>What is the way forward? Drop the old package and add Config.in.legacy
>handling for the old symbols?

Oops, had i known I would have updated the existing package. That still is an option of course. Revert my patch and bring the input-tools package into 2017. Of course, my patch can install all tools from the upstream archive, whereas the input-tools only installs 3 of them. Also, with the old pkg we would end up with toggles for each individual tool if we want to stay in style.

Is there a specific reason the input-tools package uses the (renamed) debian tarball btw instead of the original upstream?

- Koen

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
