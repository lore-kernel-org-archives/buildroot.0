From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:00:30 +0200
Subject: [Buildroot] [PATCH v1 1/6] package/qt5: bump minimum gcc
 requirement to 5.0
In-Reply-To: <20200418225906.17514-1-ps.report@gmx.net>
References: <20200418225906.17514-1-ps.report@gmx.net>
Message-ID: <20200419150030.62aac734@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 00:59:01 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> As a side effect of avoiding gcc bug 57694 ([1]) through commit
> 'GCC: revoke constexpr before 5.0' ([2]) for qtbase the minimum
> gcc requirement was lifted to 5.0 ([3], [4]), so bump the
> buildroot determined one too.
> 
> Adjust the two packages (pinentry, wireshark) which are brave enough
> to do a 'select BR2_PACKAGE_QT5' accordingly.

Huhu, "brave enough" :-)

> Fixes:
>   http://autobuild.buildroot.net/results/74f5249d1ee14c1269685af53a65055da7dc2ee6
> 
>   ../../include/QtCore/../../src/corelib/thread/qbasicatomic.h:61:4: error: #error "Qt requires C++11 support"
>    #  error "Qt requires C++11 support"
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57694
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=c61cedcc5475a77fb94ed12788f61039835f8079
> [3] https://codereview.qt-project.org/c/qt/qtbase/+/285582
> [4] https://bugreports.qt.io/browse/QTBUG-81761
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/pinentry/Config.in  | 6 +++---
>  package/qt5/Config.in       | 6 +++---
>  package/wireshark/Config.in | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
