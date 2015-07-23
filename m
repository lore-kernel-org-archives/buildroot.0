From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:26:22 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-web2py: new package
In-Reply-To: <1429023904-20194-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
 <1429023904-20194-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150723222622.53792f93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 14 Apr 2015 17:05:04 +0200, Angelo Compagnucci wrote:
> This patch adds web2py package. web2py is a free open source
> full-stack framework for rapid development of fast, scalable,
> secure and portable database-driven web-based applications.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changelog:
>   
> v2 -> v3:
>  * Fixed systemd service file installation path.
>  * Fixed dependencies in Config.mk
>  * Moved to the systemwide installed pydal.
>  * Moved installation path to /var/www/.
>   
> v1 -> v2:
>  * Adding python2 dependency only (suggested by Yegor)

Applied with some minor change:

[Thomas: fixup symbolic link to the systemd service file.]

However, there are two things that I believe should be
improved/investigated:

 * The installation of web2py on the target is huge: 20 MB. When I look
   at it, it seems like there's a huge amount of example applications
   and so on, which don't really make sense to install by default. Can
   you look at trimming down the installation size to something closer
   to what people would really need?

 * I setup an admin password, but I don't know what to do with. When I
   connect to http://<myip>:8000, I can see web2py running. If I click
   on "admin" in the box on the right hand side, it brings me to a
   blank page that says "Admin is disabled because insecure channel".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
