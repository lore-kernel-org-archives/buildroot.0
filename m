From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon, 26 Nov 2018 11:12:26 +0000
Subject: [Buildroot] Status of gdb/gdbserver support for RISC-V 64 ?
In-Reply-To: <20181124224432.2f3721f5@windsurf>
References: <20181124224432.2f3721f5@windsurf>
Message-ID: <b0c0ae1c-d1d6-b980-a345-16dbedefc158@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 24/11/2018 21:44, Thomas Petazzoni wrote:
> Hello Mark,
>
> I'm curious to know what is the status of RISC-V 64 support in
> gdb/gdbserver ?
>
> Just tried building gdbserver with gdb 8.1.1, and it says:
>
>   Error: target not supported by gdbserver.
>
> Is the support on its way upstream ? We probably need to add a few more
> dependencies in package/gdb/Config.in.host to prevent people from
> trying to build gdb versions that don't have RISC-V 64 support.

RISC-V gdb support is upstream already, but gdbserver for RISC-V doesn't
exist yet.

I guess that for RISC-V we should prevent gdbserver
(BR2_PACKAGE_GDB_SERVER) and cross gdb (BR2_PACKAGE_HOST_GDB) from being
built and select 'full debugger' (BR2_PACKAGE_GDB_DEBUGGER) for native
RISC-V gdb builds.

I'll take a look at the configuration options.

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
