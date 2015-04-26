From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:14:15 +0200
Subject: [Buildroot] [PATCH v2 1/3] python-pyqt: fix PyQt_qreal_double
 enabling/disabling
In-Reply-To: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
References: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150426121415.40ce90fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sat, 25 Apr 2015 12:41:16 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fix :
> http://autobuild.buildroot.net/results/6a2/6a28855c11b321ce8ceaf0acdd5395738af931fd/
> http://autobuild.buildroot.net/results/91a/91a3641d1e4126475bbca0d3c779582832f6db91/
> http://autobuild.buildroot.net/results/b10/b10fa70c199fc2de405068fea1eac80c29577747/
> http://autobuild.buildroot.net/results/b53/b5334ac80afb58a19bd40b7c0b18378d75bc8fc7/
> http://autobuild.buildroot.net/results/01f/01fa1319e467c3c2410fd462dc40c18b82dc8246/
> http://autobuild.buildroot.net/results/2e6/2e6cae93ab860175c405e440bc7e24334b5b14e8/
> 
> According to configure-ng.py, PyQt_qreal_double must be disabled on ARM target
> and when QT_NO_FPU is set.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
>  * disable PyQt_qreal_double for sh4, sh4a, sh4aeb and QWS & mips
> ---
>  package/python-pyqt/python-pyqt.mk | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

I've applied after changing the logic to use a hidden Config.in
boolean. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
