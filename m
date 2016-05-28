From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 18:35:14 +0200
Subject: [Buildroot] [PATCH v2 3/4] gdb: enable simulator support for
 host build
In-Reply-To: <20160528154811.GJ22609@waldemar-brodkorb.de>
References: <20160513121651.GA30939@waldemar-brodkorb.de>
 <20160528154933.575c86c3@free-electrons.com>
 <20160528154811.GJ22609@waldemar-brodkorb.de>
Message-ID: <20160528183514.4fe9597d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 17:48:11 +0200, Waldemar Brodkorb wrote:

> I totally forgot about it. See here:
> https://www.sourceware.org/ml/gdb/2015-12/msg00029.html
> 
> For newer GDB (7.10.1/7.11) we need to use out-of-tree builds. I
> only tested with 7.9, I think it was the default by the time I
> tested it or I changed it.
> 
> How would we change package/gdb to use out-of-tree building?

The fact that it doesn't work with in-tree build is really a bug, so
I'm not sure we should switch to out of tree build just for this
reason. We should probably instead backport the patches needed to fix
the in-tree build, or use the workaround proposed by Mike, at least for
the affected gdb versions. I've tested with gdb 7.10 only, not sure if
7.11 is affected or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
