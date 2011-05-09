From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2011 08:58:54 +0200
Subject: [Buildroot] [PATCH 1/1] external-toolchain: fix support
In-Reply-To: <87vcxlj74a.fsf@macbook.be.48ers.dk>
References: <cover.1304873537.git.thomas.petazzoni@free-electrons.com>
	<cover.1304873537.git.thomas.petazzoni@free-electrons.com>
	<c066155381297965b19106d4cd05524af58c771c.1304873537.git.thomas.petazzoni@free-electrons.com>
	<87vcxlj74a.fsf@macbook.be.48ers.dk>
Message-ID: <20110509085854.0862d1fb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 08 May 2011 21:59:49 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> The commit would have been a bit smaller if we simply replaced
> TARGET_CC with TOOLCHAIN_EXTERNAL_CC (and same for C++) as we only
> use these macros from ex-tool.mk anyway, but ok.

Yes, but while TARGET_CC can be considered as a global variable, I
don't consider TOOLCHAIN_EXTERNAL_CC to be a global one, but a local
variable to ext-tool.mk (I know 'make' doesn't provide any sort of
variable scoping mechanism, but still). For that reason, I thought that
passing the compiler path was a clearer solution.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
