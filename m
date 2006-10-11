From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 11 Oct 2006 10:10:30 +0200
Subject: [Buildroot] How do I select the PCMCIA package ?
In-Reply-To: <1160070993.4021.18.camel@glynys>
References: <1160070993.4021.18.camel@glynys>
Message-ID: <20061011081030.GB23507@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 05, 2006 at 05:56:33PM +0000, mike wrote:
>Simple question. How do I select the PCMCIA package? What do I need to
>select first ?
>
>I want to build a system with PCMCIA, but menuconfig doesn't allow it
>for selection.
>It seems to be dependent on BR2_PACKAGE_LINUX, and the only way I can
>see of getting that set is by selecting something in "Board Support
>Options" - none of which I really want.

Perhaps try to remove that dependency. If you have LINUX_SOURCE_DIR et
al set properly (see package/pcmcia/pcmcia.mk), then compilation should
succeed.

I have a patch that adds a target option for a generic x86 kernel, but
i'm hesitating to apply it (since more than a year) due to the potential
requests adding it will likely trigger ;)

>I have built my own "special" version of the linux kernel with the
>various drivers and things I want and set $(LINUX_DIR) and
>$(LINUX_SOURCE_DIR) to point to the right place. Are there other
>undocumented environment variables I need to set up ?

See above.

HTH,
