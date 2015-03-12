From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 12 Mar 2015 14:35:08 +0000
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
 on target
In-Reply-To: <CANPyyuOMod=OMEtv184PQ+tUFW8Gpqj8wpsB9k3cVg43eOMO9w@mail.gmail.com>
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk> <1426092262.2375.11.camel@synopsys.com>
 <87pp8flblh.fsf@dell.be.48ers.dk> <1426147462.2639.11.camel@synopsys.com>
 <CANPyyuOMod=OMEtv184PQ+tUFW8Gpqj8wpsB9k3cVg43eOMO9w@mail.gmail.com>
Message-ID: <1426170908.2639.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Thu, 2015-03-12 at 08:59 -0400, Mike Williams wrote:
> > Another inconvenience I discovered with SSH - every time I boot my
> > target it gets new fingerprint and then on attempt to ssh to the target
> > I see:
> >  --->8---
> >  $ ssh root at 192.168.218.2
> >  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
> >  @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
> >  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
> >  IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
> >  Someone could be eavesdropping on you right now (man-in-the-middle
> > attack)!
> >  It is also possible that a host key has just been changed.
> >  The fingerprint for the ECDSA key sent by the remote host is
> >  82:b8:c2:cf:88:d6:19:77:60:23:ff:9b:cc:3e:3d:2c.
> >  Please contact your system administrator.
> >  Add correct host key in /home/abrodkin/.ssh/known_hosts to get rid of
> > this message.
> >  Offending ECDSA key in /home/abrodkin/.ssh/known_hosts:49
> >  ECDSA host key for 192.168.218.2 has changed and you have requested
> > strict checking.
> >  Host key verification failed.
> 
> I solved this by copying the SSH keys in /etc to the filesystem
> overlay. SSH won't regenerate them every boot if they already exist,
> so it will speed up your boot time and get rid of this warning. I'm
> not sure you'd want to do that for your production builds though.

Thanks for this hint.

Even though I may use this hint myself locally I'm afraid it's not the
best solution if others want to use the same Buildroot configuration. 

Because to make their life easier I'll need to push those SSH keys in
public repository - and this won't work for upstreaming the board
support in Buildroot.

So at least for now SSH doesn't look as an equally simple option as
Telnet.

Once again - this is because my particular corner-case when rootfs is
built in kernel image. If there is some real non-volatile storage on
target SSH might be a good option still.

-Alexey
