From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 1 Jan 2014 21:24:22 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <CAAXf6LXUE7byUiqyPoBWFA_JpwHYk1dYMg9RXcYLkyZmZEZJSA@mail.gmail.com>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <52C1FD9C.9060401@lucaceresoli.net>
 <CAEYzJUGnXJ1x-Qcrxd0xy7LLSDLcjie-9=JZwJoV=sR5wWj8kA@mail.gmail.com>
 <CAAXf6LXUE7byUiqyPoBWFA_JpwHYk1dYMg9RXcYLkyZmZEZJSA@mail.gmail.com>
Message-ID: <CAEYzJUE+h0FOd6X3unko-dOJgcFKJkL607JO4XB4Uc40fxXiCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 1 January 2014 18:13, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[...]
> There is at least one reason why using variables to refer to tools in
> makefiles makes sense: in make, any variable can be overruled on the
> command-line. So you can call 'make SED=/my/own/sed' without any
> special rules in the makefile itself. This is not possible if you
> directly use 'sed' (or whatever tool).

Good point.

I don't know if your remark was specific to my patch or just in
general, but I'd like to point out this patch changes a shell script,
not a makefile. Although a bit more troublesome than your make
example, this injects custom 'sed' in any language:
PATH=/my/sed/bin:$PATH some_tool.

I consider this patch a minor "fix". Adding variables for commands
(everywhere) in Buildroot is a different thing that should be in a
different patch set.

Please let me know if there is anything in *this* patch that I need to
change to get it merged.

Best regards,
Bj?rn Forsman
