From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:10:28 +0200
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 1.25.9
In-Reply-To: <20200714200202.56068-1-matthew.weber@rockwellcollins.com>
References: <20200714200202.56068-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200714221028.5032da11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 15:02:02 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes CVE-2020-7212 (1.25.2 - 1.25.7)
> The _encode_invalid_chars function does not remove duplicate percent
> encodings in the _percent_encodings array, which combined with the
> normalization step could take O(N^2) time to compute for a URL of
> length N. This results in a marginally higher CPU consumption
> compared to the potential linear time achieved by deduplicating
> the _percent_encodings array.
> 
> CC: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> 
> Also applies to 2020.02.x
> ---
>  package/python-urllib3/python-urllib3.hash | 5 ++---
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
