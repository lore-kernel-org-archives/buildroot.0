From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 27 Jan 2014 21:01:27 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
Message-ID: <CAEYzJUEZMqJS=tOtd8n2dPAnsSm1XW7Fr0VqocboOE5VwGzqgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 January 2014 10:19, Samuel Martin <s.martin49@gmail.com> wrote:
> Bj?rn, all,

[...]

> "command -v" seems not playing very well with aliases:
>
> $ command -v make
> alias make='~/.config/ctafconf/bin/colorwarper make'
> $ which make
> /usr/bin/make

Ah, correct.

There is "type -P" which is more like "which" in that regard, but the
"-P" option doesn't seem to be specified by POSIX. For example, "type
-P which" fails in dash.

Instead of an alias, you could write a one-liner shell wrapper? I tend
to prefer wrappers over aliases anyway, because of issues like these;
aliases sometimes behave differently than proper commands.

Best reagards,
Bj?rn Forsman
