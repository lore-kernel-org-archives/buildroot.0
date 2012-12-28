From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 28 Dec 2012 11:18:06 +0100 (CET)
Subject: [Buildroot] Setting up Perf for buildroot
In-Reply-To: <CAPDLWs_Y9e_ecsk=U-PteDfFA=B8t9krpc8CM5ZzAYJ2uwH-hQ@mail.gmail.com>
Message-ID: <45ecb208-6863-4266-9091-ec981005978b@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

my guess is that ideally the config entries should be in packages->debug tools, but the makefile should be integrated in the linux kernel makefile

I don't think it's possible with KConfig, though...


maybe add a perf directory in the packages/ dir with only the Config.in and use the variables set by that Config.in within the kernel makefiles to build the tool


(that's just an idea, I havn't looked precisely how it's done)

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> De: "Kaiwan Billimoria" <kaiwan.billimoria@gmail.com>
> ?: buildroot at busybox.net
> Envoy?: Vendredi 28 D?cembre 2012 05:26:08
> Objet: [Buildroot] Setting up Perf for buildroot
> 
> 
> Hi All,
> 
> I saw this message titled "[Buildroot] elfutils and the perf
> userspace tool" (see below) on the buildroot mailing list. Last
> email is shown below:
> 
> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
> Dear Bogdan Radulescu,
> 
> On Thu, 6 Dec 2012 08:10:12 -0800 (PST), Bogdan Radulescu wrote:
> 
> > I noticed now that this is in the newer versions. I tried to build
> > it
> > without libelf even though it will be pretty crippled but still I
> > didn't have any luck. http://pastie.org/pastes/5489305/text
> > 
> > I tried with using 3.7-rc3. In 3.4.22 isn't patched for building
> > without libelf. On which version did you manage to build it for
> > ARM?
> 
> I never built perf for ARM so far, so I can't really help,
> unfortunately.
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
> 
> 
> I too am very interested in getting the 'perf' tools onto buildroot.
> I would be willing to try this and submit a patch for the same (in
> fact I already have one from
> another source that seems to work, successfully cross-compiling perf
> for ARM), but before that, I have a question:
> 
> 
> What would be the appropriate location in the buildroot tree for
> 'perf'?
> Packages branch? Am asking as, of course, perf is a Linux *kernel*
> (but) user-space component/tool (it lives under
> <kernel-src-tree>/tools/perf).
> So should we look at inserting a patch as part of the 'kernel' menu
> or under 'packages' itself?
> 
> 
> TIA!
> Kaiwan.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
