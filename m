From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 19:49:48 +0200
Subject: [Buildroot] [PATCHv3 09/18] pkg-generic: remove the
 .stamp_rsync_sourced fake stamp file
In-Reply-To: <20150425173303.GJ4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425173303.GJ4275@free.fr>
Message-ID: <20150425194948.70ff9724@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Apr 2015 19:33:03 +0200, Yann E. MORIN wrote:

> > -$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
> > +$(1)-source:
> 
> The reason that line existed was to be able to define a dependency on
> the stamp file. There is now no reason to keep this line at all; all you
> have above is declaring a make goal without dependency or rule, so it
> is entirely useless.

I don't think a target with no dependencies or rules is useless. It can
be useful to not have an error when this target is triggered.

When you are going to do a 'make source', it will do a 'make
$(1)-source' on all packages, including the ones that have
<pkg>_OVERRIDE_SRCDIR. So there must be a $(1)-source target, even if
it doesn't do anything.

Am I missing something?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
