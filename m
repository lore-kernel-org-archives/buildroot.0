From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:24:16 +0100
Subject: [Buildroot] [PATCH] [PATCH] usb_modeswitch: upgrade to 1.2.3
In-Reply-To: <CAAXf6LV1gHy+w2N3T_xz+iETCdANPsJNMefR-XBLM8FqCKA9Lw@mail.gmail.com>
References: <1328830956-11154-1-git-send-email-jwoltz@gmail.com>
 <CAC78GpfLO9XPZh4gU8ShTR9i8vBMaZQ6HQ0Uwfpf6xwPw-aJLA@mail.gmail.com>
 <CAAXf6LV1gHy+w2N3T_xz+iETCdANPsJNMefR-XBLM8FqCKA9Lw@mail.gmail.com>
Message-ID: <201202111724.16231.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 10 February 2012 17:41:04 Thomas De Schampheleire wrote:
> >> Is there a particular reason why you changed this?
> >>
> >> And to other buildroot developers: what is the policy regarding
> >> directly specifying CC and LD, instead of using variables like
> >> TARGET_CONFIGURE_OPTS ?
> >>
> >
> > Yes, I changed that line since usb_modeswitch would not compile. I was
> > following the example from:
> > http://buildroot.uclibc.org/buildroot.html#generic-tutorial
> >
> > Please let me know how or what you want changed, and I will re-submit.
> 
> I checked and this is caused because your Makefile patch removed the
> CC ?= gcc
> change.
> 
> Personally I don't mind your solution, as it is one less change to the
> Makefile.
> For me, you don't need to change it.

 J.C.'s solution is preferred, I would say.

- It doesn't require patching.

- It's how it is documented.

- TARGET_CONFIGURE_OPTIONS is meant for autoconf.

- This will be the way that the MAKETARGETS infrastructure will be 
implemented.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
