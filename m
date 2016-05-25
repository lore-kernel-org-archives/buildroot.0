From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 25 May 2016 22:37:07 +0200
Subject: [Buildroot] [PATCH v2 resend 3/3] - allow building of odroid
 mali GL libs when using defconfig. - add S50display which sets the odroid
 mali fb.
In-Reply-To: <20160525174921.7217-1-daggs@gmx.com>
References: <20160525174921.7217-1-daggs@gmx.com>
Message-ID: <20160525223707.203198b1@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Wed, 25 May 2016 20:49:21 +0300,
Dagg <daggs@gmx.com> a ?crit :

>  .../odroidc2/fs-overlay/etc/init.d/S50display      | 103
> +++++++++++++++++++++
> configs/odroidc2_defconfig                         |   1 + 2 files
> changed, 104 insertions(+) create mode 100644
> board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> 
> diff --git
> a/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display new file
> mode 100644 index 0000000..68f8c6c --- /dev/null
> +++ b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> @@ -0,0 +1,103 @@

Would it be possible to extract the functions from the S50display
service to an external script (e.g. 
board/hardkernel/odroidc2/fs-overlay/usr/sbin/setup-fb) and have
the service call it? This would allow reusing it with another init system
(namely systemd).

Thanks.

-- 
ELB
