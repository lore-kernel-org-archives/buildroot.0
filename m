From: Toan Pham <tpham3783@gmail.com>
Date: Wed, 17 Jan 2018 17:06:15 -0500
Subject: [Buildroot] Suggestion for Makefile to probably import BR2_CONFIG
Message-ID: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to make a suggestion on patching the main Makefile line:

BR2_CONFIG = $(CONFIG_DIR)/.config

to

BR2_CONFIG ?= $(CONFIG_DIR)/.config


The main reason for this patch is that it allows the configuration file to
be specified from command argument.  For example, I would be able to build
two different targets (even in parallel) with the following commands:


make BR2_CONFIG=$PWD/myTarget1 O=output.target1

make BR2_CONFIG=$PWD/myTarget2 O=output.target2


Without the above patch, buildroot assumes that the config file is already
saved under output.target{1,2}/.config and would fail if the file does not
exist.  I find that the above patch is very valuable, please comment or
make suggestion!


thank you,

TP
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180117/54ca3a3e/attachment.html>
