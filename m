From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 23:31:47 +0100
Subject: [Buildroot] [PATCH] Add package dstat (python script for system
	stats/profiling)
In-Reply-To: <b75d62eb1595ea7619c5.1328647882@beantl019720> (Thomas De
 Schampheleire's message of "Tue, 07 Feb 2012 21:51:22 +0100")
References: <b75d62eb1595ea7619c5.1328647882@beantl019720>
Message-ID: <87bopas2b0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  package/Config.in       |   1 +
 Thomas>  package/dstat/Config.in |  19 +++++++++++++++++++
 Thomas>  package/dstat/dstat.mk  |  15 +++++++++++++++
 Thomas>  3 files changed, 35 insertions(+), 0 deletions(-)

 Thomas> v2: reduce parameters to GENTARGETS

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -19,6 +19,7 @@ endmenu
 Thomas>  menu "Debugging, profiling and benchmark"
 Thomas>  source "package/bonnie/Config.in"
 Thomas>  source "package/dhrystone/Config.in"
 Thomas> +source "package/dstat/Config.in"
 Thomas>  source "package/dmalloc/Config.in"
 Thomas>  source "package/kexec/Config.in"
 Thomas>  source "package/lmbench/Config.in"
 Thomas> diff --git a/package/dstat/Config.in b/package/dstat/Config.in
 Thomas> new file mode 100644
 Thomas> --- /dev/null
 Thomas> +++ b/package/dstat/Config.in
 Thomas> @@ -0,0 +1,19 @@
 Thomas> +config BR2_PACKAGE_DSTAT
 Thomas> +	bool "dstat"
 Thomas> +	select BR2_PACKAGE_PYTHON

Python needs WCHAR, so you need to depend on it as well.

Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
