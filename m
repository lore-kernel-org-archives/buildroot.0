From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 09:19:17 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E719D4.4070304@zacarias.com.ar>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
Message-ID: <20130718091917.06476a78@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 17 Jul 2013 19:25:24 -0300, Gustavo Zacarias wrote:
> On 07/17/2013 04:58 PM, Thomas Petazzoni wrote:
> 
> > Ok, so if I select "Thumb" for ARMv5T, but use a normal ARMv5
> > external toolchain (compiled ARM, not Thumb), it should work. Am I
> > correct?
> 
> Yes, because at the moment it's a NOP, we don't do anything regarding
> thumb and external toolchains :)

We definitely do something. If you enable Thumb in the configuration,
then -mthumb gets hard-coded into the external toolchain wrapper. If you
enable ARM in the configuration, then -marm gets hard-coded into the
external toolchain wrapper.

See:
http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-tool.mk#n183
and:
http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-toolchain-wrapper.c#n50.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
