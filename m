From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:30:51 +0100
Subject: [Buildroot] [PATCH 3/7] rsyslog: rename sysv initscript to
 S01logging
In-Reply-To: <1421191022-5509-3-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
 <1421191022-5509-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114203051.513c370c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 13 Jan 2015 20:16:58 -0300, Gustavo Zacarias wrote:
> Do it to avoid having duplicate and conflicting functionality with
> busybox's S01logging.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rsyslog/{S01rsyslog => S01logging} | 0
>  package/rsyslog/rsyslog.mk                 | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/rsyslog/{S01rsyslog => S01logging} (100%)

To be honest, I wasn't really sure whether the right approach to handle
this issue was to rename the init script as you did, or to have rsyslog
explicitly remove S01logging when Busybox is enabled.

Since the rest of patch series was doing some cleanup on the renamed
S01logging, I decided to take your approach, but I must say I wasn't
entirely sure on how to handle this.

Comments from others are welcome, I don't consider the proposed
solution to be set in stone.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
