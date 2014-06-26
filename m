From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 26 Jun 2014 14:42:58 +0200
Subject: [Buildroot] Raspberry Pi: recommendations for web kiosk
In-Reply-To: <CAAXf6LXK64M-BO3V-K6e_27m7UhYOe3N01oXBSVfF6NUdqrARA@mail.gmail.com>
References: <CAAXf6LXK64M-BO3V-K6e_27m7UhYOe3N01oXBSVfF6NUdqrARA@mail.gmail.com>
Message-ID: <20140626124257.GA13409@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Wed, Jun 25, 2014 at 03:02:29PM +0200, Thomas De Schampheleire wrote:
> Hi,
>
> We currently use a Raspberry Pi as a simple web-wall. It cycles every
> two minutes between two (non-local) web pages, one of which contains a
> few iframes.
>
> While this can hardly be called a resource-intensive task, the
> Raspberry Pi by no means performs this fluently. The pages load
> relatively slow, and administration tasks on this pi also suffer from
> hickups.
>
> The pi currently contains a raspbian image (not done by me, I swear!
> :-) ) and uses chromium in kiosk mode to display the web pages.
>
> My basic question is: can I expect to get better performance by
> setting up a custom buildroot image, or is rpi so poor in performance,
> even for this mundane task?
> Which packages should I select to achieve this?
>
> Do I need an X.org or not really?
> If X.org is needed, does 'Kdrive / tinyX' work on rpi, or should I
> select modular x.org, and how do these compare.
> (as you notice, I have never set up embedded boards with graphical stuff).
>
> Which browser should/could I use? Preferably something that can run in
> fullscreen mode as this is a kiosk-like board.
>
> Is rpi-userland needed / recommended? How would I benefit from it?
>
> Any other recommendations/tips are welcome too, of course.
Just my two cents: how about using a custom application based on QtWebkit with
EGLFS [1]?

Best regards,
ELB

[1] http://qt-project.org/doc/qt-5/embedded-linux.html
