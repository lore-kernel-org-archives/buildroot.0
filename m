From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 11 Feb 2016 13:14:55 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <20160210211316.49ec888c@free-electrons.com>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
 <20160210165700.7f97a29c@free-electrons.com>
 <2127002292.1917904.1455121926734.JavaMail.zimbra@datacom.ind.br>
 <20160210174425.592ffaa5@free-electrons.com>
 <574465614.1961308.1455129019177.JavaMail.zimbra@datacom.ind.br>
 <20160210211316.49ec888c@free-electrons.com>
Message-ID: <2029023121.2150924.1455203695371.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, February 10, 2016 6:13:16 PM
> Subject: Re: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC

> Carlos,
> 
> On Wed, 10 Feb 2016 16:30:19 -0200 (BRST), Carlos Santos wrote:
> 
>> Henrique just warned me (offline) about the misunderstanding. The
>> "problem" here is that the patch on configure.ac would not be
>> accepted upstream, since their detection of the atomic operations
>> already works.
> 
> What? It certainly cannot work if they don't link against libatomic.
> Try on an architecture like SPARC, and you will see that if you don't
> link with libatomic, the build will fail.

I tried. It worked on SPARC (with the libatomic patch) but failed on SPARC64 due to a missing declaration of "Atomic64".

I guess their SPARC code aims Solaris, not Linux/buildroot.

Carlos Santos (Casantos)
DATACOM, P&D
