From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 10:05:26 +0200
Subject: [Buildroot] [PATCH v8 08/10] external-toolchain: check if a
 buildroot SDK has already been relocated
In-Reply-To: <5954a27f-ac93-99ee-5216-2cc73b15385b@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-9-git-send-email-wg@grandegger.com>
 <20170720232131.02e9a51d@windsurf>
 <9cca1b92-5e7e-2788-8370-59b12078396f@mind.be>
 <20170721083636.5442a2df@windsurf>
 <5dabf921-90d5-5f82-4e6b-34bcff1e2023@grandegger.com>
 <20170721092401.121b48b1@windsurf>
 <5954a27f-ac93-99ee-5216-2cc73b15385b@grandegger.com>
Message-ID: <20170721100526.7e014194@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 09:44:00 +0200, Wolfgang Grandegger wrote:

> > "make sdk" will definitely create just the toolchain if what you have
> > in your configuration is... just the toolchain, which is exactly how I
> > build Buildroot toolchains, such as the ones used by the autobuilders
> > or on toolchains.free-electrons.com.
> > 
> > Doing "make toolchain" doesn't work for this use case, because you
> > definitely want the RPATH sanitization of host binaries done in "make
> > sdk".
> > 
> > Again, I think this additional check in the external toolchain code is
> > useless. For a SDK to be usable as an external toolchain, it has to be
> > a SDK that contains *just* a toolchain and *nothing* else. If its
> > sysroot is polluted with additional libraries than the C library, it
> > cannot be used as an external toolchain. And therefore, the
> > relocate-sdk procedure is useless, because there's nothing to relocate
> > in an SDK that is just a toolchain.  
> 
> OK. I see. Then I will drop this patch.

Let's see if Arnout agrees with my reasoning. Quite often he points me
at details I have missed :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
