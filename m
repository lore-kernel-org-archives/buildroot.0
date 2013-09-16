From: Frank Bergmann <bergmann@rosho.de>
Date: Mon, 16 Sep 2013 17:34:25 +0200
Subject: [Buildroot] running gtk programs fail
In-Reply-To: <20130914073514.6a5f3954@skate>
References: <52330AFB.1050204@rosho.de> <20130914073514.6a5f3954@skate>
Message-ID: <52372501.9070600@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.09.2013 07:35, schrieb Thomas Petazzoni:
> On Fri, 13 Sep 2013 14:54:19 +0200, Frank Bergmann wrote:
>
>> If I start a small test program
>> (https://developer.gnome.org/gtk-tutorial/stable/c39.html#SEC-HELLOWORLD)
>> the window appears but no button. Also I'm unable to close the
>> window. Starting /usr/bin/gtk-demo fail too, nothing happens
>> (no window). I use xorg (modular) and fluxbox, blackbox and
>> enlightenment  work properly.
>>
>> Did I miss something or is libgtk broken ?
>
> Hum, unfortunately there is too little details here to help you. Are
> you running gtk-demo from a terminal? If so, are there any messages
> appearing?
>
> Usually, when doing some X.org, testing I do something like:
>
> X -someoptions &
> export DISPLAY=:0
> gtk-demo
>
> from the serial port console. This way, you can see which messages are
> displayed by gtk-demo.

Thanks for your hint !
But unfortunately it does not help - I can't see anything on the
console.

I also tested a very basic SDL program which simple call

   SDL_Init(SDL_INIT_VIDEO)

That call does not return and let the program hang. So I guess there
is something important missing in my system that inhibit gtk and SDL
from working (maybe some Xorg or kernel stuff). I have to investigate
this.

With regards,
Frank.
