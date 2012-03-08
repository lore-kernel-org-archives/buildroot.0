From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 8 Mar 2012 15:06:24 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <CAHXCMMJ6_MEK+WSHG1tezuO8_fANwW18dc_=Wq28dwMo1T1a3Q@mail.gmail.com>
References: <201202282119.38907.arnout@mind.be>
 <1331208055-18533-1-git-send-email-ludovic.desroches@atmel.com>
 <1331208055-18533-2-git-send-email-ludovic.desroches@atmel.com>
 <CAHXCMMJ6_MEK+WSHG1tezuO8_fANwW18dc_=Wq28dwMo1T1a3Q@mail.gmail.com>
Message-ID: <20120308140624.GC3429@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Mar 08, 2012 at 11:48:07AM +0100, Samuel Martin wrote:
> Hi Ludovic, all,
> 
> > + ? ?# If there is a series file, use it instead of using ls sort order
> > + ? ?# to apply patches.
> > + ? ?if [ -e "${path}/series" ] ; then
> > + ? ? ? ?for i in `cat ${path}/series 2> /dev/null` ; do
> > ? ? ? ? ? ? apply_patch "$path" "$i" || exit 1
> 
> Maybe i miss something,

In fact, no...

> but i don't see how you handle disabled
> patches in the series file, i means line starting by '#'?

I didn't know that I could face such case so I didn't handle it.

Is simply checking '#' presency at the beginning of the the patch name enough?


Regards

Ludovic
