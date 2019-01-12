From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 12 Jan 2019 18:01:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-11
In-Reply-To: <20190112070027.D3C1E20898@mail.bootlin.com>
References: <20190112070027.D3C1E20898@mail.bootlin.com>
Message-ID: <20190112180120.GB16565@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sat, 12 Jan 2019 08:00:27 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> [...]
>
> Results for branch '2018.11.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                 host-libsodium | 1 
>                 libmpeg2-0.5.1 | 1 
>               webkitgtk-2.22.5 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>          sh4 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/93b41bf4373c40ffa0efa90b6b767de0aceb3ce7 |     
>      powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/29b896b63832382523f8df8eca67a199ec5a005b | ORPH
>       mipsel |               webkitgtk-2.22.5 | NOK | http://autobuild.buildroot.net/results/dd89d219efb711ecaa71a268bd6b36b06b035c80 |     

The WebKitGTK+ build failure is triggered when OpenGL support is disabled, due
to a bug that slipped in an internal header in the 2.22.x releases. I have
filed a bug upstream, hoping that it will be fixed for a 2.22.6 release:

  https://bugs.webkit.org/show_bug.cgi?id=193380

I am going to submit a patch for it later on, and make a patch for Buildroot
as well.

Cheers,


-Adri?n

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190112/ae9c79b7/attachment.asc>
