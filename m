From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:42:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/libvncserver: fix CVE-2018-20750
In-Reply-To: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
References: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303224221.2554ec6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Mar 2020 20:02:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> LibVNC through 0.9.12 contains a heap out-of-bounds write vulnerability
> in libvncserver/rfbserver.c. The fix for CVE-2018-15127 was incomplete.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-in-rfbProcessFileTransferReadBuffer.patch | 47 +++++++++++++++++++
>  package/libvncserver/libvncserver.mk          |  3 ++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
