From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:50:32 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
 _defconfig file
In-Reply-To: <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
Message-ID: <20160225165032.GG12073@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/2016 at 11:24:31 -0500, Patrick Doyle wrote :
> On Thu, Feb 25, 2016 at 11:14 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > Hi,
> >
> > On 25/02/2016 at 17:04:43 +0100, Thomas Petazzoni wrote :
> >> I've Cc'ed Yann on this aspect, and also my colleague Alex who already
> >> saw this problem in the past IIRC.
> >>
> >
> > Yes, that is how I solved it for OE with Yann's advice:
> > http://git.openembedded.org/openembedded-core/commit/?id=9b75f6a5786ff7b2e6219d78b38f0032f100c660
> >
> > oldnoconfig is now an alias for olddefconfig but appeared earlier so it
> > was used to do the right thing with more kernel version.
> >
> So this sounds like a change in buildroot is warranted if we want to
> change this behavior.  I could submit a patch to buildroot that mimics
> Alexandre's Yocto patch.  Is that the next step here?
> 

Personally, I'd drop the yes "" | part of it and use only make
olddefconfig but the rules are also used for busybox et al. so you'd
have to check that all have a recent enough kconfig

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
