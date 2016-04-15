From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 15 Apr 2016 19:50:35 +0200
Subject: [Buildroot] [PATCH] gutenprint: fix host build when libusb found
In-Reply-To: <87oa9bgqv2.fsf@dell.be.48ers.dk>
References: <20160402184733.GA8155@waldemar-brodkorb.de>
 <87oa9bgqv2.fsf@dell.be.48ers.dk>
Message-ID: <20160415175035.GQ7454@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Allow to disable USB support, otherwise host build breaks when
>  > libusb is found as installation tries to install to /usr.
>  > Fixes following autobuild error:
>  > http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/
> 
> Hmm, but why does that end up with /usr and not $(HOST_DIR)/usr? Is it
> picking up a libusb.pc from your host or is our host-libusb .pc file
> wrong?

It is picking up libusb.pc from the host and I don't think
gutenprint-print will build host libusb at all. As cups support
is disabled anyway for the host, I don't think installing any USB
backends for the hosttools is strictly necessary and might be better
avoided.

best regards
 Waldemar
