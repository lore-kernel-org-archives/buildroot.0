From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 09:17:31 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
Message-ID: <20170301091731.5102e061@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 08:58:31 +0100, Arnout Vandecappelle wrote:

>  Since you don't do any processing on the file, you could just use
> 
> 		-DCMAKE_MODULE_PATH="$$(TOPDIR)/support/misc" \

I think the idea is that since the Buildroot.cmake platform files gets
referenced by the toolchainfile.cmake, then Buildroot.cmake anyway
needs to be installed in $(HOST_DIR)/usr/share/buildroot, so we can
just as well point CMake to this place.

> and avoid copying the file around. Of course, in that case, support/cmake is
> probably a better place to put the file :-)

No: copying the file is needed, otherwise our toolchainfile.cmake file
no longer works for people using it outside of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
