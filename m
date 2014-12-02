From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 09:26:36 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-download: check for already
 downloaded file in the download wrapper
In-Reply-To: <936ed487d76e1dd36230de9a26d57da908680d79.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <936ed487d76e1dd36230de9a26d57da908680d79.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <20141202092636.4bbfea66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  2 Dec 2014 00:24:06 +0100, Yann E. MORIN wrote:
> Instead of repeating the same test again and again in all our download
> rules, just delegate the check for an already downloaded file to the
> download wrapper.
> 
> This clears up the path for doing the hash checks on a cached file
> before the download.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

It has the consequence of doing another fork+exec of a shell script for
all files, even if they have already been downloaded. I don't know if
this is really measurable compared to the overall build time, though,
except maybe on some cases like "make source". So maybe this is OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
