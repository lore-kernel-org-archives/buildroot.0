From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 13:20:48 +0100
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: make
 it Python 3.x compatible
In-Reply-To: <20191203165457.1100390-1-thomas.petazzoni@bootlin.com>
References: <20191203165457.1100390-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191204132048.1fc824b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 17:54:57 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> With Python 3.7, the autobuild-run did not work due to the following
> issues:
> 
>  - The urlparse module no longer exists, it's not urllib.parse
> 
>  - 0022 is no longer recognized as an octal value, we must use 0o022,
>    which also works in Python 2.x
> 
>  - reading the CSV file with the list of branches through the CSV
>    parser failed due to the lack of decoding, as urlopen_closing()
>    returns a stream of bytes and not strings. So we need to call
>    decode_bytes() on each element of the CSV array. Since the CSV file
>    is typically 3 or 4 lines long, we don't really need to optimize
>    things.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  scripts/autobuild-run | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
