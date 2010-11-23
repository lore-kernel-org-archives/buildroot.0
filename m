From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 20:30:28 +0100
Subject: [Buildroot] [pull request] Pull request for branch for-2010.11
In-Reply-To: <4CEC039F.8020909@zacarias.com.ar>
References: <4CEC039F.8020909@zacarias.com.ar>
Message-ID: <20101123203028.6875317e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Nov 2010 15:10:39 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Misc fixes for 2010.11...

Could you try to post the patches themselves ?

In "squid: bump to version 3.1.9", I don't agree with:

  SQUID_MAKE_OPT = CXX_FOR_BUILD=g++

CXX_FOR_BUILD is already passed in $(TARGET_CONFIGURE_OPTS), so this
shouldn't be necessary. And if it really is, then $(HOSTCXX) should be
used instead.

The rest looks ok to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
