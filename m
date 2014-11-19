From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 22:50:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: fix init script
In-Reply-To: <1415833586-6181-1-git-send-email-jkrause@posteo.de>
References: <1415833586-6181-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141119225045.08b2bfc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 13 Nov 2014 00:06:26 +0100, J?rg Krause wrote:
> shairport-sync uses libdaemon for running as daemon and creating the pidfile
> which conflicts with start-stop-daemons `-b -m` options. For that reason 
> shairport-sync does not start using /etc/init.d/S99shairport-sync start.
> 
> The issue is fixed by removing the background and pidfile task from
> start-stop-daemon and add a daemon option `-d` to shairport-sync.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/shairport-sync/S99shairport-sync | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
