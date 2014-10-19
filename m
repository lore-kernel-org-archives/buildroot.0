From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:54:51 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <54441E9F.8080802@mind.be>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
 <543AD090.3000107@zacarias.com.ar> <543EA87A.2050204@mind.be>
 <543FCDD6.9070104@zacarias.com.ar> <54419C9C.7050705@mind.be>
 <5441BEDE.1000102@zacarias.com.ar> <54441E9F.8080802@mind.be>
Message-ID: <20141019225451.3aa6176e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 19 Oct 2014 22:27:11 +0200, Arnout Vandecappelle wrote:

> > The only shared code in qemu for user vs. system is just basically CPU
> > emulation.
> > For system you've got all of the hardware (audio/ hw/ net/ directories
> > and so on) which isn't used by user at all.
> > For user it deals with what we can call "ABI" (userland, linux-user/ dir
> > in qemu) which isn't used by system at all, and has arch bits as well.
> > When there are system emulations broken with the latest version of qemu
> > it isn't necessarily a problem with the cpu emulation, the same can
> > happen to user emulation without affecting system.
> > So if you're like 100% sure user both will work right if system does for
> > X version go ahead, i don't think it's a safe assumption.
> > Just google around a bit:
> > https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1284344
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=668658
> 
>  So what I hear you say is that there really is a case for specifying the
> qemu-user and qemu-system version separately, and that that's what this whole
> discussion really is about. And I guess you may want to build at the same time a
> host-qemu-user of one version and a host-qemu-system of another version, correct?
> 
>  Still, the .mk file of qemu-user and qemu-system are 90% the same. It would be
> nice to be able to factor that out somehow. However, it makes complete sense to
> have them as separate packages first and merge them later.
> 
>  So the question is: is the need for separate host-qemu-system and
> host-qemu-user versions more important than the additional complexity of
> specifying a nearly-identical .mk file twice?

Despite Gustavo's explanation, I'm not sure to see what is the need to
have a different version for host-qemu-system and host-qemu-user.

If a given version of host-qemu-system works for a given
architecture/platform, then surely, host-qemu-user should work for the
same architecture. The opposite is obviously not true, but it doesn't
matter much: we can keep whatever version gets host-qemu-system working.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
