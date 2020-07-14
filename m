From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:30:26 +0200
Subject: [Buildroot] [PATCH v2] package/x11r7/xfont_font-*: make outputs
 reproducible
In-Reply-To: <20200714012459.21451-1-asierra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
 <20200714012459.21451-1-asierra@xes-inc.com>
Message-ID: <20200714143026.2180ebea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 20:24:59 -0500
Aaron Sierra <asierra@xes-inc.com> wrote:

> Prior to gzip 1.10, the compression pipeline used with PCF fonts was
> not reproducible due to the implicit -N/--name injecting a timestamp:
> 
>   $ cat /path/to/file | gzip > /path/to/file.gz
> 
> This updates Portable Compiled Format font packages to have a host-gzip
> dependency, so gzip version 1.10 or newer will reliably be used.
> 
> This change does not affect encodings, which use a seemingly synonymous
> compression pipeline that happens to be reproducible with gzip versions
> at least as old as version 1.3.13:
> 
>   $ gzip < /path/to/file > /path/to/file.gz
> 
> Reported-by: Jordan Speicher <jspeicher@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> Changes v1 -> v2:
>   - Use host-gzip instead of converting to bzip2 for reproducibility

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
