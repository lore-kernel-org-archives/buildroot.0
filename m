From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 26 Jun 2014 16:11:56 +0200
Subject: [Buildroot] Raspberry Pi: recommendations for web kiosk
In-Reply-To: <CAAXf6LUR=nSyh3GPk037uYUOE3hRngWmrj+YOxiQe6RD75TRBw@mail.gmail.com>
References: <CAAXf6LXK64M-BO3V-K6e_27m7UhYOe3N01oXBSVfF6NUdqrARA@mail.gmail.com>
 <20140626124257.GA13409@rmm-p1267483>
 <CAAXf6LUR=nSyh3GPk037uYUOE3hRngWmrj+YOxiQe6RD75TRBw@mail.gmail.com>
Message-ID: <CAGduivy_UeKzOydEcXgfNQj=fiORmk+To+rS++p7yp+6qP2_OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Like Eric, my two cents since I never started anything graphical but
XBMC on a Raspberry :).

On Thu, Jun 26, 2014 at 3:15 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Eric,
>
> On Thu, Jun 26, 2014 at 2:42 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
>> Hi!
>> On Wed, Jun 25, 2014 at 03:02:29PM +0200, Thomas De Schampheleire wrote:
>>> Hi,
>>>
>>> We currently use a Raspberry Pi as a simple web-wall. It cycles every
>>> two minutes between two (non-local) web pages, one of which contains a
>>> few iframes.
>>>
>>> While this can hardly be called a resource-intensive task, the
>>> Raspberry Pi by no means performs this fluently. The pages load
>>> relatively slow, and administration tasks on this pi also suffer from
>>> hickups.
>>>
>>> The pi currently contains a raspbian image (not done by me, I swear!
>>> :-) ) and uses chromium in kiosk mode to display the web pages.
>>>
>>> My basic question is: can I expect to get better performance by
>>> setting up a custom buildroot image, or is rpi so poor in performance,
>>> even for this mundane task?
I don't know Raspbian so I don't know if you would gain by building a
small image with Buildroot, maybe you got a bunch of software launched
at startup that you don't really need, that sort of stuff.
I think the RPi is plenty powerfull for this.
>>> Which packages should I select to achieve this?
Well, rpi-userland and your browser (and obviously busybox, etc)
should be enough. A custom /etc/network/interfaces in a post-build
script and you should be set.
>>>
>>> Do I need an X.org or not really?
>>> If X.org is needed, does 'Kdrive / tinyX' work on rpi, or should I
>>> select modular x.org, and how do these compare.
>>> (as you notice, I have never set up embedded boards with graphical stuff).
>>>
>>> Which browser should/could I use? Preferably something that can run in
>>> fullscreen mode as this is a kiosk-like board.
There's some browser that claim to be lightweight, like Midori (which
seems to support kiosk mode:
http://wiki.xfce.org/midori/faq#kiosk_mode) and is included in
Raspbian and more importantly, Buildroot :).
Since I have never used any, I don't know what its really worth.
You maybe also have the option to use firefox (or maybe other browser)
on the framebuffer, so you would avoir X.org altogether.
>>>
>>> Is rpi-userland needed / recommended? How would I benefit from it?
If your browser is built for the raspberry, maybe it coud uses it
could uses the GPU to do some rendering ? (wild guess, I don't know if
this is supported/possible)
>>>
>>> Any other recommendations/tips are welcome too, of course.
>> Just my two cents: how about using a custom application based on QtWebkit with
>> EGLFS [1]?
>>
>
> This is not a commercial product, but rather an internal information
> screen used on the workfloor. So writing custom applications, which I
> assume is quite some work, is not acceptable. I am hoping for a more
> or less out-of-the-box solution...
>
> Thanks for the feedback!
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
