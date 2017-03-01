From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 08:59:28 +0100
Subject: [Buildroot] [PATCH 0/5] package/cmake: re-introduce cmake-3.7
In-Reply-To: <1e11d59e-9274-f4fb-f966-002c26ca6247@mind.be>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <1e11d59e-9274-f4fb-f966-002c26ca6247@mind.be>
Message-ID: <20170301085928.6380ed25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 08:49:47 +0100, Arnout Vandecappelle wrote:

>  I don't think it makes much sense to keep the 4 separate patches. The history
> shows the authorship of the original bump. Having the 4 separate patches just
> adds noise to the history. Also, Thomas reported that the libuv dependency
> introduced by the bump is probably incorrect, so we'd have to revert patch 4/5
> and part of patch 2/5 again later on... And if the dependency on libuv *is*
> needed, then you re-introduce a non-bisectable commit between patch 2/5 and 4/5.

Well, the libuv dependency is incorrect in the sense that ctest doesn't
seem to use libuv.

*However*, the libuv dependency is correct in the sense that the
CMakeLists.txt checks it, and if not, builds the cmake built-in version
of libuv. But since for the target we only build ctest, this whole
libuv is not used.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
