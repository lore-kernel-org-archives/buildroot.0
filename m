From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue, 18 Nov 2014 15:59:56 +0800
Subject: [Buildroot] [PATCH] pakage/erlang: fix host build without
 termcap (curses) library
In-Reply-To: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
References: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <546AFC7C.1060501@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 06:33, Yann E. MORIN wrote:
> Cc-ing Nathaniel, as all failures happen on his build server. Thomas and
> Nathaniel, could you please review the setting of that autobuild server?
> And the others as well?
>
> It seems legit ncurses is missing on a build server, but we did not
notice,
> because we do require it for menuconfig and nconfig, so virtually everyone
> has it, and it is most probably installed on other autobuild servers
> because owners want to be able to run menuconfig on them to debug stuff.
>
> Care to have a look, please?
>
> Regards,
> Yann E. MORIN.

I haven't installed libncurses-dev per the discussion we had a few
weeks/months back. (Basically only use the system's ncurses for 'make
*config', and in all other cases build it)

I haven't heard otherwise, and this is also causing failures in
host-mysql (IIRC).

If you both believe that I should install it, I will, but I still
believe it is better to build host-ncurses.

Thanks, Nathaniel.
