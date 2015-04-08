From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 14:26:00 -0300
Subject: [Buildroot] [PATCH v2 1/5] gcc-final: install libatomic
In-Reply-To: <20150408191414.1fce04ac@free-electrons.com>
References: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>	<1428511969-28430-2-git-send-email-gustavo@zacarias.com.ar>
 <20150408191414.1fce04ac@free-electrons.com>
Message-ID: <552564A8.4050406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 02:14 PM, Thomas Petazzoni wrote:

> What is your proposal to handle libatomic for the external toolchain
> case?

Actually it's already copied into staging, so i did't see any breakage
at build time, but yes, runtime is a different story.
Adding libatomic.so.* to LIB_EXTERNAL_LIBS in
toolchain/toolchain-external/toolchain-external.mk is enough.
I'll send a patch if this is the proper course of action, otherwise
exclude webkit/midori for some external toolchains.
Regards.
