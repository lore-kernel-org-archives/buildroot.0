From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 20:16:28 +0100
Subject: [Buildroot] [PATCH v5 04/36] package/efl/libefl: new package
In-Reply-To: <562EA0D6.1000308@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-5-git-send-email-romain.naour@openwide.fr>
 <20151025135513.GA11692@free.fr> <562EA0D6.1000308@openwide.fr>
Message-ID: <562FCD8C.4080309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-10-15 22:53, Romain Naour wrote:
> ...the comments line start to be very long, should I do something like:
> 
> comment "EFL needs Lua, udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
> 	depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> 		|| BR2_STATIC_LIBS  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> 	depends on BR2_USE_MMU

 In this case, I think it's worthwhile to split it into two comments, one for
lua and udev and another for the toolchain.

 BTW I personally would put lua in lowercase here, because the option in the
menu is also in lowercase.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
