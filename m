From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 09:31:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux: xenomai: allow URL for the
 ADEOS/IPIPE patch
In-Reply-To: <d4035039-6dfe-046b-48da-fa323489e5fa@armadeus.com>
References: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
 <20190518220632.312f98da@windsurf> <20190519091707.GB4569@scaer>
 <d4035039-6dfe-046b-48da-fa323489e5fa@armadeus.com>
Message-ID: <20190520093132.501097d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 May 2019 09:29:55 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> I don't understand what you mean with "it is scrubbed", sorry.
> With the file:// scheme, Buildroot will try to download the patch with
> wget and fail, that's why I filter the file:// scheme out.

Not with your latest version. With your latest version, you add the
patch URL to EXTRA_DOWNLOADS only if it contains http://, https:// or
ftp://. So if it's a plain path, like /home/foo/bar, it certainly won't
try to download it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
