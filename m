From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Mon, 02 May 2016 11:36:36 +0100
Subject: [Buildroot] [PATCH 1/1] eja: new package
In-Reply-To: <20160501233950.30d36de6@free-electrons.com>
References: <1462052481-9005-1-git-send-email-ubaldo@eja.it>
 <20160501233950.30d36de6@free-electrons.com>
Message-ID: <fa6311c917858f49c20125999cea92ba@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

thank you for your comments and sorry for the misunderstanding about the 
cover letter, I didn't know that the "head" would be committed with the 
patch.

>> +
>> +define EJA_BUILD_CMDS
>> +        $(MAKE) CC="$(TARGET_CC)" -C $(@D) static
> 
> Can you try:
> 
> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
> 
> Also, why do you build the static variant?

I tried to compile with this build syntax but I couldn't get it working 
fine so I had a look at the Lua package and after rewriting a little bit 
eja.mk it is now working both for static and shared libraries.

> Could you rework your patch to take into account those comments and
> send an updated version?

I reworked the rest of the points and I am going to submit a new patch 
right now.
