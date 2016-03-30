From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 30 Mar 2016 09:53:55 -0400
Subject: [Buildroot] Fwd: statically built libuuid?
In-Reply-To: <CAK7rcp9og0N_merFniFx=ucrebUUONhkKZ3Ao919Ks46813vFg@mail.gmail.com>
References: <CAK7rcp9og0N_merFniFx=ucrebUUONhkKZ3Ao919Ks46813vFg@mail.gmail.com>
Message-ID: <CAK7rcp-pi4VgM8oWyep_GCVT5UVuiA6qm_LbdT16dJZd_2v38g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a custom package that depends on BR2_PACKAGE_UTIL_LINUX_UUIDD, which
we have correct selected and built. I can see libuuid.so in my output
directory when I do a find, but when I go to compile, adding in any
directory that libuuid could possibly be in, the compiler says:

ld: cannot find -luuid

Which is irritating. I have the --static flag on to my compiler, so I
wonder if that might be the problem. I didn't see libuuid.a in my output
directory for my bzImage, so I think that that is the problem. If I take
away the --static flag, compilation succeeds just fine. But I have to
compile my targets statically, it won't work any other way.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160330/7d38a343/attachment.html>
