From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 23:47:16 +0100
Subject: [Buildroot] [PATCHv2] package: add python-pam
In-Reply-To: <1417623151-1895-1-git-send-email-peter@korsgaard.com>
References: <1417623151-1895-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141205234716.4295177e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed,  3 Dec 2014 17:12:31 +0100, Peter Korsgaard wrote:
> Upstream is no longer available, so get the tarball + important patches from
> Fedora.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> v1 missed dealloc patch.
> 
>  package/Config.in                                  |   1 +
>  package/python-pam/0001-dealloc.patch              |  25 ++++
>  package/python-pam/0002-nofree.patch               |  68 +++++++++++
>  .../0003-memory-errors-CVE2012-1502.patch          | 136 +++++++++++++++++++++
>  package/python-pam/Config.in                       |  15 +++
>  package/python-pam/python-pam.mk                   |  16 +++
>  6 files changed, 261 insertions(+)
>  create mode 100644 package/python-pam/0001-dealloc.patch
>  create mode 100644 package/python-pam/0002-nofree.patch
>  create mode 100644 package/python-pam/0003-memory-errors-CVE2012-1502.patch
>  create mode 100644 package/python-pam/Config.in
>  create mode 100644 package/python-pam/python-pam.mk

It's a little bit annoying to package stuff for which there is no
upstream available anymore, but oh well.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (code reviewed, license checked, built and runtime tested on
 ARM/uClibc)

Note however that the commit title for package additions should
normally be "<pkg>: new package", but it can be fixed while applying,
of course :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
