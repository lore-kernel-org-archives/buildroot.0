From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 23:29:09 +0200
Subject: [Buildroot] [PATCH] package/bison: make installation relocatable
In-Reply-To: <20200518062648.1744905-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 18 May 2020 08:26:47 +0200")
References: <20200518062648.1744905-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y2pal9ay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Our current host-bison installation is not relocatable, so if you
 > generate the SDK, and install it in a different location, bison will
 > no longer work with failures such as:

 > bison: /home/user/buildroot/output/host/share/bison/m4sugar/m4sugar.m4: cannot open: No such file or directory

 > This particular issue is already resolved upstream by the addition of
 > "relocatable" support, which we enable using --enable-relocatable.

 > Once this issue is fixed, a second one pops up: the path to the m4
 > program itself is also hardcoded. So we add a patch to fix that as
 > well. The patch has been submitted upstream.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12656

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
