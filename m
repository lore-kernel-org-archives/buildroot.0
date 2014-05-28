From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 09:06:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-22
In-Reply-To: <20140528064706.GC3510@free.fr>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
 <53857DE2.6040509@mind.be> <20140528063024.GA3510@free.fr>
 <20140528084311.05629fce@free-electrons.com>
 <20140528064706.GC3510@free.fr>
Message-ID: <20140528090639.732647c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 28 May 2014 08:47:06 +0200, Yann E. MORIN wrote:

> > > Yes, I think this is a good idea. But we can't use the wrapper to build
> > > the toolchain itself, of course.
> > 
> > And there is no wrapper at all when we use the internal toolchain
> > backend. At least as of today.
> 
> Hu? Of course we're not using the wrapper for internal toolchain. That's
> why I replied it would be a good idea to use it (OK, I should have
> trimmed the quote a bit more.)

Regarding using the wrapper for the internal toolchain, there's always
the problem of where we put the real toolchain binaries vs. the wrapper
binaries. For the external toolchain, it's simple: the real toolchain
binaries are in $(HOST_DIR)/opt/ext-toolchain, and the wrappers in
$(HOST_DIR)/usr/bin. But for the internal toolchain, we build/install
all the toolchain components with --prefix=$(HOST_DIR)/usr.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
