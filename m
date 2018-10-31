From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:24:11 +0100
Subject: [Buildroot] [PATCH 2/2] lighttpd: add optional pam support
In-Reply-To: <20181030102152.9755-2-peter@korsgaard.com>
References: <20181030102152.9755-1-peter@korsgaard.com>
 <20181030102152.9755-2-peter@korsgaard.com>
Message-ID: <20181031102411.7d9d84fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Oct 2018 11:21:52 +0100, Peter Korsgaard wrote:
> Let the option depend on linux-pam as pam has quite some dependencies and
> this is unlikely to be used if pam isn't explicitly enabled.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/lighttpd/Config.in   | 7 +++++++
>  package/lighttpd/lighttpd.mk | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

Applied to master, thanks.

Baruch: I indeed agree that automatic dependency handling could be used
here, but Peter has a point that lighttpd doesn't do that today for
other dependencies. So for consistency, it made sense to do the same
for the linux-pam dependency as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
