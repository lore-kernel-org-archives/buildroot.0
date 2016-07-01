From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:30:16 +0200
Subject: [Buildroot] [PATCH 1/2] python-tornado: fix runtime dependencies
In-Reply-To: <1467187285-13848-1-git-send-email-yegorslists@googlemail.com>
References: <1467187285-13848-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160701153016.14e63bd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 10:01:24 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> According to setup.py tornado requires backports.ssl_match_hostname
> for Python < 3.2 and certifi for Python < 3.4.
> 
> Actually both requirements are optional and tornado alone can work
> without them, but Python packages like python-circus check requirements
> at runtime and though they don't use this funtionality, they insist on
> having these packages installed.
> 
> An upstream patch fixes backports.ssl_match_hostname dependency and
> selecting python-certifi for Python 2 fixes certifi dependency till
> this is fixed upstream.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...re-backports.ssl_match_hostname-on-Python.patch | 37 ++++++++++++++++++++++
>  package/python-tornado/Config.in                   |  5 +--
>  2 files changed, 40 insertions(+), 2 deletions(-)
>  create mode 100644 package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
