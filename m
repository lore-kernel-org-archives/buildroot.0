From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 08:55:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-filesystem needs
 wchar
In-Reply-To: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150722085507.4f78d81f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 17 Jul 2015 16:15:16 +0200, J?rg Krause wrote:
> Also add reverse dependency for cc-tool.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
> http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
> http://autobuild.buildroot.net/results/0dd/0dd3ef96bbd034a41d908cdaa6552b27fda78132/
> http://autobuild.buildroot.net/results/34b/34b55b2cd83fd5d87af4a9c15d05094b16ef3960/
> 
> and many more
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Apparently, this isn't sufficient to fix all problems:

  http://autobuild.buildroot.net/results/49f/49f5c0521fc90fbd4673ad233ff679be007d2953/build-end.log

BR2_PACKAGE_BOOST_ARCH_SUPPORTS=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_LAYOUT_SYSTEM=y
# BR2_PACKAGE_BOOST_LAYOUT_TAGGED is not set
# BR2_PACKAGE_BOOST_LAYOUT_VERSIONED is not set
BR2_PACKAGE_BOOST_LAYOUT="system"
# BR2_PACKAGE_BOOST_ATOMIC is not set
BR2_PACKAGE_BOOST_CHRONO=y
# BR2_PACKAGE_BOOST_CONTAINER is not set
BR2_PACKAGE_BOOST_CONTEXT=y
# BR2_PACKAGE_BOOST_DATE_TIME is not set
# BR2_PACKAGE_BOOST_EXCEPTION is not set

#
# boost-filesystem needs a toolchain w/ wchar
#
# BR2_PACKAGE_BOOST_GRAPH is not set
# BR2_PACKAGE_BOOST_GRAPH_PARALLEL is not set
# BR2_PACKAGE_BOOST_IOSTREAMS is not set

#
# boost-locale needs a toolchain w/ wchar
#
# BR2_PACKAGE_BOOST_MATH is not set
# BR2_PACKAGE_BOOST_MPI is not set
# BR2_PACKAGE_BOOST_PROGRAM_OPTIONS is not set
# BR2_PACKAGE_BOOST_RANDOM is not set
# BR2_PACKAGE_BOOST_REGEX is not set
BR2_PACKAGE_BOOST_SERIALIZATION=y
# BR2_PACKAGE_BOOST_SIGNALS is not set
# BR2_PACKAGE_BOOST_SYSTEM is not set
# BR2_PACKAGE_BOOST_TEST is not set
# BR2_PACKAGE_BOOST_THREAD is not set
# BR2_PACKAGE_BOOST_TIMER is not set
# BR2_PACKAGE_BOOST_WAVE is not set

Maybe we should make the entire boost package depends on wchar and be
done with it?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
