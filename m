From: Will Newton <will.newton@gmail.com>
Date: Thu, 13 Aug 2009 15:19:48 +0100
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
In-Reply-To: <d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
References: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
	<d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
Message-ID: <87a5b0800908130719m79b677dbm1e3c12bd9dafddaf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/8/13 Thiago A. Corr?a <thiago.correa@gmail.com>:
> Hi Will,
>
> ? The dependencies in Makefiles are what make uses to figure out the
> build order. All but the most trivial programs will require the libc,
> thus the uclibc dependency.
> ? In your packages, you could just depend on the libraries you
> require, as those will likely depend on uclibc.
>
> ? Without the proper dependencies, the build order in one case or
> another could be switched and when your package is compiled, the
> dependencies are not yet available.

Sorry, perhaps I didn't explain myself very well. My point was - can
we guarantee that uclibc has already been built by the time we are
builidng a package? If so the explicit dependency is not needed. Many
packages already do not depend on uclibc so I suspect that we can drop
any explicit dependency on uclibc.

An example:

# grep uclibc package/grep/grep.mk
# grep uclibc package/bash/bash.mk
bash: ncurses uclibc busybox $(TARGET_DIR)/$(BASH_TARGET_BINARY)
bash: ncurses uclibc $(TARGET_DIR)/$(BASH_TARGET_BINARY)

Why does bash depend on uclibc but grep doesn't? Does grep have a bug
or can we remove the unneeded dependency from bash?
