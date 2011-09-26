From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Sep 2011 22:36:46 +0200
Subject: [Buildroot] [PATCH 1/1] cifs-utils: new package
In-Reply-To: <515aeaac2f96b302ad89abf28796ab86f1b940d7.1316468572.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 23:42:57 +0200")
References: <cover.1316468572.git.thomas.petazzoni@free-electrons.com>
 <cover.1316468572.git.thomas.petazzoni@free-electrons.com>
 <515aeaac2f96b302ad89abf28796ab86f1b940d7.1316468572.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87litbvy5d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, committed with minor fixes (see below):

 Thomas> new file mode 100644
 Thomas> index 0000000..861aaeb
 Thomas> --- /dev/null
 Thomas> +++ b/package/cifs-utils/Config.in
 Thomas> @@ -0,0 +1,13 @@
 Thomas> +config BR2_PACKAGE_CIFS_UTILS
 Thomas> +        bool "cifs-utils"

Wrong indentation.

 Thomas> +	help
 Thomas> +	  The in-kernel CIFS filesystem is generally the preferred
 Thomas> +	  method for mounting SMB/CIFS shares on Linux. The in-kernel
 Thomas> +	  CIFS filesystem relies on a set of user-space tools. That
 Thomas> +	  package of tools is called cifs-utils. Although not really
 Thomas> +	  part of Samba proper, these tools were originally part of
 Thomas> +	  the Samba package. For several reasons, shipping these tools
 Thomas> +	  as part of Samba was problematic and it was deemed better to
 Thomas> +	  split them off into their own package.
 Thomas> +
 Thomas> +	  http://wiki.samba.org/index.php/LinuxCIFS_utils
 Thomas> \ No newline at end of file

..

 Thomas> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
 Thomas> +$(eval $(call AUTOTARGETS,package,cifs-utils))
 Thomas> \ No newline at end of file

You forgot the newlines again ;)

-- 
Bye, Peter Korsgaard
