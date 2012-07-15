From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:16:40 +0200
Subject: [Buildroot] [PATCH v2] Make external toolchain relocatable
In-Reply-To: <CAHXCMMKEWFS82V0wGLGD4Le66zKzGHs2UHd2bzxEvwU7bPbo3A@mail.gmail.com>
References: <1341087767-20528-1-git-send-email-arnout@mind.be>
 <CAHXCMMKEWFS82V0wGLGD4Le66zKzGHs2UHd2bzxEvwU7bPbo3A@mail.gmail.com>
Message-ID: <5002A698.6030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/12 23:18, Samuel Martin wrote:
> Hi Arnout, all,
>
> 2012/6/30 Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>:
> > The external toolchain wrapper sets sysroot etc. to an absolute path.
> > By changing this to a relative path, it is possible to move the host
> > directory to a different location and still have a working build
> > system.
>
> I've just tested your patch on top of my branch, it seems working well
> but doesn't do all the job.
> You have probably focused on the wrapper code and forgot to update
> target of the symlinks of all other tools, pointing to the relative
> location of them instead of the absolute one.

  I just sent a v3.  Care to test it again?

> > This only works for a downloaded external toolchain.  For a pre-installed
> > external toolchain, it is possible to move the host directory to a
> > different location, but not the external toolchain directory (it does work
> > if the external toolchain directory lies within the host directory).  For
> > an internal or crosstool-ng toolchain, there is no wrapper so updating the
> > sysroot path should be done in a different way.
>
> For internal and crosstool-ng toolchains, I think if we want to ensure
> the tools are called with the correct sysroot argument, tehn we should
> use  the wrapper too.

   Good idea.  But then it should be installed in a different place as well.  But
on the other hand, we don't want to go and copy the sysroot directory for
internal/crosstool-NG toolchains...  Bottom line: I'm not going to try it :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
