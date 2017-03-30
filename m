From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Mar 2017 21:39:50 +0200
Subject: [Buildroot] [PATCH] shairport-sync: requires C++
In-Reply-To: <20170329215422.702b1840@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 29 Mar 2017 21:54:22 +0200")
References: <208617074343a6ecf1be15a96c82bdb148d5b675.1490814571.git.baruch@tkos.co.il>
 <20170329215422.702b1840@free-electrons.com>
Message-ID: <8760iq4kqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 29 Mar 2017 22:09:31 +0300, Baruch Siach wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/122/122d6cedf0205e8db27d498d6a2a839e11e7b6f2/
 >> http://autobuild.buildroot.net/results/bef/bef5fb328e6688107496cb213d8aeeca527abf03/
 >> 
 >> Cc: J?rg Krause <joerg.krause@embedded.rocks>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> ---
 >> package/shairport-sync/Config.in | 5 +++--
 >> 1 file changed, 3 insertions(+), 2 deletions(-)

 > Applied to master, thanks. In practice, most of the code in
 > shairport-sync is in C, except one file in C++, which is only compiled
 > conditionally (and we don't build it). However it seems like automake
 > uses CXX even if the C++ file is not part of the build.

That is afaik because of the unconditional AC_PROG_CXX. For other
packages (E.G. package/ifplugd/0003-no-cxx.patch) we patch it out, but
something upstreamable would naturally be nicer.

-- 
Bye, Peter Korsgaard
