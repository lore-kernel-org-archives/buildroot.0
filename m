From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:32:23 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mysql: add MYSQL_SOCKET
 variable
In-Reply-To: <1473437448-27903-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473437448-27903-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160911213223.711de86f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 18:10:47 +0200, Floris Bos wrote:
> Add MYSQL_SOCKET variable with MySQL socket location
> 
> v3: fix systemd missing user
> v2: move socket to /run/mysql/mysql.sock
> chmod 755 /run/mysql to allow users access to it

This patch lacks your Signed-off-by line.

Also, this patch defines the MYSQL_SOCKET variable, which in PATCH 2/2
gets used in the PHP package. Sharing variables between packages
doesn't work in all situations, so we usually refrain from doing so.
Maybe we should document in the manual which cases work and which cases
don't work. Cc'ing Arnout, who knows quite a bit about this topic :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
