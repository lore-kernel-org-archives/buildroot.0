From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:20:39 +0100
Subject: [Buildroot] Speeding up the Build
In-Reply-To: <CAJJ6jxs8G9i=K-qCCu29LZe0ro-kEjJeVTOHiEgEmmP88O=taQ@mail.gmail.com>
References: <CAJJ6jxvwFavFNNVMnBuCGr4hmEgOdRzyU6XDx=_9bF9a9FUn5Q@mail.gmail.com>
 <56B6021E.3070608@lucaceresoli.net>
 <CAJJ6jxs8G9i=K-qCCu29LZe0ro-kEjJeVTOHiEgEmmP88O=taQ@mail.gmail.com>
Message-ID: <20160208212039.38bed8ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Feb 2016 12:14:35 -0800, Steve Calfee wrote:

> Sorry I don't use CMAKE. Could your solution be extended to other host
> packages? Python for instance takes a long time to build and I have
> one installed. Unless we are patching the host tool or require a
> special version, it would build faster if buildroot used the installed
> version rather than building. I mean generically it would be nice.

For Python, we:

 1/ Need a host-python whose version matches the one of the target
    python being built.

 2/ Need some special host tools that are built as part of the
    host-python build, in order to build some stuff for the target
    python.

So unfortunately, it's not straightforward to use the Python of your
distribution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
