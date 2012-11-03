From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 19:08:36 +0100
Subject: [Buildroot] [PATCH 01/12] libnetfilter_conntrack: bump to
	version 1.0.2
In-Reply-To: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 22 Oct 2012 09:46:18 -0300")
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9uyy2xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libnetfilter_conntrack/Config.in           |    5 +++++
 Gustavo>  .../libnetfilter-conntrack.mk                      |    6 ++++--
 Gustavo>  2 files changed, 9 insertions(+), 2 deletions(-)

 Gustavo> diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
 Gustavo> index caf8a8a..9f7b42a 100644
 Gustavo> --- a/package/libnetfilter_conntrack/Config.in
 Gustavo> +++ b/package/libnetfilter_conntrack/Config.in
 Gustavo> @@ -1,5 +1,7 @@
 Gustavo>  config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 Gustavo>  	bool "libnetfilter_conntrack"
 Gustavo> +	depends on BR2_LARGEFILE
 Gustavo> +	select BR2_PACKAGE_LIBMNL

You forgot to adjust the DNSMASQ_CONNTRACK option to depend on
BR2_LARGEFILE, but I fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
