From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:26:22 +0200
Subject: [Buildroot] [RFC PATCH 4/4] testing/infra/emulator: remove qemu
 warnings about audio
In-Reply-To: <20170730044946.11999-4-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
 <20170730044946.11999-4-ricardo.martincoski@gmail.com>
Message-ID: <20170731212622.77550249@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 01:49:46 -0300, Ricardo Martincoski wrote:
> The default audio backend for qemu is configured at compile time. It
> generates annoying warning messages to qemu's stderr when running our
> tests, like these:
> pulseaudio: set_sink_input_volume() failed
> pulseaudio: Reason: Invalid argument
> pulseaudio: set_sink_input_mute() failed
> pulseaudio: Reason: Invalid argument
> 
> Explicitly set the audio backend to "none" at runtime to remove those
> messages from our logs. There is no command line argument for this, so
> use an environment variable when starting qemu.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  support/testing/infra/emulator.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
