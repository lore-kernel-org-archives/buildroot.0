From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:39:58 +0200
Subject: [Buildroot] [PATCH v2 1/7] linux-firmware: drop revision
 handling for iwlwifi
In-Reply-To: <1461077048-16189-2-git-send-email-gustavo@zacarias.com.ar>
References: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
 <1461077048-16189-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160424233958.25255a93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 11:44:02 -0300, Gustavo Zacarias wrote:
> And enable wildcard firmware file specs.
> 
> This avoids a lot of unnecessary complication with lots of revison knobs
> for different chipsets and it's consequence when bumping linux-firmware
> as well.
> 
> Users can purge unwanted versions from a post processing script if
> target space is too constrained.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-firmware/Config.in         | 41 --------------------------------
>  package/linux-firmware/linux-firmware.mk |  9 +++----
>  2 files changed, 5 insertions(+), 45 deletions(-)

I've applied, but for clarity, I've split this commit into two: a first
one just adding the support for using wildcards in
LINUX_FIRMWARE_FILES, and the second one dropping the revision handling
for iwlwifi. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
