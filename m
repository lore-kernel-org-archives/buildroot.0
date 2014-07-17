From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 17 Jul 2014 13:57:58 +0200
Subject: [Buildroot] [PATCH 2/6] systemd: revert getty service
 installation
In-Reply-To: <20140706202818.GF3684@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20140706202818.GF3684@free.fr>
Message-ID: <20140717115757.GA20114@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Sun, Jul 06, 2014 at 10:28:18PM +0200, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-07-03 18:57 +0200, Eric Le Bihan spake thusly:
> > Revert getty fixup from post installation hook to service installation,
> > because service installation is performed before the installation of the
> > package itself. The fixup will fail trying to delete a file that has not
> > been installed yet.
> >
> > Fixes http://autobuild.buildroot.net/results/5b03174318d8a6dc3112053ff141b70a90869c20/
>
> Another, nore generic fix has just been committed:
>     http://git.buildroot.org/buildroot/commit/?id=ea0f52fc3fca5e5ba3ea5cd46033df2f53e9b5a5
>
> Would you care verify if this proposed patch is still valid now?

This generic fix solves my issue: I will remove this patch.

Best regards,
ELB
