From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2016 22:36:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add patch to fix host
	build with gcc 4.4
In-Reply-To: <1451993813-11805-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Tue, 5 Jan 2016 12:36:53
 +0100")
References: <1451993813-11805-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87io37hfnp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Add patch from upstream [1] to fix a host build with gcc 4.4.x:
 >   gcc.compile.c++ bin.v2/libs/container/build/gcc-4.4.5/release/threading-multi/pool_resource.o
 >   libs/container/src/pool_resource.cpp:35: error: declaration of 'typedef class boost::container::pmr::block_slist_base<boost::container::pmr::block_slist_header> boost::container::pmr::pool_data_t::block_slist_base'
 >   ./boost/container/detail/block_slist.hpp:67: error: changes meaning of 'block_slist_base' from 'class boost::container::pmr::block_slist_base<boost::container::pmr::block_slist_header>'

 > Fixes:
 > http://autobuild.buildroot.org/results/3cd/3cdc30a5b6e05de99787a20bf71fcf82842c15b3/
 > http://autobuild.buildroot.net/results/852/85212dd41db76d4e32efd98736ad8506e1917a8d/
 > http://autobuild.buildroot.org/results/963/963d102aa1c42efd84447d68d0856074421fbe05/
 > http://autobuild.buildroot.org/results/a39/a395f91969f79a8a4c0deffca4cdfdad33d48bd0/
 > .. and many more.

 > Host build tested on Scientific Linux 6.7 with gcc 4.4.7.

 > Backported from: a4e9686f8a0258bc30f9da2abab65673d6b9bd50

 > [1] https://github.com/boostorg/container/commit/a4e9686f8a0258bc30f9da2abab65673d6b9bd50

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
