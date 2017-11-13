From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:55:31 +0100
Subject: [Buildroot] [PATCH 1/1] duktape: new package
In-Reply-To: <CAPi7W80e2AUko7WXdKbbZ9pBQE+SDUHnKTstA7386msnVOEuxg@mail.gmail.com>
 (Fabrice Fontaine's message of "Fri, 3 Nov 2017 23:20:17 +0100")
References: <20171103195343.29670-1-fontaine.fabrice@gmail.com>
 <20171103223514.13a83e94@windsurf>
 <CAPi7W80e2AUko7WXdKbbZ9pBQE+SDUHnKTstA7386msnVOEuxg@mail.gmail.com>
Message-ID: <874lpx5264.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 > The issue with the original Makefile is that it tries to copy the two
 > header files in $(TARGET_DIR)/usr/include which does not exist so I had
 > several choices:
 > - create this directory in duktape.mk
 > - add "-a" option to the cp in the original Makefile

But cp -a doesn't create missing directories?

> - remove the cp

 > I chose the third option but I can go with the first or second one. Which
 > one do you prefer?

I would prefer to see a mkdir -p to ensure the directory exists and/or
using install -D to copy the files, as such patches should be acceptable
upstream.

-- 
Bye, Peter Korsgaard
