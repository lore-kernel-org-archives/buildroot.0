From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Feb 2017 21:28:01 +0100
Subject: [Buildroot] rsyslog plugin selection
Message-ID: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The rsyslog package in Buildroot currently hardcodes the list of
plugins to enable. These plugins define what types of input, output,
parsing, etc. is supported, and is typically very application
dependent.

The current selection amounts to about 1 MB of rootfs, while the
rsyslog daemon itself is only about half of that. By restricting the
list of plugins to those a project actually needs, it is thus possible
to reduce the size of the rootfs.

Two questions arise:
1. should we use one config symbol with a string list, or separate
config symbols for each plugin?

2. should we keep the current set as default, even if it contains less
common options?


A string list can become large, so large that the actual title of the
config symbol is not visible anymore in menuconfig. This is
particulary annoying if we decide to keep the existing long list as
default.

Separate config symbols would solve that problem, but are a bit more
work initially. So, before diving into that, I'd like to hear your
opinions.


Thanks,
Thomas
