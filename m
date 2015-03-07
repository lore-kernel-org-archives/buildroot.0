From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:32:34 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
Message-ID: <20150307173234.57c8bf4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sat, 7 Mar 2015 17:29:56 +0100, Fabio Porcedda wrote:

> IMHO it's cleaner if instead of adding this patch you can add a
> post_patch hook that using sed change all "DGifCloseFile(gif)" to
> "DGifCloseFile(gif, NULL)".

I don't agree. Such sed expressions can very easily be overlooked when
bumping the package, and they don't solve a problem that should be
solved by submitting a patch to the upstream project.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
