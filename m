From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 9 Mar 2012 19:50:41 +0000 (UTC)
Subject: [Buildroot] Howto track/trace segfaults on ARM ?
References: <1531E53627F1F749B4FE809BF2A4EB67030D4CBD@WETMEX10.loepfe.com>
Message-ID: <jjdmuh$lro$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-09, Vellemans, Noel <Noel.Vellemans@visionBMS.com> wrote:

> Probably not the GOOD place to ask for this information, but.. Going
> to give it a shot.
>
> I'm still working on WebKit-1.6.3 for buildroot (which seems to work
> , at least , I get in compiled..)
>
> FYI: I'm cross-compiling for ARM (imx537).
>  
> But, when running the WebKit Code (GtkLauncher, which is a
> mini-WebKit-browser) I get a lot of crashes / segmentation faults /
> aborts.
>
> Is there somebody that can point me in direction on how to find/trace
> these segmentation faults ... ???? 

Load the core file into gdb and type "bt".

You'll need to have built with debug symbols and you need to run gdb
where it has access to the un-stripped object files (and prefereably
the source trees of the programs in question).

-- 
Grant Edwards               grant.b.edwards        Yow! Uh-oh!!  I forgot
                                  at               to submit to COMPULSORY
                              gmail.com            URINALYSIS!
