From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:53:01 +0100
Subject: [Buildroot] [PATCH] toolchain-external: restrict copying of
 dynamic loader to ld*.so.*
In-Reply-To: <20190205211544.26547-1-patrickdepinguin@gmail.com>
References: <20190205211544.26547-1-patrickdepinguin@gmail.com>
Message-ID: <20190215225301.4d66f516@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 22:15:44 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
> ("toolchain-external: copy ld*.so* for all C libraries") changed (among
> other things) the glob pattern to catch the dynamic loader from
>     ld*.so.*
> to
>     ld*.so*
> 
> thus now matching files like 'ld-2.20.so' in addition to files like
> 'ld.so.1'.

I'm curious what is the problem with matching ld-2.20.so, and how can
this bring more files than needed ?

(Note: I think the change is OK, I just want to understand how you
noticed.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
