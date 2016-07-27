From: Christian Stewart <christian@paral.in>
Date: Wed, 27 Jul 2016 15:12:42 -0700
Subject: [Buildroot] [PATCH v11 2/2] docker-engine: new package
In-Reply-To: <20160727234055.2dad417f@free-electrons.com>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <1469394628-19412-2-git-send-email-christian@paral.in>
 <20160727234055.2dad417f@free-electrons.com>
Message-ID: <CA+h8R2pPpTH2m1QpbBLB3QuXNCGeTZkO5C97b2KE+R8Njn0eeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jul 27, 2016 at 2:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I've applied after removing the LIBRARY_PATH variable, as you suggested.

Great, thanks.

> However, there is still one thing I'm not happy with: dockerd is linked
> statically against libbtrfs. It links dynamically against
> libdevmapper.so, because there is no libdevmapper.a installed. However,
> since libbtrfs is available in STAGING_DIR as both a shared library
> *and* a static library, the Go build logic seems to prefer the static
> library. This is definitely *not* what we want in the context of
> Buildroot.

This is more of Geoff's expertise, I'll defer to him but will
investigate down the line if he is unavailable to comment.

Thanks,
Christian
