From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:18:26 +0100
Subject: [Buildroot] [PATCH 1/1] Update Apache2 package
In-Reply-To: <1445771573-14693-1-git-send-email-geoffrey.ragot@gmail.com>
References: <1445771573-14693-1-git-send-email-geoffrey.ragot@gmail.com>
Message-ID: <20151220151826.0f565d81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Geoffrey Ragot,

On Sun, 25 Oct 2015 12:12:53 +0100, Geoffrey Ragot wrote:
> Currently, apache2 package does not allow
> to use -DBIG_SECURITY_HOLE flag.
> This flag allow httpd daemon to run as root.
> It should be the responsability of the user
> to take this decision.
> This patch add an option to set this flag.
> Previous behavior unchanged.
> 
> Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>

Thanks for your patch, and sorry for the slow response. However, we
believe that running a web server as root is really a bad idea. All our
other web servers (lighttpd, nginx, etc.) already default in Buildroot
to run as the www-data user. We don't think we should encourage users
to run apache as root.

For this reason, I've marked your patch as "Rejected" in our patch
tracking system. Of course, don't hesitate to get back to us if you
disagree with a good and valid use case for running apache as root :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
