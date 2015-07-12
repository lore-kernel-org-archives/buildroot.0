From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 01:31:10 +0200
Subject: [Buildroot] [PATCH] spidev_test: use the one from the kernel we
 build
In-Reply-To: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
References: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <55A2F8BE.6020508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vincent,

 We're doing a big patchwork cleanup and finally getting back at your patch.

On 01/19/15 20:35, Vincent Stehl? wrote:
> Add a configuration option to use the spidev_test.c from the Linux kernel we
> build. This allows to be perfectly consistent between spidev_test and the
> kernel in use.

 The conclusion of the earlier discussion is that spidev_test should really only
be built together with the kernel, so you could remove the extra config option.
Note, if you do that, there may be a need for legacy handling otherwise a
.config which previously had SPIDEV_TEST but no kernel would suddenly loose the
SPIDEV_TEST.

 However, there is also the new kernel-tools infra proposed by Romain, and this
change would fit into that approach perfectly. So if you resubmit, consider
using the kernel-tools infra.


 Regards,
 Arnout

> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
