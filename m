From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:21:39 +0200
Subject: [Buildroot] [PATCH 1/1] audit: disable python3 support
In-Reply-To: <1437599200-21453-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1437599200-21453-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20150722232139.785d8167@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 22 Jul 2015 16:06:40 -0500, Ryan Barnett wrote:
> With the version bump to 2.4.3, python3 support was added for
> libaudit. With host machines that have python3 installed, this will
> cause build issues such as:
> 
>   make[5]: Entering directory `/tmp/ryan/buildroot/output/build/audit-2.4.3/bindings/swig/python3'
>   swig -o audit_wrap.c -python -py3 -modern -I. -I../../.. -I../../../lib -I/usr/include/python3.4m -I/usr/include/python3.4m ./../src/auditswig.i
>   make[5]: swig: Command not found
> 
> Solution is to disable python3 support such as we do with python2.7.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/audit/audit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
