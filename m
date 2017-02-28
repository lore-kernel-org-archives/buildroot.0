From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 09:56:28 +0100
Subject: [Buildroot] [PATCH for-rc] openocd: fix build on older hosts
In-Reply-To: <1488260482-30511-1-git-send-email-michael@walle.cc> (Michael
 Walle's message of "Tue, 28 Feb 2017 06:41:22 +0100")
References: <1488260482-30511-1-git-send-email-michael@walle.cc>
Message-ID: <87zih6k81v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Walle <michael@walle.cc> writes:

 > OpenOCD fails to generate the documentation because older host systems may
 > have an old texinfo.

 > This patch is taken from upstream commit 79fdeb37f486f74658f1 which is
 > included in version 0.10.0. Therefore, it can be dropped when the version
 > is bumped.

 > Signed-off-by: Michael Walle <michael@walle.cc>
 > ---
 > Please include this patch in the 2017.02 release. Without the patch,
 > openocd won't build on older build hosts. There is no functional change.

It would IMHO be better to not generate the documentation in the first
place. I've committed Thomas' timestamp workaround, so it should no
longer get generated:

https://patchwork.ozlabs.org/patch/732614/

Can you please verify that the above fixes it for you?

-- 
Bye, Peter Korsgaard
