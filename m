From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 15:10:09 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: use wizard mode on first
 run
In-Reply-To: <1459090620-21422-1-git-send-email-yann.morin.1998@free.fr>
References: <1459090620-21422-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160328151009.01a515f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Mar 2016 16:57:00 +0200, Yann E. MORIN wrote:
> The format of the ACL database in tvheandend has changed, and generating
> a default user is a little bit more involved than just dumping a file in
> the correct locations: filenames are now md5sum (of something?) and the
> usernames and passwords now have their own DB.
> 
> However, tvheadend has a wizard mode, where it is possible to configure
> the basic features, of which creating an admin user.
> 
> We remove our canned ACL database, and change the startup script to
> start in wizard mode on first run.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/tvheadend/Config.in    | 4 ++--
>  package/tvheadend/S99tvheadend | 5 +++++
>  package/tvheadend/tvheadend.mk | 8 --------
>  3 files changed, 7 insertions(+), 10 deletions(-)

I don't see this patch removing the accesscontrol.1 file. Is that
expected?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
