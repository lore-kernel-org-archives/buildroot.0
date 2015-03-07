From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 7 Mar 2015 18:01:41 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <20150307173234.57c8bf4f@free-electrons.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
 <20150307173234.57c8bf4f@free-electrons.com>
Message-ID: <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2015 at 5:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Sat, 7 Mar 2015 17:29:56 +0100, Fabio Porcedda wrote:
>
>> IMHO it's cleaner if instead of adding this patch you can add a
>> post_patch hook that using sed change all "DGifCloseFile(gif)" to
>> "DGifCloseFile(gif, NULL)".
>
> I don't agree. Such sed expressions can very easily be overlooked when
> bumping the package, and they don't solve a problem that should be
> solved by submitting a patch to the upstream project.

I don't know exactly but the libevas seems dead, the last change in
the git repository was made 15 months ago.

https://git.enlightenment.org/legacy/evas.git/

I hope there is a chance for the patch to be accepted.

Bernd, have you tried to send the patch upstream?

Could you add a note in patch to justify the change?
Example:
From http://giflib.sourceforge.net/gif_lib.html
GIF file openers and closers - DGifOpenFileName(),
DGifOpenFileHandle(), DGifOpen(), DGifClose(), EGifOpenFileName(),
EGifOpenFileHandle(), EGifOpen(), and EGifClose() - all now take a
final integer address argument. If non-null, this is used to pass back
an error code when the function returns NULL.

With above note added and because the sed option is not available:
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
[build fine the following defconfig:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_EFL=y
BR2_PACKAGE_LIBEVAS=y
BR2_PACKAGE_LIBEVAS_GIF=y]

BR
-- 
Fabio Porcedda
