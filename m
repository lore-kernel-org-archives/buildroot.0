From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:38:03 +0200
Subject: [Buildroot] [PATCH 2/3] vsftpd: Add ftp user creation
In-Reply-To: <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151010193803.55e1a406@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 Oct 2015 15:31:34 +0200, Maxime Hadjinlian wrote:
> In order to remove '/home/ftp' and the ftp user from the 'skeleton'
> package, we need to add the creation of the ftp users to the package so
> it still work out of the box (with an anonymous user).
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/vsftpd/vsftpd.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Even though I dislike the solution as I would prefer to use the
<pkg>_PERMISSIONS mechanism, I've applied this patch. I believe that
the fact that we can't do this with our <pkg>_PERMISSIONS mechanism
indicates a deficiency in our implementation.

Also, I've done some minor tweaks to your patch before applying:

    [Thomas:
     - remove the VSFTPD_FIX_HOME_PERMISSIONS variable, and simply put the
       additional command in VSFTPD_INSTALL_TARGET_CMDS.
     - slightly tweak the comment.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
