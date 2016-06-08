From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:52:55 +0200
Subject: [Buildroot] [PATCH next] php: security bump version to 7.0.7
In-Reply-To: <1464776496-55262-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464776496-55262-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160608235255.54c29b2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 11:21:36 +0100, Vicente Olivert Riera wrote:
> Fixes CVE-2013-7456 https://bugs.php.net/bug.php?id=72227
> Fixes CVE-2016-5093 https://bugs.php.net/bug.php?id=72241
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Since the bump to PHP 7, we are seeing some build failures such as:

  http://autobuild.buildroot.net/results/bfc/bfcd11b0a94fe73b34a898c4b402702156fc539d/build-end.log

Seems like libdl support is needed. Not sure if it's unconditionally
for PHP, or only when some options are enabled.

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
