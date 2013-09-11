From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 11 Sep 2013 06:51:54 -0700
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install
	to target
In-Reply-To: <874n9rsiti.fsf@dell.be.48ers.dk>
References: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
 <20130911092734.2c4bee5f@skate> <874n9rsiti.fsf@dell.be.48ers.dk>
Message-ID: <5230757A.10201@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2013 04:23 AM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>
>   Thomas> Dear Ryan Coe,
>   Thomas> On Tue, 10 Sep 2013 14:58:35 -0700, Ryan Coe wrote:
>   >> $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
>   >> -			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
>   >> +			DEPMOD="$(HOST_DIR)/sbin/depmod" modules_install ;		\
>
>   Thomas> Not sure why we have to pass DEPMOD here since it's already part of
>   Thomas> LINUX_MAKE_FLAGS. Am I missing something?
>
> No, I think you're right. I've removed it in git.
>
> Thanks.
>

Without the depmod in the target install, I do not get the necessary 
files installed to the target.  I am unable to load modules until I 
manually run depmod -a.
