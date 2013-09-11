From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 13:23:37 +0200
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install
	to target
In-Reply-To: <20130911092734.2c4bee5f@skate> (Thomas Petazzoni's message of
 "Wed, 11 Sep 2013 09:27:34 +0200")
References: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
 <20130911092734.2c4bee5f@skate>
Message-ID: <874n9rsiti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Ryan Coe,
 Thomas> On Tue, 10 Sep 2013 14:58:35 -0700, Ryan Coe wrote:
 >> $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
 >> -			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
 >> +			DEPMOD="$(HOST_DIR)/sbin/depmod" modules_install ;		\

 Thomas> Not sure why we have to pass DEPMOD here since it's already part of
 Thomas> LINUX_MAKE_FLAGS. Am I missing something?

No, I think you're right. I've removed it in git.

Thanks.

-- 
Bye, Peter Korsgaard
