From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 21:28:31 +0100
Subject: [Buildroot] [PATCH] Don't install in mysql directory
In-Reply-To: <1450051027-23633-1-git-send-email-arnout@mind.be>
References: <1450051027-23633-1-git-send-email-arnout@mind.be>
Message-ID: <20151229212831.07ec737f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 14 Dec 2015 00:57:07 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Installing libraries in a subdirectory of /usr/lib leads to no end of
> trouble. It requires either setting a RUN_PATH in the ELF files linked
> with it or adding the path to ld.so.conf and calling ldconfig on the
> target.
> 
> So to simplify things, put everything in /usr/lib instead of
> /usr/lib/mysql
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../0007-dont-install-in-mysql-directory.patch     | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 package/mysql/0007-dont-install-in-mysql-directory.patch

I've applied the patch after doing the following tweaks:

    [Thomas:
     - tweak commit title.
     - also remove ld.so.conf handling in mysql.mk, since it is no
    longer necessary.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
