From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:06:12 +1300
Subject: [Buildroot] [PATCH 1/2] linux-pam: adjust login pam file for
 SELinux
In-Reply-To: <1481056025-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1477423570-15694-3-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1481056025-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170125230612.67a66f1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 21:27:03 +0100, Thomas Petazzoni wrote:
> When SELinux support is enabled, the login pam file installed by
> linux-pam should be adjusted to use the pam_selinux.so module.
> 
> To achieve this in a reasonably simple manner, we introduce the SELinux
> related lines in login.pam as comments, and if SELinux support is
> enabled, turn those commented lines into real lines.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linux-pam/linux-pam.mk | 5 +++++
>  package/linux-pam/login.pam    | 2 ++
>  2 files changed, 7 insertions(+)

I've applied both patches. They have been tested by Bryce, and nobody
objected to the approach.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
