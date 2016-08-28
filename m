From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 12:49:33 +0200
Subject: [Buildroot] [PATCH 12/16 v3] core: handle .br-external in a
 make rule
In-Reply-To: <20160827222235.GO5755@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <0994022779466155b22c6e815e737d21c447a528.1468750623.git.yann.morin.1998@free.fr>
 <20160827221613.2c753c17@free-electrons.com>
 <20160827222235.GO5755@free.fr>
Message-ID: <20160828124933.799d0713@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 00:22:35 +0200, Yann E. MORIN wrote:

> > I'm probably missing something, but where is this make target being
> > "triggered" ?  
> 
> When make encounters a -include directive, and the file to be included
> is the target of a rule, then make will trigger the rule before including
> the file, even if the rule is defined after the inclusion (make parses
> makefiles in multiple passes).

Ah, OK. Didn't know that arguments of the include directive where
handled as make targets. Make sense, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
