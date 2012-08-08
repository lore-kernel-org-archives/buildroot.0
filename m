From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Wed, 8 Aug 2012 20:20:51 +0800
Subject: [Buildroot] Prebuilt concept
In-Reply-To: <CAFt09wO4r6kXnLLhBW6ZGDdOCsrV38+vfG+dFQb421eXtrEi=g@mail.gmail.com>
References: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
 <CAHXCMMKfgsM8JAdN=vbtmt2JPv1OSccq7SCYQRVpisqAg8HLyg@mail.gmail.com>
 <CAFt09wMkzusGNstiUyX-WN18PtzRvwUhu6EU7ww204sVXPW9eQ@mail.gmail.com>
 <CAFt09wO4r6kXnLLhBW6ZGDdOCsrV38+vfG+dFQb421eXtrEi=g@mail.gmail.com>
Message-ID: <CAEvN+1gK=vHMJ5-wM_uWyAEpeq6gVC25YRbMQrKmqKO2PysKRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 8, 2012 at 1:42 AM, Matthew Weber <matt@thewebers.ws> wrote:
> Here's what worked for me (taken from my Makefile).  I have only tested this
> with an external toolchain, so I'm guessing there will be some additional
> stamp files that need tweaking.
>
> refresh_target:
>         @echo "Cleaning up target install..."
>         @rm -f $(BUILD_DIR)/.root       #Causes target dir to recreate
>         @rm -rf $(TARGET_DIR)
>         @find $(BUILD_DIR)/* -name "*target_installed" -type f -exec rm -f
> {} \;        # Causes pkg to reinstall target dir
>         @find $(BUILD_DIR)/* -name ".installed" -type f -exec rm -f {} \;
> # Causes grub to reinstall target dir
>         @find $(BUILD_DIR)/* -name ".stamp_installed" -type f -exec rm -f {}
> \; # Causes kernel to reinstall target dir
>         @rm -rf $(STAMP_DIR)/ext-toolchain-
> installed                            # Causes toolchain to recopy libs to
> target dir
>         @make
> # Command Re-install of target dir
>         @echo "Rebuilding target install..."
>
>
> Thanks,
> Matt

I did things like this several times manually, and is also asked from
time to time.

It would be very handy if the future releases could officially include
similar make targets.

Thanks,
Roy
