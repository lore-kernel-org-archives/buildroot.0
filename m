From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 12:56:01 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: change systemd service type
 to notify
In-Reply-To: <20190204185340.3689-1-titouan.christophe@railnova.eu>
References: <20180629183101.9705-1-joseph.kogut@gmail.com>
 <20190204185340.3689-1-titouan.christophe@railnova.eu>
Message-ID: <20190206125601.3eecebd2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 19:53:40 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> From: Joseph Kogut <joseph.kogut@gmail.com>
> 
> During activation, pg_ctl uses exec to start the db server, which causes
> the service to never finish activating when Type=forking. Upstream
> recommends configuring --with-systemd and using Type=notify.
> 
> https://www.postgresql.org/docs/10/static/server-start.html
> 
> Upstream says:
>     When using systemd, you can use the following service unit file
>     [...]
>     Using Type=notify requires that the server binary was built with
>     configure --with-systemd.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/postgresql/postgresql.mk      |  8 ++++++++
>  package/postgresql/postgresql.service | 12 ++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
