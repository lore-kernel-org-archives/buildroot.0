From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 11:19:58 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <ef5bbef6-02e5-7c44-bec1-f65896df581f@mind.be>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
 <20190222094056.5f155e17@windsurf>
 <ef5bbef6-02e5-7c44-bec1-f65896df581f@mind.be>
Message-ID: <20190222111958.68393178@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Feb 2019 09:53:18 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Indeed, this use case happens to (almost) work by chance because barebox and
> barebox-aux are two different packages rather than one like for U-Boot. But if
> you anyway have the luck of having such an option, I don't mind adding a little
> bit extra to be able to make better use of it.
> 
>  Perhaps a possibility is to add a config option that prefixes the output name
> with something? You'd still need to rename it in the post-build script (or, more
> likely, handle that in the genimage.cfg file). But it does solve the
> identical-name problem, it looks pretty simple, and it doesn't break anything.

Good idea! It is simple (just one string option), and it preserves
backward compatibility (the default value of the option would be empty).

Markus, could you look at implementing this instead ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
