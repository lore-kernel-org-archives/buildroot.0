From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:25:43 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: use
 --no-check-certificate in wget by default
In-Reply-To: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
References: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171010222543.0beed48d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 23:29:38 +0200, Thomas Petazzoni wrote:
> A number of autobuilder failures are due to the fact that autobuilder
> instances use old distributions, with old SSL certificates, and
> therefore wget aborts with an error "The certificate of `xyz.org' is
> not trusted.".
> 
> In order to avoid such failures that are not very interesting in the
> context of the autobuilders, we pass --no-check-certificate to
> wget. The integrity of the downloaded files is anyway verified by the
> hashes, and this is only meant to be used in the context of
> testing/CI, not in production.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Would it be possible to get some feedback on this patch?

We recently bump dbus to 1.10.24, and look how the autobuilders are
"polluted" by this certificate issue:
http://autobuild.buildroot.net/?reason=dbus-1.10.24.

We've got two options: either we do it in utils/genrandconfig as
proposed, or we do it in the autobuild-run script that runs on the
autobuilder slaves.

Comments ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
