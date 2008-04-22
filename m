From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Tue, 22 Apr 2008 08:38:43 -0500
Subject: [Buildroot] Failing NFS root mount
In-Reply-To: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
Message-ID: <20080422133843.GA5733@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two things to try:

   1) Use 'ip=bootp' instead of 'ip=dhcp'.

   2) Did you create device nodes in your NFS root filesystem for
      
         /dev/console
	 /dev/ttyUL0
	 /dev/zero
	 /dev/log
	 /dev/null
	 /dev/zero
	 /dev/pts

You will need that small subset of device nodes until udev or your
other scripts run.

-Steve
