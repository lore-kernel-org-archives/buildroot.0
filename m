From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:28:11 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/prboom: work around gcc bug
 85180
In-Reply-To: <20190803153140.6a1ac048@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 3 Aug 2019 15:31:40 +0200")
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-7-giulio.benetti@micronovasrl.com>
 <20190803153140.6a1ac048@windsurf.home>
Message-ID: <878sraiejo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 26 Jun 2019 14:58:59 +0200
 > Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

 >> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 >> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 >> shows up when building prboom with optimization but not when building
 >> with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
 >> force using -O0.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/e72/e72a2070ab7e9a093c3c70002ee94ee57a6154f6/
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 >> ---
 >> package/prboom/prboom.mk | 8 ++++++++
 >> 1 file changed, 8 insertions(+)

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
