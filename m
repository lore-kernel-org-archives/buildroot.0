From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 12:31:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: re-enable hashlib
In-Reply-To: <20200203111837.13376-1-titouan.christophe@railnova.eu>
References: <20200203111837.13376-1-titouan.christophe@railnova.eu>
Message-ID: <20200203123112.41c6247b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 12:18:37 +0100
titouan.christophe at railnova.eu wrote:

> From: Titouan Christophe <titouan.christophe@railnova.eu>
> 
> In commit e5cfb319f9493d677f059ca72b80f7fa22fc9f0f,
> the committer did add the flag `--disable-hashlib` to python,
> even though this was not part of the original patch
> (https://patchwork.ozlabs.org/patch/1231905/).
> 
> This unexpected modification break the builds of waf-based
> packages, such as jack2, mpv or aubio. This commit therefore
> 
> Fixes: http://autobuild.buildroot.net/results/2b3/2b377bcfda6e7ae4d6bb894664e3a4cb13a70b6d/
> Fixes: http://autobuild.buildroot.net/results/cd5/cd5da8cb3da8479ebee60d011ce0c5dc0e59aab7/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Note to self: "git commit -a --amend" can be dangerous. Sorry for the mess.

However, this particular change is related to a discussion I had on the
mailing list about this hashlib module which was causing build issues
on some machines in host Python. This module needs OpenSSL on the host,
which we don't have installed on some autobuilders. So how come we
hadn't seen these failures before ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
