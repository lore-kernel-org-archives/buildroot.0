From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Feb 2017 12:09:15 +0100
Subject: [Buildroot] [PATCH 0/1] python-pylibftdi new package
In-Reply-To: <1488201961-15539-1-git-send-email-christian.kellermann@solectrix.de>
References: <1488201961-15539-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <CAGm1_ks6jsEJepZCbM7iOR0GcG9LEdngPZjhNKP_JLgKfGck5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,


On Mon, Feb 27, 2017 at 2:26 PM, Christian Kellermann
<christian.kellermann@solectrix.de> wrote:
> Dear List,
>
> This patch adds the python binding for libftdi. However it contains a
> hackish patch which I would like to discuss. Pylibftdi uses the ctypes
> find_library call to find the libusb and libftdi libraries. This in
> turn seems to rely on ldconfig which is not part of buildroot.
>
> Patching it out here seems to work fine, but this kind of hides the
> general problem of fixing find_library in the python package. How
> would one do this properly?

This is a known problem and so far there is no proper solution. So I
think the patch is acceptable.

Btw. have you tried libftdi's native Python support via SWIG?
pylibftdi hasn't reached version 1.0.0 and the project hasn't been
updated since September 2015.

Yegor
