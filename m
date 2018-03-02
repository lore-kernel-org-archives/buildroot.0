From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 09:17:58 +0100
Subject: [Buildroot] [PATCH 1/1] Main Makefile Have "make savedefconfig"
 show where the file is being written to.
In-Reply-To: <eb26582e-f1fe-d7eb-1494-efbeb52733b3@mind.be> (Arnout
 Vandecappelle's message of "Fri, 2 Mar 2018 09:05:41 +0100")
References: <20180227112818.6766-1-chrismcc@gmail.com>
 <dd0ef897-7b93-4c58-6f6f-a33e33f4e28a@mind.be>
 <87efl3h4pi.fsf@dell.be.48ers.dk>
 <eb26582e-f1fe-d7eb-1494-efbeb52733b3@mind.be>
Message-ID: <87vaeedh6x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Perhaps we could just set DEFCONFIG to $(CONFIG_DIR)/defconfig if empty?

 >  I looked at that, but in the 'make defconfig' rule we have to be able to
 > distinguish between BR2_DEFCONFIG is set or not. Since BR2_DEFCONFIG may come
 > out of the .config file, it may or may not be quoted. That's why we need to use
 > the qstrip'ed version DEFCONFIG in the condition.

Ahh yes.

 >  This stuff is complicated :-) It's one of these examples where, when I started
 > adding the feature, I thought "this is trivial" but then the real world kicks in.

I know the feeling ;)

-- 
Bye, Peter Korsgaard
