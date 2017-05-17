From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 22:00:06 +0200
Subject: [Buildroot] [PATCH 3/3] support/testing: simplify logging by
 keeping the log file open
In-Reply-To: <1494452026-21567-3-git-send-email-luca@lucaceresoli.net>
References: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
 <1494452026-21567-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20170517220006.02dd1e60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 23:33:46 +0200, Luca Ceresoli wrote:
> We currently call infra.smart_open() to open log files each time we
> need to write to them.
> 
> Opening the file once in the constructor of Builder and Emulator and
> writing to it whenever needed is simpler and slightly more efficient.
> 
> Remove smart_open and instead create a new open_log_file() function
> which just opens the logfile. Also let it compute the filename, in
> order to simplify even further the Builder and Emulator code.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/testing/infra/__init__.py | 21 +++++++--------------
>  support/testing/infra/builder.py  | 12 +++---------
>  support/testing/infra/emulator.py | 15 +++++----------
>  3 files changed, 15 insertions(+), 33 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
