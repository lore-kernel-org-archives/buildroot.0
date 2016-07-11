From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 11:47:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <1468007759371-ab3cc5cc-18ef6641-3fcef03d@mixmax.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
 <20160708212753.55d3c2ae@free-electrons.com>
 <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
 <20160708215031.17fe15de@free-electrons.com>
 <1468007759371-ab3cc5cc-18ef6641-3fcef03d@mixmax.com>
Message-ID: <20160711114753.4361520c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Could you fix your e-mail client to quote things properly? In the
below, it is impossible to distinguish the text you are quoting from
the text you have actually written. It makes replying to your e-mails
really complicated.

Thanks,

Thomas

On Fri, 08 Jul 2016 19:55:59 +0000, Christian Stewart wrote:
> Thomas,
> 
> 
> On Fri, Jul 8, 2016 12:50 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:OK. Can we remove unconditionally, or should we still keep it for
> 
> BR2_STATIC_LIBS=y builds?
> 
> 
> 
> 
> Perhaps we should pass -extldflags '$(TARGET_LDFLAGS)', since
> 
> TARGET_LDFLAGS will automatically contain -static when
> 
> BR2_STATIC_LIBS=y.
> 
> 
> 
> 
> That should be fine since extldflags is, I believe, only passed to C related
> linkers.
> For the specific case of runc, is ?RUNC_GOTAGS = static_build? needed
> 
> when BR2_STATIC_LIBS=y ?
> 
> 
> 
> That go tag is related to linking Go related code? In the runc code with a quick
> grep I see only one inconsequential place it's actually referenced:
> 
> Godeps/_workspace/src/github.com/godbus/dbus/homedir_dynamic.go:// +build
> !static_build Godeps/_workspace/src/github.com/godbus/dbus/homedir_static.go:// +build
> static_build
> And in that code I cannot even see the logic between the differences in the two
> files, as far as I can tell when doing a static build it just looks up the
> current home dir of the user, when doing a dynamic build it does some complex
> /etc/passwd checking or the like. Absolutely nonsensical.
> I'd just leave the static_build tag in there unconditionally, as it seems to
> have little to no effect anyway, and turning it off will actually result in some
> more complex and unnecessary home directory detection code being activated.
> Best, Christian



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
