From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 18:11:19 +0100
Subject: [Buildroot] [PATCH v3 1/3] pkg-generic.mk: reinstall targets
In-Reply-To: <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
 <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150203181119.04d18f40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Fri, 28 Nov 2014 09:25:04 -0600, Doug Kehn wrote:
> Add reinstall targets for host, target, staging, and images variants.
> clean-for-reinstall targets added to remove package
> .stamp_target_install file to allow package install.  Additionally, when
> OVERRIDE_SRCDIR is provided, .stamp_rsynced is removed to ensure pakcage
> is up to date before reinstalling.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/pkg-generic.mk | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Thanks, we applied your patch, but with a much simplified version.
Since having <pkg>-reinstall-{images,host,staging,target} was probably
not necessary, we just implemented one <pkg>-reinstall target, that
reinstalls whatever the package wants to install. This allows to make
the implementation a lot more similar to the <pkg>-rebuild and
<pkg>-reconfigure implementations.

See
http://git.buildroot.net/buildroot/commit/?id=b7bc44d22d0fddde7c964a2fd259775ea8d0bf9f
for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
