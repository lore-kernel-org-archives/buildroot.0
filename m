From: Alan Ott <alan@signal11.us>
Date: Sun, 02 Feb 2014 16:45:23 -0500
Subject: [Buildroot] [PATCH] package/joe: Add package for the JOE editor
In-Reply-To: <878uttr303.fsf@dell.be.48ers.dk>
References: <1391301769-28263-1-git-send-email-alan@signal11.us>
 <878uttr303.fsf@dell.be.48ers.dk>
Message-ID: <52EEBC73.9030709@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/2014 09:41 AM, Peter Korsgaard wrote:
>>>>>> "Alan" == Alan Ott <alan@signal11.us> writes:
>   > JOE is an easy-to-use, full-screen, terminal-based text editor.
>   > http://joe-editor.sf.net
>
> Thanks, see below for a few comments.
>
> You forgot to add it to package/Config.in

Oops.

>
> We do have ncurses in buildroot, so it should enable support for it if
> ncurses is enabled.

What you have is fine, but it's worth mentioning that curses support 
doesn't actually help joe anymore. If you grep through the joe source, 
it only includes ncurses in one file, and doesn't actually use anything 
out of it. The resulting binary even from a "use curses" build doesn't 
actually even link to the ncurses library (it's optimized out by the 
linker).

> I did a test build for uClibc and I see it uses the XSI math bessel
> functions which are not enabled for default, so I added a patch to
> disable those if needed.

Awesome!

> Committed with these issues fixed, thanks.

Thanks for the fixup and commit, and for all your work on Buildroot.

Alan.
