From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:55:54 +0200
Subject: [Buildroot] [PATCH 7/7] package/wvstreams: disable for musl
 toolchains
In-Reply-To: <1438987639-30593-7-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
 <1438987639-30593-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150808115554.4d034e3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 00:47:19 +0200, Romain Naour wrote:
> The project seems not maintained anymore since there
> is no commit since 2011:
> https://github.com/wlach/wvstreams
> 
> So, let's mark it as not available for musl toolchains,
> until someone interested enough fixes it.
> 
> Fixes:
> xplc/modulemgr.cc: In member function ?virtual IServiceHandler* ModuleManagerFactory::createModuleManager(const char*)?:
> xplc/modulemgr.cc:90:14: error: ?PATH_MAX? was not declared in this scope
>    char fname[PATH_MAX];

This one is easy to solve, but then it fails due to __libc_stack_end.
So I'm OK with disabling on musl. However, can you resend a proper
patch that updates the Config.in comment and propagates the dependency
to wvdial, which selects wvstreams?

> +        # musl not supported and no upstream activity since 2011.

Indentation is wrong.

> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	help

I'll mark this patch as Changes Requested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
