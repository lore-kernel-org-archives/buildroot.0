From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 10:05:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-22
In-Reply-To: <20140528090639.732647c8@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 28 May 2014 09:06:39 +0200")
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
 <53857DE2.6040509@mind.be> <20140528063024.GA3510@free.fr>
 <20140528084311.05629fce@free-electrons.com>
 <20140528064706.GC3510@free.fr>
 <20140528090639.732647c8@free-electrons.com>
Message-ID: <877g56coqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Regarding using the wrapper for the internal toolchain, there's always
 > the problem of where we put the real toolchain binaries vs. the wrapper
 > binaries. For the external toolchain, it's simple: the real toolchain
 > binaries are in $(HOST_DIR)/opt/ext-toolchain, and the wrappers in
 > $(HOST_DIR)/usr/bin. But for the internal toolchain, we build/install
 > all the toolchain components with --prefix=$(HOST_DIR)/usr.

Conceptually we could do something like

 --prefix=$(HOST_DIR)/usr \
 --bindir=$(HOST_DIR)/opt/raw-toolchain

But I haven't tried it.

-- 
Bye, Peter Korsgaard
