From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 00:00:14 +0100
Subject: [Buildroot] [PATCH 1/2] texinfo: new host package
In-Reply-To: <1111501726.1967.1364165012922.JavaMail.root@mail>
References: <1364164146-16517-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <1111501726.1967.1364165012922.JavaMail.root@mail>
Message-ID: <20130325000014.49c13ea1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Sun, 24 Mar 2013 18:43:32 -0400 (EDT), Vivien Didelot wrote:

> Just curious, isn't possible for the Crosstool-NG build to disable the
> doc, with something like Gustavo did here for GCC:
> 
> http://git.buildroot.net/buildroot/commit/?id=62322acb2ce186d544ab21fe253ccc8561a68a48

Yes, it should be possible. Normally, we enabled the "Remove
documentation" option from Crosstool-NG, which should tell Crosstool-NG
to not build the documentation. But in practice, Crosstool-NG
configure script still wants a makeinfo program. Even if you fake it by
passing /bin/true as the makeinfo program, then the build process of
binutils fails during the construction of its info pages. So it looks
like Crosstool-NG does not disable entirely the generation of
documentation, or something else is going one.

Introducing this texinfo package is only a short-term solution, until
the proper way of disabling the documentation generation in
Crosstool-NG is found.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
