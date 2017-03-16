From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Mar 2017 22:16:40 +0100
Subject: [Buildroot] [Patch v3 9/9] s6-linux-init: new package
In-Reply-To: <87shmgyeha.fsf@dell.be.48ers.dk>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-10-git-send-email-eric.le.bihan.dev@free.fr>
 <87shmgyeha.fsf@dell.be.48ers.dk>
Message-ID: <20170316211640.GA4981@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-03-13 23:54:41, Peter Korsgaard wrote:
> >>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
>
>  > This new package provides s6-linux-init, a set of minimalistic tools to
>  > create a s6-based init system, including a /sbin/init program, on a
>  > machine running a Linux kernel.
>
> Hmm, should this then be added as one of the available init options in
> the system menu? Or if not, at least depend on BR2_INIT_NONE to ensure
> no other init system overwrites /sbin/init?

s6-linux-init [1] does not provide a replacement for /sbin/init, but
a tool to generate one FROM the target. So when this package is selected,
there is no risk of messing up target/sbin/init at build time. Hence no
need to make it depend on on BR2_INIT_NONE.

The s6* packages provide the tools to build an init system with service
supervision (as the author states it: "mechanism over policy"). It is up
to the user to glue everything via post-build scripts or a custom
skeleton. A basic example of such a skeleton [2] is available in a
personal Buildroot external customization [3].

Should some comments be added in s6-linux-init/Config.in to clarify
this?

[1] http://skarnet.org/software/s6-linux-init/
[2] https://github.com/elebihan/s6-br2-init-skeleton/
[3] https://github.com/elebihan/br2-ext-skarnet/blob/master/system/Config.in

--
ELB
