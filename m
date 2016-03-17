From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 17 Mar 2016 20:41:29 +0100
Subject: [Buildroot] [PATCH 12/16] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <20160317185342.GA6588@vapier.lan>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F163.5080304@mind.be>
 <20160317091807.4924cfcc@free-electrons.com>
 <20160317185342.GA6588@vapier.lan>
Message-ID: <20160317194128.GU21774@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,
Mike Frysinger wrote,

> On 17 Mar 2016 09:18, Thomas Petazzoni wrote:
> > On Thu, 17 Mar 2016 00:50:59 +0100, Arnout Vandecappelle wrote:
> > > On 03/16/16 22:43, Thomas Petazzoni wrote:
> > > > The uClinux developers now have a Github with elf2flt code, with an
> > > > upstream that is again active. Let's switch to this upstream, to which
> > > > Waldemar is contributing as well.
> > > 
> > >   While at it, you could have added a hash file.
> > 
> > Will do.
> > 
> > > > We also add an ARM patch from Waldemar, which was on his elf2flt
> > > > repository and he submitted upstream.
> > > 
> > >   That probably should have been a separate patch.
> > 
> > No: the Waldemar Git repository did contain the ARM noMMU support. So
> > when switching to the more "official" upstream (which doesn't yet have
> > ARM noMMU support), we need to include the patch adding ARM noMMU
> > support to keep functionality the same.
> 
> elf2flt has had nommu arm support pretty much from the beginning (at
> least since 2002).  i don't know what this patch is for, but it hasn't
> been sent upstream afaik, so i can't really comment on it.

Yes, elf2flt has ARM noMMU support I think it is just not complete
enough to work with recent gcc and binutils. I can't compile a
working busybox binary without this patch:
http://mailman.uclinux.org/pipermail/uclinux-dev/2016-March/052707.html

Isn't this the mailing list to sent patches for elf2flt?

best regards
 Waldemar
