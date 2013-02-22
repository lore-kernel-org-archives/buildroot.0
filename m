From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Feb 2013 23:53:48 +0100
Subject: [Buildroot] [PATCH 3/6] package/tvheadend: wait for DVB devices
In-Reply-To: <87hal4c6l7.fsf@dell.be.48ers.dk>
References: <cover.1361143078.git.yann.morin.1998@free.fr>
 <265e8598251b35399c144699c4e0ffb250f87286.1361143078.git.yann.morin.1998@free.fr>
 <87hal4c6l7.fsf@dell.be.48ers.dk>
Message-ID: <201302222353.48564.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 22 February 2013 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> Wait for DVB devices before starting up the tvheadend daemon.
>  Yann> Wait for maximum 15 seconds.
> 
>  Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> ---
>  Yann>  package/tvheadend/S99tvheadend |    7 +++++++
>  Yann>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
>  Yann> diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
>  Yann> index 407b873..3a1218a 100644
>  Yann> --- a/package/tvheadend/S99tvheadend
>  Yann> +++ b/package/tvheadend/S99tvheadend
>  Yann> @@ -23,6 +23,13 @@ ARGS="-f"
>  
>  Yann>  case "$1" in
>  Yann>      start)
>  Yann> +        printf "Waiting for DVB device nodes..."
>  Yann> +        cpt=15
>  Yann> +        while [ ! -d /dev/dvb/adapter0 -a ${cpt} -gt 0 ]; do
> 
> I don't know much about tvheadend, but are people always going to use it
> with dvb? E.G. I have a hdhomerun and a ivtv (v4l) device, but no dvb.

Right. This was intended to be a stop-gap as my rpi boots too fast, and
the USB devices are not completely enumerated by the time tvheadend starts
up. So I would end up with no DVB device at all in tvheadend.

So, please feel free to drop this patch, I'll try to think of another way.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
