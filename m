From: Alexander Varnin <fenixk19@mail.ru>
Date: Sun, 23 Feb 2014 02:02:46 +0400
Subject: [Buildroot] [PATCH 1/1] mono: new package
In-Reply-To: <1393105881-20127-1-git-send-email-fenixk19@mail.ru>
References: <1393105881-20127-1-git-send-email-fenixk19@mail.ru>
Message-ID: <53091E86.6040202@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wish to add a comment, that mono still requires runtime (so called
assemblies), that is not getting build in cross-compile mode (cause it
requires host c# compiler to be built). So to make use of mono, you have
to compile the same version on host, extract runtime libraries, and
install it together with cross-compiled mono. This package does not
build host side mono, it is only doing cross-compile. Host runtime
building can be automated with buildroot, however, this is easily can be
done manually, so personally I don't need it.
