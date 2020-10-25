From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:30:27 +0100
Subject: [Buildroot] [PATCH] package/nginx: use /run instead of /var/run
In-Reply-To: <20201015101137.32333-1-buildroot@heine.tech>
References: <20201015101137.32333-1-buildroot@heine.tech>
Message-ID: <20201025103027.5704d2aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 12:11:36 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> This is a follow-up to 4027ba29f448 ("package/nginx: use /run for
> PIDFile").
> 
> I missed that nginx is still built with /var/run paths.
> 
> This commit changes the compile options to use /run instead of /var/run
> for pid and lock file to make it consistent.
> 
> Further dropping the passing of the pid option in the service file as
> this isn't neccessary. Neither debian nor nginx default .service does
> it.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/nginx/nginx.mk      | 4 ++--
>  package/nginx/nginx.service | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
