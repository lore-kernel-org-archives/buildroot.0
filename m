From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Jul 2013 10:10:38 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E719D4.4070304@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 17 Jul 2013 19:25:24 -0300")
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
Message-ID: <87zjtkwao1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 07/17/2013 04:58 PM, Thomas Petazzoni wrote:
 >> Ok, so if I select "Thumb" for ARMv5T, but use a normal ARMv5
 >> external toolchain (compiled ARM, not Thumb), it should work. Am I
 >> correct?

 Gustavo> Yes, because at the moment it's a NOP, we don't do anything
 Gustavo> regarding thumb and external toolchains :) However if we did
 Gustavo> it must work, it's part of the spec and the gcc default as
 Gustavo> long as we are talking about a thumb-supporting cpu of course.

FYI, I just did a test build (arm926/thumb1/internal uclibc), and the
build dies in NPTL when it runs out of registers. Without threads it
builds and seems to work.

-- 
Bye, Peter Korsgaard
