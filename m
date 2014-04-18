From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Apr 2014 21:38:10 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
 for kernels older than 3.x.
In-Reply-To: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CACXmViZdUqoCUJi7QjuegYGqFkPU3P3PtALzC9N2cTX5VinOtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 18, 2014 at 9:28 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> From: Matt Poduska <mjpodusk@rockwellcollins.com>
>
> In the case where DEVTMPFS is desired for older kernels where the
> support is experimental, it's still possible to enable the option in
> the board's specific linux .config instead of relying on buildroot to
> make the modification.

Why? 2.6.32 is 5+ years old by now, and expecting modern SW to work
with older kernels nowadays is probably not worth it. Udev has also
required devtmpfs since quite a while, so I don't think you should
read much into the "experimental" status.

If the kernel really is that ancient that it doesn't have devtmpfs,
then the .config mangling afaik becomes a noop, so I don't see what we
gain by not doing it.

-- 
Bye, Peter Korsgaard
