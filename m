From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:50:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] libfcgi:add security patch for
 CVE-2012-6687
In-Reply-To: <1455000746-26644-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455000746-26644-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160225225018.7b702f4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version. It is almost ready, but your Signed-off-by
line is still missing, and since it is a legal statement, I cannot add
it myself when applying.

On Tue,  9 Feb 2016 12:22:26 +0530, Niranjan Reddy wrote:
> From: "Niranjan Reddy" <niranjan.reddy@rockwellcollins.com>
> 
> Fix-CVE-2012-6687 - remote attackers cause a denial of service (crash)
> via a large number of connections (http://www.cvedetails.com/cve/CVE-2012-6687/).
> use poll in os_unix.c instead of select to avoid problem with > 1024 connections.
> The patch libfcgi_2.4.0-8.3.debian.tar.xz is taken from the below link:
> (https://launchpad.net/ubuntu/+source/libfcgi/2.4.0-8.3)
> The next release of libfcgi is 2.4.1 which may have this fix is yet to be released
> officially.

We need your Signed-off-by here.

> ---
>  package/libfcgi/0006-fix-CVE-2012-6687.patch | 103 +++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 package/libfcgi/0006-fix-CVE-2012-6687.patch
> 
> diff --git a/package/libfcgi/0006-fix-CVE-2012-6687.patch b/package/libfcgi/0006-fix-CVE-2012-6687.patch
> new file mode 100644
> index 0000000..a8ea847
> --- /dev/null
> +++ b/package/libfcgi/0006-fix-CVE-2012-6687.patch
> @@ -0,0 +1,103 @@
> +libfcgi:add security patch for CVE-2012-6687
> +CVE-2012-6687 - remote attackers cause a denial of service (crash) via a large number 
> +of connections (http://www.cvedetails.com/cve/CVE-2012-6687/).
> +Fix:use poll in os_unix.c instead of select to avoid problem with > 1024 connections.
> +This patch libfcgi_2.4.0-8.3.debian.tar.xz is pulled from the below link:
> +(https://launchpad.net/ubuntu/+source/libfcgi/2.4.0-8.3)
> +The next release of libfcgi is 2.4.1 which may have this fix is yet to be released 
> +officially.
> +
> +Signed-off-by: Anton Kortunov <toshic.toshic@gmail.com>

And here.

Could you address that and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
