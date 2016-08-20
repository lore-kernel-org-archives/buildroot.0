From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:45:53 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: fix build with gcc 6
In-Reply-To: <1471684160-22757-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471684160-22757-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160820114553.47aeb345@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 14:39:20 +0530, Rahul Bedarkar wrote:
> With gcc version 6, we get the following error when building jack2:
> 
>   ../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
>    jack_latency_range_t   capture_latency = {-1, -1};
>                                                    ^
>   ../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
>   ../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
>    jack_latency_range_t   playback_latency = {-1, -1};
>                                                     ^
>   ../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
> 
> This is fixed by grabbing an upstream commit,
> ff1ed2c4524095055140370c1008a2d9cccc5645
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8a8/8a8d533a0f785591fee10f1c09c9294f892ef7f7/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/jack2/jack2.hash | 1 +
>  package/jack2/jack2.mk   | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
