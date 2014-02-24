From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 22:18:31 +0100
Subject: [Buildroot] [PATCH 1/2] infra: improve dependency check in
	virtual packages.
In-Reply-To: <20140224182951.GB11048@free.fr>
References: <1393235404-2693-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393235404-2693-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140224182951.GB11048@free.fr>
Message-ID: <82336fb5-b694-43a4-b8d9-2d4bbbf21593@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
...
>
>I don't know about you folks, but I'm beginning to see a pattern here...
>
>If all of our BR2_PACKAGE_HAS_FOOBAR options would match the corresponding
>FOOBAR_DEPENDENCIES, then we could use something like (absolutely untested,
>only pure random thoughts):
>
>    $(eval $(call virtual-package,FooBar))
>
>whith 'virtual-package' something like:
>
>    define virtual-package
>    ifeq ($(BR2_PACKAGE_HAS_$(call upper,$(1))),y)
>    ifeq ($($(call upper,$(1))_DEPENDENCIES),)
>    $(error No $(1) implementation selected. Configuration error.)
>    endif
>    endif
>    endef
>
>But then we would need:
>    s/BR2_PACKAGE_HAS_OPENGL_EGL/BR2_PACKAGE_HAS_LIBEGL/
>    s/BR2_PACKAGE_HAS_OPENGL_GLES/BR2_PACKAGE_HAS_LIBGLES/
>    s/BR2_PACKAGE_HAS_OPENMAX/BR2_PACKAGE_HAS_LIBOPENMAX/
>    s/BR2_PACKAGE_HAS_OPENVG/BR2_PACKAGE_HAS_LIBOPENVG/
>
>Lua interpreter and PowerVR already match this.

In the past I complained about the version of virtual packages (like toolchain) being 'undefined'. The idea came up to set it as 'virtual' instead.
I believe at that time, Thomas also said that renaming the libgl symbols should be fine...

Best regards,
Thomas
