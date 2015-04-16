From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 19:05:25 +0200
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <alpine.LFD.2.11.1504160912290.18180@localhost>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
 <alpine.LFD.2.11.1504160912290.18180@localhost>
Message-ID: <20150416170525.GA4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2015-04-16 09:17 -0400, Robert P. J. Day spake thusly:
[--SNIP--]
>   i know, i referred to that very config option in my original
> posting. what i'm wondering is if that config option -- "Primary
> download site" -- can be set to point at a local directory on my build
> host that's already loaded with S/W tarballs i've built up over the
> months for use with my OE and yocto builds.
> 
>   the help for that option says only that, "Valid URIs are URIs
> recognized by $(WGET) and scp URIs of the form
> scp://[user@]host:path." last time i looked, wget doesn't support the
> "file://" form of URI, so i can't use that.
> 
>   is there a standard way to do this?

Short answer: no.

Long answer:

BR2_DL_DIR is used both as a way to look for existing download, and as
the location where new downloads will be stored.

So, if you set (in the menuconfig or on the command line)
BR2_DL_DIR=/path/to/your/local/cache it will be looked into for existing
archives, and Buildroot will also store the ones it downlaods on its on
there.

If you really, really wish no to shared the download location, you could
get to run a simple webserver locally that you would use as a primary.
But then Buildroot would also store the archives it downloads from the
primary in its own dl/ dir (hence duplication in that case).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
