From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 10:34:50 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <CAMRc=MfwZVv10O2DsQitxDsXdpXRSC29VpvqTkC81CkOBUFoLQ@mail.gmail.com>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651>
 <20201030091929.18f77130@windsurf.home>
 <CAMRc=MexG_jDoNuuVzRmNqHD56yYJmwzq43JgGo38equmPiqzQ@mail.gmail.com>
 <20201030101559.0a1fb98c@windsurf.home>
 <CAMRc=MfwZVv10O2DsQitxDsXdpXRSC29VpvqTkC81CkOBUFoLQ@mail.gmail.com>
Message-ID: <20201030103450.57c772b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Oct 2020 10:25:37 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> > We can use the 1.4/1.6 conditional in libgpiod.mk, as 1.4 and 1.6 are
> > guaranteed to offer the same API to users of the libraries.
> >  
> 
> Unless the users use symbols that only first appeared in v1.6. v1.4 is
> compatible with v1.6 (v1.6 doesn't change/remove any symbols), not the
> other way around (v1.6 added new symbols).

Well, that is an issue. An application that builds with 1.6 may not
build with 1.4, so they are not compatible API-wise, and therefore
having libgpiod.mk fall back to 1.4 automatically when the kernel
headers are too old is going to potentially break applications that use
1.6-specific APIs.

> I think so. Just please note that SONAME of libgpiod right now is
> libgpiod.so.2 because of an ABI change early in the development. So
> SONAME for libgpiod2 will actually be libgpiod.so.3 - nothing we can
> do about it I'm afraid. I'll surely guarantee ABI and API stability
> over all minor releases of v2.x series.

That is fine.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
