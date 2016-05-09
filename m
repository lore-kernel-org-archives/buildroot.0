From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 23:16:06 +0200
Subject: [Buildroot] About python2 and python3
In-Reply-To: <5730FA83.9000608@gmail.com>
References: <5730F02E.6040806@gmail.com>
 <20160509222604.25fa27a8@free-electrons.com>
 <5730FA83.9000608@gmail.com>
Message-ID: <20160509231606.4fb1cde7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 May 2016 23:00:51 +0200, Marco Trapanese wrote:

> Ok, it's reasonable.
> Is there an easy way to find out which package(s) is selecting another?
> I had to copy & paste several times the loooong "selected by" line:

Run "make graph-depends" and look into output/graphs/.

> so it's the last group which selects python2: samba4.
> Right now I've deselected it. Then I will try to understand if it can 
> live with python3.

Most likely not. Samba is a big thing, and making it work with Python 3
is going to be a huge amount of work if it's not done by upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
