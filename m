From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:59:07 +0200
Subject: [Buildroot] [PATCH] rsyslog: Fix systemd service creation
In-Reply-To: <1436884700-11759-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436884700-11759-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150714235907.76887cb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 14 Jul 2015 16:38:20 +0200, Maxime Hadjinlian wrote:
> The rsyslog.service is installed by rsyslog, but the link is not created
> so the service is not enabled.
> In order to install the service file, use the correct configure flag.
> 
> So the INSTALL_INIT_SYSTEMD will create the link, it will also create
> another link which is due to the fact that the rsyslog.service contains
> an Alias=
> 
> If we were to use systemctl enable to enable the service, it would
> create both,so we mimic that.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/rsyslog/rsyslog.mk | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
