From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 12:12:43 -0500
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: copy all
 directories and files when installing
In-Reply-To: <20200418190701.2629613-2-aduskett@gmail.com>
References: <20200418190701.2629613-1-aduskett@gmail.com>
 <20200418190701.2629613-2-aduskett@gmail.com>
Message-ID: <CAMQcK5L5g5oGavdXg5tMnoRa9jSb7G1Sym=j+pYNdmm-0ONEHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam/All,

On Sat, Apr 18, 2020 at 2:10 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Several directories and files are currently not installed during the
> target installation, these include:
>   - conf
>     Several configuration files, including security configuration files which
>     may be necessary for running various java applications.
>
>   - legal
>     This directory contains legal notices that some java applications may
>     require, as they may print legal information and will throw exceptions at
>     runtime if the legal files are not present on the system.
>
>   - release
>     This file contains a list of modules included in the image.
>
> Because these directories take up less than of megabyte extra, it is not an
> issue to install all of them.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added a better explination for why the legal directory is necessary.
>
>  package/openjdk/openjdk.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Built and runtime tested on x86-64 platform.

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
