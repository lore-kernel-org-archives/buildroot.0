From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Thu, 31 Aug 2017 10:31:33 -0500
Subject: [Buildroot] [V2 1/1] package/strongswan: Install libraries to
	/usr/lib
In-Reply-To: <20170831172213.0cb44929@windsurf.lan>
References: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
 <20170831172213.0cb44929@windsurf.lan>
Message-ID: <CAH=K+6kr10w+kfrYFmZYFoDfxhEjXgnAKsNX2j40fAz1pmxvXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thu, Aug 31, 2017 at 10:22 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
 [..]
> However, as said on IRC: I don't think it is normal that we drop the
> RPATH from a target binary if this RPATH is needed. So there is
> probably some additional investigation needed here to figure out if our
> RPATH-sanitization logic is correct.

I completely agree, I am still investigating this cleanup and will get
some information out as soon as I get a moment.

> Wolfgang: Sam realized that stronswan was no longer working, because it
> installs libraries in a non-standard path (/usr/lib/<something>/). The
> strongswan build system apparently adds the correct RPATH, but our
> RPATH sanitization step ($(TOPDIR)/support/scripts/fix-rpath target)
> removes it. Sam tested after dropping the call to
> $(TOPDIR)/support/scripts/fix-rpath target, and the RPATH was correct,
> strongswan would work.
>
> Aren't we supposed to keep legitimate RPATH from target binaries ?

I took out of our conversation that although that is the case, we
still would like to put the libraries into /usr/lib to conform with
the rest of BR. Is that still correct?

Thanks!

Sam Voss
