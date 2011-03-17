From: Anders Darander <anders.darander@gmail.com>
Date: Thu, 17 Mar 2011 12:46:26 +0100
Subject: [Buildroot] Adding owfs to buildroot fails with "cannot find
	/lib//libc.so.0"
In-Reply-To: <AANLkTikv8x-OmUoOvhJF-3Ly-fV6oLRzSKYY1ZP8s3R5@mail.gmail.com>
References: <AANLkTikv8x-OmUoOvhJF-3Ly-fV6oLRzSKYY1ZP8s3R5@mail.gmail.com>
Message-ID: <AANLkTinhuHrKgnufO1mpJ6rbqqLiOv8T3gPsVuJZEarF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It's been a while since I added packages to buildroot (mostly working
on OE nowadays).

On Wed, Mar 16, 2011 at 15:36, P?r Degerman <par@degerman.org> wrote:
> I'm trying to add owfs to buildroot, but I'm having problems with the
> compile. I have added a new package named owfs with files below. I
> also added owfs to package/Config.in.
>
> When I try to compile it fails with the error message:
> /usr/bin/ld: cannot find /lib//libc.so.0
> collect2: ld returned 1 exit status

To me it looks like the host ld and /lib. Is it building a native-version?
Do the configure step run OK?

> OWFS_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib"

To me, it looks like this line is giving you you're problems.

What linking problems are you trying to avoid by that line?

Regards,
Anders
