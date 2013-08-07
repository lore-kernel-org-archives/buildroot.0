From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 07 Aug 2013 10:15:17 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
Message-ID: <52020215.6030609@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 07.08.2013 08:44, schrieb Thomas De Schampheleire:
> echo -ne "\033]0;something\007"
> 
> but it doesn't change a thing.

I think the quoting and controling syntax is wrong. The following string
works here fine in a Gnome terminal.

> echo -ne "\033[2msomething\033[0m other text\n"

Or with a underline and in green.

> echo -ne "\033[4;32msomething\033[0m other text\n"

You need to set up the starting thing with '\033["$foo-color"' and
finally switch at the end to the to the default back '\033[0m'

More info around colors in the Bash can be found on
http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
But that's only for the Bash!

Hope that helps.

Regards
Carsten
