From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:13:23 +0100
Subject: [Buildroot] buildroot + leon3 + gdb
In-Reply-To: <1360834790.663881421942614585.JavaMail.defaultUser@defaultHost>
References: <1360834790.663881421942614585.JavaMail.defaultUser@defaultHost>
Message-ID: <20150125151323.7ad443fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jan 2015 17:03:34 +0100 (CET), dosrulez at libero.it wrote:

> I'm having a problem trying to build a specific linux kernel for leon3 &amp; spartan6 (Xilinx). 
> What I want is build a customized linux kernel using Buildroot and the toolchain provided by Gaisler, including an instance of gdb server which is going to be executed on the target.
> Whenever I try to include gdb into the build process I get the error "Could not find gdbserver in external toolchain" and I cannot find a way to fix this.
> Could you help me?

Sure, don't enable the BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY option.
You have this option enabled, but your toolchain does not have a
gdbserver included, so trying to copy it to the target (which is the
purpose of BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY) cannot work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
