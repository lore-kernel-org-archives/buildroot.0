From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 23:01:31 +0100
Subject: [Buildroot] [PATCH v1] bcm2835: new package
In-Reply-To: <1449609824-2649-1-git-send-email-ps.report@gmx.net>
References: <1449609824-2649-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151229230131.494ae5a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue,  8 Dec 2015 22:23:44 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/Config.in            |  1 +
>  package/bcm2835/Config.in    | 10 ++++++++++
>  package/bcm2835/bcm2835.hash |  2 ++
>  package/bcm2835/bcm2835.mk   | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/bcm2835/Config.in
>  create mode 100644 package/bcm2835/bcm2835.hash
>  create mode 100644 package/bcm2835/bcm2835.mk

I've applied after doing a few changes:

    [Thomas:
     - addition of 'depends on BR2_arm' as suggested by Yann.
     - addition of a comment in the Config.in help text that says that
       this library is a pure abomination.
     - fix the hash, since apparently upstream changes the released
       tarballs after they are published.
     - fix license, it's GPLv2, not GPLv2+.]

If you could contact upstream to tell them to not change their tarballs
after they are published, it would be good. I had to change the hash
because yours wasn't matching the tarball I could download today, even
if the version hasn't changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
