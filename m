From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 23:43:48 +0100
Subject: [Buildroot] [PATCH 3/6] package/tvheadend: wait for DVB devices
In-Reply-To: <265e8598251b35399c144699c4e0ffb250f87286.1361143078.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 18 Feb 2013 00:22:29 +0100")
References: <cover.1361143078.git.yann.morin.1998@free.fr>
 <cover.1361143078.git.yann.morin.1998@free.fr>
 <265e8598251b35399c144699c4e0ffb250f87286.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <87hal4c6l7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Wait for DVB devices before starting up the tvheadend daemon.
 Yann> Wait for maximum 15 seconds.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/tvheadend/S99tvheadend |    7 +++++++
 Yann>  1 files changed, 7 insertions(+), 0 deletions(-)

 Yann> diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
 Yann> index 407b873..3a1218a 100644
 Yann> --- a/package/tvheadend/S99tvheadend
 Yann> +++ b/package/tvheadend/S99tvheadend
 Yann> @@ -23,6 +23,13 @@ ARGS="-f"
 
 Yann>  case "$1" in
 Yann>      start)
 Yann> +        printf "Waiting for DVB device nodes..."
 Yann> +        cpt=15
 Yann> +        while [ ! -d /dev/dvb/adapter0 -a ${cpt} -gt 0 ]; do

I don't know much about tvheadend, but are people always going to use it
with dvb? E.G. I have a hdhomerun and a ivtv (v4l) device, but no dvb.

-- 
Bye, Peter Korsgaard
