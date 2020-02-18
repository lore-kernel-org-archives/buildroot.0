From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 19:44:18 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't recreate staging
 symlink if it exists
In-Reply-To: <CAAXf6LWzJA5tnAXs3KMPip77men=bjgRYKf_KOUizrjP4WHkPg@mail.gmail.com>
References: <20200218150101.22274-1-patrickdepinguin@gmail.com>
 <20200218150101.22274-2-patrickdepinguin@gmail.com>
 <20200218164003.21afcd94@windsurf>
 <CAAXf6LWzJA5tnAXs3KMPip77men=bjgRYKf_KOUizrjP4WHkPg@mail.gmail.com>
Message-ID: <20200218194418.5f38002b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 18:59:49 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> > The question that comes to mind is: why are you building something
> > against the Buildroot toolchain/sysroot, before the Buildroot build has
> > completed ?  
> 
> No, the initial Buildroot build _is_ completed first. Then the
> application build starts according to the scenario described.
> In our case, the extra Buildroot 'make' is done to let Buildroot
> create the images, passing a custom TARGET_DIR which is an extended
> copy of the original output/target. This step happens multiple times
> for different boards, out of the same Buildroot (the boards differ a
> bit in our own software plus perhaps some other customization done in
> the rootfs). From the perspective of the application build, the fact
> that Buildroot 'make' is called shouldn't matter because all the files
> it needs will not be touched. Buildroot itself is also retained as-is,
> except it is asked to produce images.

Ah, ok. Convoluted use case, but OK. Anyway, the change makes sense, so
we'll apply. Thanks for the additional explanation!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
