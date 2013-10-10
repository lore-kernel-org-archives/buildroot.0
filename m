From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:02:58 +0200
Subject: [Buildroot] Building / installing kernel modules.
In-Reply-To: <8DEC37E638F84029919B5EB7D735370D@JohanW7>
References: <8DEC37E638F84029919B5EB7D735370D@JohanW7>
Message-ID: <20131010090258.23617c17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 9 Oct 2013 20:37:35 +0200, Sagaert Johan wrote:

> I found this post http://lists.busybox.net/pipermail/buildroot/2011-July/044690.html

Note that this post was made by Thomas De Schampheleire, not me. Yeah,
I know, two Thomas, it's confusing :)

> Has there been some infrastructure added to aid in building and installing kernel modules ?

No. In fact I'm not sure there is really a need for that.

> I created a generic-package makefile to build and install the kernel module.
> So far so good, but I still have to run depmod -a on my target to register the module.
> 
> How can I use the post_install hook to have the module registered by buildroot,
> so I don't have to do it on my target board ?

Normally, if you use the modules_install target of the kernel Makefile
to install your own modules, it should call depmod automatically.

See
http://lists.busybox.net/pipermail/buildroot/2011-August/044807.html
for an example that does this (if I remember correctly).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
