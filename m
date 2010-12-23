From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:48:13 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
	<AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
	<AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
Message-ID: <20101223084813.7decd2f5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Dec 2010 22:32:30 +0100
Samuel Martin <s.martin49@gmail.com> wrote:

> I haven't test external toolchain nor crosstool-NG, but afaik, crosstool-NG
> toolchain is copied in the BR staging,
> but not external ones.

The sysroot of external toolchain is copied to $(STAGING_DIR) as well.

> Btw, the toolchain is currently located in the staging, but if this change
> [1] (or if you're using a external tc), then, there needs to append both the
> staging directory and the toolchain directory to CMAKE_FIND_ROOT_PATH.

I don't know what you call the "toolchain directory", but the changes
made by Gustavo only *move* the location of the sysroot, but there will
still be only one location for it, and $(STAGING_DIR) will continue to
point to it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
