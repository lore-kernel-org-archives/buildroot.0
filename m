From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 12 Jun 2015 22:26:38 +0200
Subject: [Buildroot] [PATCH v2 0/4] openpowerlink2
In-Reply-To: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
References: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <557B407E.6010902@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 11/05/2015 18:14, Romain Naour a ?crit :
> From doc/openpowerlink.md:
> "The openPOWERLINK release V2.X is an evolution of the openPOWERLINK V1 stack.
> Running the kernel and user layers of openPOWERLINK on different processors in
> a multi-processor/multi-platform architecture, required fundamental changes in
> the Communication Abstraction Layer. Additionally, the existing code base was
> greatly improved so that it is easier to understand and maintain. Due to these
> reasons a new major release was started."
> 
> The openpowerlink2 package archive contains several cmake projects,
> and each of them must be packaged separately in Buildroot.
> 
> "With version 2.0, the source code has been cleanly split into an
> application-oriented user library and a time-critical stack driver."
> 
> This complicates the packaging but it helps to refine the dependencies
> compared to openpowerlink v1 build system.
> (openpowerlink v1 requires C++ only for the qt demo)
> 
> The openpowerlink2 package provide all patches which should be used by
> other openpowerlink2-* packages by using an patch hook.
> Doing this avoids patches duplication over all sub-packages.
> 
> All patches fix several issues with the cmake build system and will be
> submitted upstream.
> 
> There is one project for the EPL (Ethernet PowerLink) stack
> libraries wich provides:
>  * an user space EPL stack to be linked into application
>  * an user space EPL stack pcap daemon
>  * an kernel space EPL library interface
> 
> There are two projects for the EPL network driver:
>  * pcap daemon driver
>  * kernel module driver.
> 
> Note: On x86/x86_64 only few EPL ethernet driver are available for
> the EPL kernel stack implementation:
>  * Intel 82573
>  * Intel 8255x
>  * Intel I210
>  * Realtek RTL-8111/8168 (new since V2.1.0)
>  * Realtek RTL-8139
> 
> There is one project for each demo application:
>  * demo_cn_embedded
>  * demo_mn_embedded
>  * demo_cn_console
>  * demo_mn_console
>  * demo_mn_qt
> 
> Only demo_mn_console will be packaged in Buildroot for now.
> 
> [1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/
> 
> Romain Naour (4):
>   package/openpowerlink2: new package
>   package/openpowerlink2-kernel-drivers: new package
>   package/openpowerlink2-pcap-daemon: new package
>   package/openpowerlink2-apps-demo-mn-console: new package

I'll mark this series as "Changes Requested" in patchwork since a new release of
the openpowerlink stack is out (v2.2.0).

http://sourceforge.net/p/openpowerlink/news/2015/06/openpowerlink-v220/

I'll resend an updated series soon.

Best regards,
Romain
