From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 1 Jul 2016 09:26:46 +0200
Subject: [Buildroot] [PATCH v3 5/5] package/enlightenment: bump to 0.20.9
In-Reply-To: <57702AFB.6080001@zacarias.com.ar>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
 <1466630866-28779-5-git-send-email-romain.naour@gmail.com>
 <dfd39299-57a5-2b62-1f71-5f9fa7326c53@gmail.com>
 <57702AFB.6080001@zacarias.com.ar>
Message-ID: <ecac5149-2afe-56bb-e5df-2cf7f87963b4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 26/06/2016 ? 21:20, Gustavo Zacarias a ?crit :
> On 26/06/16 15:39, Romain Naour wrote:
> 
>> Hi Gustavo,
>>
>> I tried to build enlightenment 0.20.9 with Wayland support only but there are
>> several issues which should be fixed with the next version (0.21)
>>
>> First we need [1] since configure always check for ecore-x (X11).
> 
> Hi Romain.
> Yes, that's a typical failure in some packages, particularly gtk3-using ones
> that assume X must be around and break wayland & broadway.
> 
>> Then, there is another issue with Wayland EGL cflags not forwarded correctly
>> (MESA_EGL_NO_X11_HEADERS not set when EGL/eglplatform.h is included)...
>>
>> sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such
>> file or directory
> 
> This is typically a problem with pkg-config files missing EGL cflags, such as in
> libepoxy:
> https://git.busybox.net/buildroot/tree/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
> 
> Hence for example mesa headers go crazy and that happens.
> 
>> So, I don't think Wayland support is ready for this version. Instead we should
>> wait for E 0.21 (rc1 currently).
>>
>> Also, I have another series (needed for Wayland) adding OpenGL/OpenGLES support,
>> libdrm for DRM, and DRM + GL support. To finish, I need to add systemd support
>> in EFL and E.
>> But this bump series must be commited before sending it ;)
>>
>> Did you already tested Wayland/Weston with systemd?
>> Have you a working Buildroot configuration?
> 
> Not yet, i've paved the way to make that simpler in weston via automatically
> enabling systemd bindings and the helper, but i haven't runtime tested it since
> my samples aim for total simplicity hence start everything up as root
> automatically via initscript (no extra user accounts and so on) - and normally
> doing this on a systemd target isn't so simple.
> Regards.

Ok tanks for your feedback :)

E 0.21.0 has been released yesterday but for wayland only build we need
ecore-wl2 library from efl git master (i.e 1.18) [1].
I don't think efl 1.18 will be released before 2016.08-rc1, so I'll keep E
0.20.x for now.

If I have some time, I'll work on OpenGL/OpenGLES and systemd support with the
current version.

Best regards,

[1]
https://git.enlightenment.org/core/enlightenment.git/commit/?id=03f3297b3c5c7e7f18c422cd5e1fc19987959aa8

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
