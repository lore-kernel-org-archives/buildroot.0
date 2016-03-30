From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 10:59:07 -0300
Subject: [Buildroot] Fwd: statically built libuuid?
In-Reply-To: <CAK7rcp-pi4VgM8oWyep_GCVT5UVuiA6qm_LbdT16dJZd_2v38g@mail.gmail.com>
References: <CAK7rcp9og0N_merFniFx=ucrebUUONhkKZ3Ao919Ks46813vFg@mail.gmail.com>
 <CAK7rcp-pi4VgM8oWyep_GCVT5UVuiA6qm_LbdT16dJZd_2v38g@mail.gmail.com>
Message-ID: <56FBDBAB.3040302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/16 10:53, Kenneth Adam Miller wrote:

> I have a custom package that depends on BR2_PACKAGE_UTIL_LINUX_UUIDD,
> which we have correct selected and built. I can see libuuid.so in my
> output directory when I do a find, but when I go to compile, adding in
> any directory that libuuid could possibly be in, the compiler says:
>
> ld: cannot find -luuid
>
> Which is irritating. I have the --static flag on to my compiler, so I
> wonder if that might be the problem. I didn't see libuuid.a in my output
> directory for my bzImage, so I think that that is the problem. If I take
> away the --static flag, compilation succeeds just fine. But I have to
> compile my targets statically, it won't work any other way.

Hi.
Did you enable static-only or static/shared library builds in build options?
Because the default is to build shared-only, hence not having a static 
libuuid.a is expected.
Regards.
