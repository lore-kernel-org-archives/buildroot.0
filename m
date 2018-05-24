From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:06:02 +0200
Subject: [Buildroot] [PATCH v2] busybox: S01mdev: fix module autoloading
In-Reply-To: <20180507183501.13778-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 7 May 2018 20:35:01 +0200")
References: <20180507183501.13778-1-peter@korsgaard.com>
Message-ID: <87d0xkbw79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit b4fc5a180c (package/busybox: support spaces in module aliases in
 > mdev) changed the mdev coldplugging to handle sysfs path elements and
 > modalias values containing spaces.  This unfortunately doesn't work as was
 > recently reported:

 > http://lists.busybox.net/pipermail/buildroot/2018-May/220903.html

 > The problem is that sort -z also expects the fields of the input files to be
 > zero terminated, which is not the case for modalias sysfs entries.

 > So drop the -z option to sort.  Spaces in modalias entries could be handled
 > with the xargs -d '\n' option, but that is unfortunately not supported by
 > the busybox applet.  Instead, use tr to convert newlines to zeros so we can
 > use xargs -0.

 > Reported-by: Daniel Palmer <daniel@0x0f.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
