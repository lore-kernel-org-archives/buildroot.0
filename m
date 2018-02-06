From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:04:57 +0100
Subject: [Buildroot] [PATCH v3 3/3] autobuilder: failure reason use
 build-time.log
In-Reply-To: <20180202205713.27191-5-matthew.weber@rockwellcollins.com>
References: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
 <20180202205713.27191-5-matthew.weber@rockwellcollins.com>
Message-ID: <20180206150457.5265bfcf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 14:57:13 -0600, Matt Weber wrote:

> +	  exec("tail -1 " . $thisbuildfinaldir . "build-time.log | grep :start: | cut -d':' -f4", $tmp);
> +	  if (trim($tmp[0]))
> +	    print "Using build-time.log for reason[".trim($tmp[0])."]";
> +	    $reason = trim($tmp[0]);

Curly braces missing here. I've added a bunch more curly braces in this
piece of code, and applied to buildroot-test.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
