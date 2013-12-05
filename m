From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 18:59:58 +0100
Subject: [Buildroot] pcduino
In-Reply-To: <1386129765.18658.57.camel@kokopelli>
References: <1386129765.18658.57.camel@kokopelli>
Message-ID: <52A0BF1E.3050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/13 05:02, Brian Beattie wrote:
> I'm working on adding support for the pcDuino V1 board, this is an
> Allwinner A10 based board so I'm using the cubieboard as a staring
> point.  The issue I have is that or U-Boot and the kernel this is not a
> problem, however for sunxi-boards and sunxi-tools, the commit id is in
> the Makefile.  I'd like to know what the experts think the best approach
> is.  I currently have the Makefiles patched.
>
> I could update the Makefiles, but I don't have a cubieboard to test
> with.

  It's just a more recent version of those packages, right? Not a 
different branch or repo? Then it's OK to submit patches to update those 
versions. You can put some people in CC with a request to test it, e.g. 
Carlo Caione <carlo.caione@gmail.com>, the original author, or Carlos 
Quijano <carlos@crqgestion.es>, who bumped it for cubieboard2.


> I could modify the *.mk and Config files to make the commit id a
> configurable item and if not set use the current commit ID.  I started
> to do this, but sunxi-tools has a Config.in and a Config.in.host and I'm
> not sure how to handle setting one variable that would be used in both
> files.  Suggestions, pointers welcome.

  Configurable package versions are generally a bad idea. If it is really 
necessary, you could add a choice in sunxi-boards that offers a few 
well-defined versions or repos.

  Regards,
  Arnout

>
> Some other approach I have not thought of.
>
> BTW I did the original KB9202 support many years ago though I have been
> away for a while. (that board just bit the dust which is why I bought
> the pcDuino).
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
