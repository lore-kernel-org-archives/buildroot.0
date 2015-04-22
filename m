From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:10:47 +0200
Subject: [Buildroot] [PATCH 16/16] package/rng-tools: add systemd
 support for rngd
In-Reply-To: <1421684056-5266-17-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-17-git-send-email-maxtram95@gmail.com>
Message-ID: <20150422221047.0a119b41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:16 +0200, Maxim Mikityanskiy wrote:
> Add rngd.service for systemd. Also patch rngd with patch from Fedora to
> ignore failure if no hwrng present:
> https://bugzilla.redhat.com/show_bug.cgi?id=892178
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/rng-tools/rng-tools.mk         |  8 ++++++++
>  package/rng-tools/rngd-exit-code.patch | 11 +++++++++++
>  package/rng-tools/rngd.service         |  9 +++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/rng-tools/rngd-exit-code.patch
>  create mode 100644 package/rng-tools/rngd.service

Applied, after doing a number of changes:

    [Thomas:
     - rename patch to the proper naming convention
     - add description and SoB to patch
     - install service file to /usr/lib/systemd and not /lib/systemd
     - use a relative symbolic link instead of an absolute one]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
