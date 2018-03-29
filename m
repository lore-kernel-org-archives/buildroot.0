From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 21:05:28 +0200
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
In-Reply-To: <20180329175202.GA23440@scaer> (Yann E. MORIN's message of "Thu, 
 29 Mar 2018 19:52:02 +0200")
References: <20180128235233.26989-1-casantos@datacom.ind.br>
 <87zi2r7zaa.fsf@dell.be.48ers.dk>
 <1751033060.982024.1522341719017.JavaMail.zimbra@datacom.ind.br>
 <20180329175202.GA23440@scaer>
Message-ID: <87efk28zyf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> It is required by libvirt[1] to show device names when we use virtual
 >> machine manager to add hardware via PCI passthrough, otherwise only
 >> the PCI bus information (slot, port, function) is shown.

 > Then I would say that it is not _required_. It may be _needed_, but it
 > is not mandatory; it just makes it a little bit more user-friendly.

 > Thus, I would say that we do not want to enforce this dependency,
 > because it still works without it.

And if it IS required when using libvirt with pci passthrough, but not
necessarily for other users of libpciaccess, then we can make libvirt
select it.

In the general case for nice-to-have-but-not-absolutely-required
dependencies we don't have a solution in Buildroot today except for a
note in the help text. Upstream kconfig has recently added the imply
keyword which could be used to implement this, but we would need to sync
our kconfig with upstream for that.

-- 
Bye, Peter Korsgaard
