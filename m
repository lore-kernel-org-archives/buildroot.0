From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Aug 2017 22:57:33 +0200
Subject: [Buildroot] Failed to build libexoxy with nvidia-driver
In-Reply-To: <1503935622.673191.1087468320.18EAD29A@webmail.messagingengine.com>
References: <1503935622.673191.1087468320.18EAD29A@webmail.messagingengine.com>
Message-ID: <d5446a67-383f-a813-58c2-2d51d6999181@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-08-17 17:53, Alexandre Maumen? wrote:
> Hi,
> 
> I'm trying to build libepoxy with nvidia-driver but it fails with this
> error:
> 
> checking for EGL... no
> configure: error: Package requirements (egl) were not met:
> 
> Package egl was not found in the pkg-config search path.
> Perhaps you should add the directory containing `egl.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'egl', required by 'world', not found

 Indeed, nvidia-driver selects BR2_PACKAGE_HAS_LIBEGL but doesn't install egl.pc
(it does install gl.pc). And there's also no glesv2.pc. J?r?me, Yann, could you
look into it?

 Perhaps we should add a check in the lib*gl* virtual packages that they install
a .pc file...

 Regards,
 Arnout

> 
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> 
> Alternatively, you may set the environment variables EGL_CFLAGS
> and EGL_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> I'm new to buildroot and I don't know much about Nvidia binary drivers.
> Any help will be more than welcome.
> 
> Regards,
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
