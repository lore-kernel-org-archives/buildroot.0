From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 21:13:16 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <574465614.1961308.1455129019177.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
 <20160210165700.7f97a29c@free-electrons.com>
 <2127002292.1917904.1455121926734.JavaMail.zimbra@datacom.ind.br>
 <20160210174425.592ffaa5@free-electrons.com>
 <574465614.1961308.1455129019177.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160210211316.49ec888c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Wed, 10 Feb 2016 16:30:19 -0200 (BRST), Carlos Santos wrote:

> Henrique just warned me (offline) about the misunderstanding. The
> "problem" here is that the patch on configure.ac would not be
> accepted upstream, since their detection of the atomic operations
> already works.

What? It certainly cannot work if they don't link against libatomic.
Try on an architecture like SPARC, and you will see that if you don't
link with libatomic, the build will fail.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
