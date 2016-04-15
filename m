From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 15 Apr 2016 17:11:56 -0300
Subject: [Buildroot] [PATCH v2 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <20160415220107.585d1fb2@free-electrons.com>
References: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460735767-2577-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160415220107.585d1fb2@free-electrons.com>
Message-ID: <CAAEAJfAgt5e6QK2aKLiit-upNmi1AWmcOUz5qDtqQU+EYMf0nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 April 2016 at 17:01, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 15 Apr 2016 12:56:07 -0300, Ezequiel Garcia wrote:
>
>>  .../fs-overlay-graphical/usr/bin/startx            | 248 +++++++++++++++++++++
>
> This script looks really long and complicated. Where does it come from?
> Is it really specific to the Minnowboard?
>

Nope, it's the standard startx script, provided by the xinit package.
I'm pretty sure all distros bundle the same cumbersome startx script.

It is perfectly possible to write a much, much simpler script.

In fact, the juicy part is this:

xinit "$client" $clientargs -- "$server" $display $serverargs

I.e., It is possible to run xinit, with a couple params and it would work.
The only change needed is running X on a different VT, which
startx forces to be the controlling terminal.

The problem (or a related one?) is well described here:
https://bugs.freedesktop.org/show_bug.cgi?id=87762

BTW: now that I think of it, I'm not sure this script is needed,
since it was somewhat related to systemd being used.
I will check again, and in any case, provide a simpler startx.

> Another open question is whether we should add some details in
> readme.txt about this configuration, like which demos are provided,
> example commands to run to test the whole thing, etc.

Sure, that makes sense.

I'll cook a v3.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
